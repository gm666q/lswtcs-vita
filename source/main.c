#include "config.h"

#include "utils/init.h"
#include "utils/logger.h"
#include "utils/tt_activity.h"
#include "utils/utils.h"

#include "reimpl/keycodes.h"

#include <stdlib.h>

#include <psp2/ctrl.h>
#include <psp2/power.h>
#include <psp2/touch.h>
#include <psp2/kernel/clib.h>
#include <psp2/kernel/threadmgr.h>

#include <falso_jni/FalsoJNI.h>
#include <falso_jni/FalsoJNI_ImplBridge.h>
#include <so_util/so_util.h>
#include <pthread.h>

#define ACTIVITY_CLASS (jclass)0x42424242

int _newlib_heap_size_user = 256 * 1024 * 1024;

#ifdef USE_SCELIBC_IO
int sceLibcHeapSize = 4 * 1024 * 1024;
#endif

TTActivity activity;
so_module so_mod;

typedef struct {
    uint32_t sce_button;
    jint android_button;
} ButtonMapping;

static ButtonMapping mapping[] = {
    {SCE_CTRL_SELECT, AKEYCODE_BUTTON_SELECT},
    {SCE_CTRL_L3, AKEYCODE_BUTTON_THUMBL},
    {SCE_CTRL_R3, AKEYCODE_BUTTON_THUMBR},
    {SCE_CTRL_START, AKEYCODE_BUTTON_START},
    {SCE_CTRL_UP, AKEYCODE_DPAD_UP},
    {SCE_CTRL_RIGHT, AKEYCODE_DPAD_RIGHT},
    {SCE_CTRL_DOWN, AKEYCODE_DPAD_DOWN},
    {SCE_CTRL_LEFT, AKEYCODE_DPAD_LEFT},
    {SCE_CTRL_L2, AKEYCODE_BUTTON_L2},
    {SCE_CTRL_R2, AKEYCODE_BUTTON_R2},
    {SCE_CTRL_L1, AKEYCODE_BUTTON_L1},
    {SCE_CTRL_R1, AKEYCODE_BUTTON_R1},
    {SCE_CTRL_TRIANGLE, AKEYCODE_BUTTON_Y},
    {SCE_CTRL_CIRCLE, AKEYCODE_BUTTON_B},
    {SCE_CTRL_CROSS, AKEYCODE_BUTTON_A},
    {SCE_CTRL_SQUARE, AKEYCODE_BUTTON_X},
    {SCE_CTRL_PSBUTTON, AKEYCODE_HOME},
};

void controls_init() {
    // Enable analog sticks and touchscreen
    sceCtrlSetSamplingModeExt(SCE_CTRL_MODE_ANALOG_WIDE);
    sceTouchSetSamplingState(SCE_TOUCH_PORT_FRONT, SCE_TOUCH_SAMPLING_STATE_START);

    ((void (*)(JNIEnv *, jclass, jboolean)) so_symbol(
        &so_mod, "Java_com_tt_tech_CheckGamepadStatus_nativeSetGamePadConnected"))(&jni, (jobject) 0x42424242, 1);
}

#define BIT_TO_FLOAT(flags, bit) ((flags & bit) == bit ? 1.0f : 0.0f)

void poll_pad() {
    static uint32_t old_buttons = 0;
    static SceCtrlData pad;

    sceCtrlPeekBufferPositiveExt2(0, &pad, 1);

    const uint32_t pressed_buttons = pad.buttons & ~old_buttons;
    const uint32_t released_buttons = ~pad.buttons & old_buttons;

    for (int i = 0; i < sizeof(mapping) / sizeof(ButtonMapping); i++) {
        if ((pressed_buttons & mapping[i].sce_button) == mapping[i].sce_button) {
            activity.nativeOnKeyDown(&jni, ACTIVITY_CLASS, mapping[i].android_button);
        }
        if ((released_buttons & mapping[i].sce_button) == mapping[i].sce_button) {
            activity.nativeOnKeyUp(&jni, ACTIVITY_CLASS, mapping[i].android_button);
        }
    }

    const float hatX = BIT_TO_FLOAT(pad.buttons, SCE_CTRL_RIGHT) - BIT_TO_FLOAT(pad.buttons, SCE_CTRL_LEFT);
    const float hatY = BIT_TO_FLOAT(pad.buttons, SCE_CTRL_DOWN) - BIT_TO_FLOAT(pad.buttons, SCE_CTRL_UP);
    const float lX = (float) pad.lx / 255.0f * 2.0f - 1.0f;
    const float lY = (float) pad.ly / 255.0f * 2.0f - 1.0f;
    const float rX = (float) pad.rx / 255.0f * 2.0f - 1.0f;
    const float rY = (float) pad.ry / 255.0f * 2.0f - 1.0f;

    activity.nativeUpdateGamepadAxisValues(&jni, ACTIVITY_CLASS, hatX, hatY, lX, lY, rX, rY);

    old_buttons = pad.buttons;
}

