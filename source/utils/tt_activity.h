/*
 * Copyright (C) 2024      Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

#ifndef SOLOADER_TT_ACTIVITY_H
#define SOLOADER_TT_ACTIVITY_H

#include <falso_jni/jni.h>

typedef struct TTActivity {
    void (*nativeAddAssetsPath)(JNIEnv *, jclass, jobjectArray);

    void (*nativeCacheJNIVars)(JNIEnv *, jclass);

    void (*nativeOnCreate)(JNIEnv *, jclass);

    void (*nativeOnKeyDown)(JNIEnv *, jclass, jint);

    void (*nativeOnKeyUp)(JNIEnv *, jclass, jint);

    void (*nativeOnPause)(JNIEnv *, jclass);

    void (*nativeOnResume)(JNIEnv *, jclass);

    void (*nativeOnSensorUpdate)(JNIEnv *, jclass, jint, jfloat, jfloat, jfloat);

    void (*nativeOnStart)(JNIEnv *, jclass);

    void (*nativeOnStop)(JNIEnv *, jclass);

    void (*nativeOnTouchDown)(JNIEnv *, jclass, jint, jint, jfloat, jfloat);

    void (*nativeOnTouchMove)(JNIEnv *, jclass, jint, jint, jfloat, jfloat);

    void (*nativeOnTouchUp)(JNIEnv *, jclass, jint, jint);

    void (*nativeOnWindowFocusChanged)(JNIEnv *, jclass, jboolean);

    void (*nativeSetAndroidVersion)(JNIEnv *, jclass, jstring);

    void (*nativeSetAssetManager)(JNIEnv *, jclass, jobject);

    void (*nativeSetCaps)(JNIEnv *, jclass, jint);

    void (*nativeSetLanguage)(JNIEnv *, jclass, jstring);

    void (*nativeSetManufacturer)(JNIEnv *, jclass, jstring);

    void (*nativeSetModel)(JNIEnv *, jclass, jstring);

    void (*nativeSetObbInfo)(JNIEnv *, jclass, jint, jint, jint, jint, jstring, jint);

    void (*nativeSetPath)(JNIEnv *, jclass, jstring);

    void (*nativeSetScreenDimesions)(JNIEnv *, jclass, jfloat, jfloat);

    void (*nativeSetSurface)(JNIEnv *, jclass, jobject);

    void (*nativeUpdateGamepadAxisValues)(JNIEnv *, jclass, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat);
} TTActivity;

void tt_activity_init();

#endif // SOLOADER_TT_ACTIVITY_H
