/*
 * Copyright (C) 2023 Volodymyr Atamanenko
 * Copyright (C) 2024 Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

/**
 * @file  patch.c
 * @brief Patching some of the .so internal functions or bridging them to native
 *        for better compatibility.
 */

#include <stdbool.h>

#include <psp2/kernel/threadmgr.h>

#include <kubridge.h>
#include <so_util/so_util.h>

#include "reimpl/native_window.h"
#include "utils/logger.h"

typedef uint8_t NuRenderDevice;

extern so_module so_mod;

#ifdef DEBUG
uint32_t _NuCheckGLErrors(const char *msg) {
    l_error("_NuCheckGLErrors(%s)", msg);
    return 0;
}
#endif

so_hook _Z11AndroidMainPv_hook;

// AndroidMain(void*)
void *_Z11AndroidMainPv(void *param_1) {
    sceKernelChangeThreadCpuAffinityMask(sceKernelGetThreadId(), SCE_KERNEL_CPU_MASK_USER_0);
    return SO_CONTINUE(void*, _Z11AndroidMainPv_hook, param_1);
}

so_hook _Z17renderThread_mainPv_hook;

// renderThread_main(void*)
void *_Z17renderThread_mainPv(void *param_1) {
    sceKernelChangeThreadCpuAffinityMask(sceKernelGetThreadId(), SCE_KERNEL_CPU_MASK_USER_1);
    return SO_CONTINUE(void*, _Z17renderThread_mainPv_hook, param_1);
}

so_hook _ZN8NuThread10ThreadMainEPv_hook;

// NuThread::ThreadMain(void*)
void *_ZN8NuThread10ThreadMainEPv(void *param_1) {
    sceKernelChangeThreadCpuAffinityMask(sceKernelGetThreadId(), SCE_KERNEL_CPU_MASK_USER_2);
    return SO_CONTINUE(void*, _ZN8NuThread10ThreadMainEPv_hook, param_1);
}

so_hook _ZN14NuRenderDevice23InitialiseOpenGLContextEP13ANativeWindow_hook;

// NuRenderDevice::InitialiseOpenGLContext(ANativeWindow*)
void _ZN14NuRenderDevice23InitialiseOpenGLContextEP13ANativeWindow(NuRenderDevice *this, ANativeWindow *nativeWindow) {
    // Patch PBuffer usage
    this[0x54] = 0x00;
    SO_CONTINUE(void*, _ZN14NuRenderDevice23InitialiseOpenGLContextEP13ANativeWindow_hook, this, nativeWindow);
}

// Java Call
bool IsMusicActive(void) {
    return false;
}

#ifdef DEBUG
so_hook NuFileOpen_hook;

int NuFileOpen(char *param_1, int param_2) {
    int ret = SO_CONTINUE(int, NuFileOpen_hook, param_1, param_2);

    if (ret)
        l_debug("NuFileOpen(%s, %d): %d", param_1, param_2, ret);
    else
        l_warn("NuFileOpen(%s, %d): %d", param_1, param_2, ret);

    return ret;
}
#endif

// Java Call
void NuIOS_RecordFlurryEvent(const char *param_1) {
    l_debug("[ALOG][%s] [FLURRY] Event: %s", "TT", param_1);
}

void so_patch(void) {
#ifdef DEBUG
    hook_addr((uintptr_t) so_symbol(&so_mod, "_NuCheckGLErrors"), (uintptr_t) &_NuCheckGLErrors);
#endif

    _Z11AndroidMainPv_hook = hook_addr((uintptr_t) so_symbol(&so_mod, "_Z11AndroidMainPv"),
                                       (uintptr_t) &_Z11AndroidMainPv);
    _Z17renderThread_mainPv_hook = hook_addr((uintptr_t) so_symbol(&so_mod, "_Z17renderThread_mainPv"),
                                             (uintptr_t) &_Z17renderThread_mainPv);
    _ZN8NuThread10ThreadMainEPv_hook = hook_addr((uintptr_t) so_symbol(&so_mod, "_ZN8NuThread10ThreadMainEPv"),
                                                 (uintptr_t) &_ZN8NuThread10ThreadMainEPv);
    _ZN14NuRenderDevice23InitialiseOpenGLContextEP13ANativeWindow_hook = hook_addr(
        (uintptr_t) so_symbol(&so_mod, "_ZN14NuRenderDevice23InitialiseOpenGLContextEP13ANativeWindow"),
        (uintptr_t) &_ZN14NuRenderDevice23InitialiseOpenGLContextEP13ANativeWindow);

    hook_addr((uintptr_t) so_symbol(&so_mod, "IsMusicActive"), (uintptr_t) &IsMusicActive);

#ifdef DEBUG
    NuFileOpen_hook = hook_addr((uintptr_t) so_symbol(&so_mod, "NuFileOpen"), (uintptr_t) &NuFileOpen);
#endif

    hook_addr((uintptr_t) so_symbol(&so_mod, "NuIOS_RecordFlurryEvent"), (uintptr_t) &NuIOS_RecordFlurryEvent);
}