void poll_touch() {
    static SceUInt8 ids[8] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
    static SceTouchData old_touch, touch;

    sceTouchPeek(SCE_TOUCH_PORT_FRONT, &touch, 1);

    for (SceUInt32 i = 0; i < touch.reportNum; ++i) {
        const SceUInt8 id = touch.report[i].id;
        const float x = (float) touch.report[i].x / 2.0f;
        const float y = (float) touch.report[i].y / 2.0f;

        int is_move = 0;
        for (SceUInt32 j = 0; j < old_touch.reportNum; ++j) {
            if (id == old_touch.report[j].id) {
                is_move = 1;
                break;
            }
        }

        if (is_move == 0) {
            for (size_t j = 0; j < sizeof(ids) / sizeof(SceUInt8); ++j) {
                if (ids[j] == 0xff) {
                    ids[j] = id;
                    activity.nativeOnTouchDown(&jni, ACTIVITY_CLASS, j, j, x, y);
                    break;
                }
            }
        } else {
            for (size_t j = 0; j < sizeof(ids) / sizeof(SceUInt8); ++j) {
                if (ids[j] == id) {
                    activity.nativeOnTouchMove(&jni, ACTIVITY_CLASS, j, j, x, y);
                    break;
                }
            }
        }
    }

    for (SceUInt32 i = 0; i < old_touch.reportNum; ++i) {
        const SceUInt8 id = old_touch.report[i].id;

        int is_up = 1;
        for (SceUInt32 j = 0; j < touch.reportNum; ++j) {
            if (touch.report[j].id == id) {
                is_up = 0;
                break;
            }
        }

        if (is_up == 1) {
            for (size_t j = 0; j < sizeof(ids) / sizeof(SceUInt8); ++j) {
                if (ids[j] == id) {
                    ids[j] = 0xff;
                    activity.nativeOnTouchUp(&jni, ACTIVITY_CLASS, j, j);
                    break;
                }
            }
        }
    }

    sceClibMemcpy(&old_touch, &touch, sizeof(SceTouchData));
}

void *controls_thread() {
    // Move to 4th core if available
    sceKernelChangeThreadCpuAffinityMask(sceKernelGetThreadId(), SCE_KERNEL_CPU_MASK_SYSTEM);

    while (1) {
        poll_touch();
        poll_pad();
        sceKernelDelayThread((1 * 1000 * 1000) / 120);
    }

    sceKernelExitDeleteThread(0);
}

void power_callback(int notifyId, int notifyCount, int powerInfo, void *userData) {
    if ((powerInfo & SCE_POWER_CB_APP_RESUME) == SCE_POWER_CB_APP_RESUME ||
        (powerInfo & SCE_POWER_CB_APP_RESUMING) == SCE_POWER_CB_APP_RESUMING) {
        activity.nativeOnStart(&jni, ACTIVITY_CLASS);
        activity.nativeOnResume(&jni, ACTIVITY_CLASS);
    } else if ((powerInfo & SCE_POWER_CB_BUTTON_PS_PRESS) == SCE_POWER_CB_BUTTON_PS_PRESS ||
               (powerInfo & SCE_POWER_CB_APP_SUSPEND) == SCE_POWER_CB_APP_SUSPEND ||
               (powerInfo & SCE_POWER_CB_SYSTEM_SUSPEND) == SCE_POWER_CB_SYSTEM_SUSPEND) {
        activity.nativeOnPause(&jni, ACTIVITY_CLASS);
        activity.nativeOnStop(&jni, ACTIVITY_CLASS);
    }
}

int callback_thread(SceSize args, void *argp) {
    int cbid = sceKernelCreateCallback("powerCallback", 0, power_callback, NULL);
    int registered = scePowerRegisterCallback(cbid);

    for (;;) {
        sceKernelDelayThreadCB(10 * 1000 * 1000);
    }

    return registered;
}

SceUID callback_init() {
    SceUID thid = sceKernelCreateThread("callbackThread", callback_thread, 0x10000100, 0x10000, 0, 0, NULL);

    if (thid >= 0) {
        sceKernelStartThread(thid, 0, NULL);
    }

    return thid;
}

void tt_activity_on_create() {
    JavaDynArray paths;
    jda_alloc_static(&paths, 4, FIELD_TYPE_OBJECT);
    ((jobject *) paths.array)[0] = ASSET_PACK_AUDIO_PATH;
    ((jobject *) paths.array)[1] = ASSET_PACK_LEVELS_PATH;
    ((jobject *) paths.array)[2] = ASSET_PACK_OTHERS_PATH;
    ((jobject *) paths.array)[3] = ASSET_PACK_TEXTURES_PATH;

    activity.nativeCacheJNIVars(&jni, ACTIVITY_CLASS);
    activity.nativeSetManufacturer(&jni, ACTIVITY_CLASS,ANDROID_OS_BUILD_MANUFACTURER);
    activity.nativeSetModel(&jni, ACTIVITY_CLASS,ANDROID_OS_BUILD_MODEL);
    activity.nativeSetObbInfo(&jni, ACTIVITY_CLASS,OBB_INFO_MAIN_VERSION, OBB_INFO_MAIN_SIZE, OBB_INFO_PATCH_VERSION,
                              OBB_INFO_PATCH_SIZE, APK_VERSION_NAME, OBB_INFO_FORCE_ETC1);
    activity.nativeAddAssetsPath(&jni, ACTIVITY_CLASS, &paths);
    activity.nativeSetCaps(&jni, ACTIVITY_CLASS, 0);

    // startGame
    activity.nativeSetPath(&jni, ACTIVITY_CLASS, ACTIVITY_INTERNAL_PATH);
    activity.nativeSetLanguage(&jni, ACTIVITY_CLASS, (jstring) locale_str());
    activity.nativeSetAndroidVersion(&jni, ACTIVITY_CLASS,ANDROID_OS_BUILD_VERSION_RELEASE);
    activity.nativeSetAssetManager(&jni, ACTIVITY_CLASS, (jobject) 0x24242424);
    activity.nativeOnCreate(&jni, ACTIVITY_CLASS);

    //jda_free(&paths);
}

void tt_activity_surface_changed(jobject surface) {
    activity.nativeSetSurface(&jni, ACTIVITY_CLASS, surface);
    activity.nativeSetScreenDimesions(&jni, ACTIVITY_CLASS, (960.0f / 220.0f) * 25.4f, (544.0f / 220.0f) * 25.4f);
}

void tt_activity_surface_created(jobject surface) {
    activity.nativeSetSurface(&jni, ACTIVITY_CLASS, surface);
}

int main() {
    soloader_init_all();

    ((JNIEXPORT jint(*)(JavaVM *, void *)) so_symbol(&so_mod, "JNI_OnLoad"))(&jvm, NULL);

    controls_init();

    tt_activity_on_create();
    l_info("onCreate passed");
    activity.nativeOnStart(&jni, ACTIVITY_CLASS);
    l_info("onStart passed");
    activity.nativeOnResume(&jni, ACTIVITY_CLASS);
    l_info("onResume passed");

    //callback_init();

    tt_activity_surface_created((jobject) 0x24242424);
    l_info("surfaceCreated passed");
    tt_activity_surface_changed((jobject) 0x24242424);
    l_info("surfaceChanged passed");
    activity.nativeOnWindowFocusChanged(&jni, ACTIVITY_CLASS, 1);
    l_info("onWindowFocusChanged passed");

    // onPause
    // surfaceDestroyed
    // onStop

    pthread_t t;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    pthread_attr_setstacksize(&attr, 256 * 1024);
    pthread_create(&t, &attr, &controls_thread, NULL);
    pthread_detach(t);

    return sceKernelExitDeleteThread(0);
}
