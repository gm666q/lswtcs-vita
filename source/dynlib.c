/*
 * Copyright (C) 2021      Andy Nguyen
 * Copyright (C) 2021      Rinnegatamante
 * Copyright (C) 2022-2024 Volodymyr Atamanenko
 * Copyright (C) 2024      Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

/**
 * @file  dynlib.c
 * @brief Resolving dynamic imports of the .so.
 */

#include <psp2/kernel/clib.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <inttypes.h>
#include <malloc.h>
#include <math.h>
#include <netdb.h>
#include <string.h>
#include <wchar.h>
#include <wctype.h>
#include <zlib.h>
#include <locale.h>

#include <sys/stat.h>
#include <sys/unistd.h>
#include <sys/time.h>

#include <so_util/so_util.h>

#include "utils/glutil.h"
#include "utils/utils.h"
#include "utils/logger.h"

#ifdef USE_SCELIBC_IO
#include <libc_bridge/libc_bridge.h>
#endif

#include <SLES/OpenSLES.h>
#include <SLES/OpenSLES_Android.h>

#include "reimpl/errno.h"
#include "reimpl/io.h"
#include "reimpl/log.h"
#include "reimpl/pthr.h"
#include "reimpl/sys.h"
#include "reimpl/egl.h"
#include "reimpl/gl.h"
#include "reimpl/asset_manager.h"
#include "reimpl/native_window.h"

const unsigned int __page_size = PAGE_SIZE;

extern void *__aeabi_memclr;
extern void *__aeabi_memmove;
extern void *__aeabi_memset4;
extern void *__aeabi_memset8;
extern void *__aeabi_memset;
extern void *__cxa_atexit;
extern void *__cxa_finalize;
extern void *__stack_chk_guard;

extern const short *BIONIC_toupper_tab_;

static FILE __sF_fake[3];

void *dlsym_soloader(void *handle, const char *symbol) {
    // Usage example:
    // if (strcmp("AMotionEvent_getAxisValue", symbol) == 0)
    //    return &AMotionEvent_getAxisValue;

    l_error("dlsym: Unknown symbol \"%s\".", symbol);
    return NULL;
}

so_default_dynlib default_dynlib[] = {
        // Common C/C++ internals
        { "__aeabi_memclr", (uintptr_t)&__aeabi_memclr },
        { "__aeabi_memclr4", (uintptr_t)&__aeabi_memclr },
        { "__aeabi_memclr8", (uintptr_t)&__aeabi_memclr },
        { "__aeabi_memcpy", (uintptr_t)&sceClibMemcpy },
        { "__aeabi_memcpy4", (uintptr_t)&sceClibMemcpy },
        { "__aeabi_memcpy8", (uintptr_t)&sceClibMemcpy },
        { "__aeabi_memmove", (uintptr_t)&__aeabi_memmove },
        { "__aeabi_memmove4", (uintptr_t)&__aeabi_memmove },
        { "__aeabi_memset", (uintptr_t)&__aeabi_memset },
        { "__aeabi_memset4",  (uintptr_t)&__aeabi_memset4 },
        { "__aeabi_memset8", (uintptr_t)&__aeabi_memset8 },
        { "__cxa_atexit", (uintptr_t)&__cxa_atexit },
        { "__cxa_finalize", (uintptr_t)&__cxa_finalize },
        { "__gnu_Unwind_Find_exidx", (uintptr_t)&ret0 },
        { "__sF", (uintptr_t)&__sF_fake },
        { "__stack_chk_fail", (uintptr_t)&__stack_chk_fail_soloader },
        { "__stack_chk_guard", (uintptr_t)&__stack_chk_guard },


        // ctype
        { "_toupper_tab_", (uintptr_t)&BIONIC_toupper_tab_ },


        // Android SDK standard logging
        { "__android_log_print", (uintptr_t)&__android_log_print },


        // AAssetManager
        { "AAsset_close", (uintptr_t)&AAsset_close },
        { "AAsset_getLength", (uintptr_t)&AAsset_getLength },
        { "AAsset_read", (uintptr_t)&AAsset_read },
        { "AAsset_seek", (uintptr_t)&AAsset_seek },
        { "AAssetManager_fromJava", (uintptr_t)&ret1 },
        { "AAssetManager_open", (uintptr_t)&AAssetManager_open },


        // ANativeWindow
        { "ANativeWindow_fromSurface",        (uintptr_t) &ret1 },
        { "ANativeWindow_getHeight",          (uintptr_t) &ANativeWindow_getHeight },
        { "ANativeWindow_getWidth",           (uintptr_t) &ANativeWindow_getWidth },
        { "ANativeWindow_setBuffersGeometry", (uintptr_t) &ANativeWindow_setBuffersGeometry },


        // Math
        { "acos", (uintptr_t)&acos },
        { "asin", (uintptr_t)&asin },
        { "atan", (uintptr_t)&atan },
        { "atan2f", (uintptr_t)&atan2f },
        { "ceil", (uintptr_t)&ceil },
        { "ceilf", (uintptr_t)&ceilf },
        { "cos", (uintptr_t)&cos },
        { "cosf", (uintptr_t)&cosf },
        { "exp", (uintptr_t)&exp },
        { "expf", (uintptr_t)&expf },
        { "floor", (uintptr_t)&floor },
        { "floorf", (uintptr_t)&floorf },
        { "ldexp", (uintptr_t)&ldexp },
        { "log", (uintptr_t)&log },
        { "log10", (uintptr_t)&log10 },
        { "pow", (uintptr_t)&pow },
        { "powf", (uintptr_t)&powf },
        { "rint", (uintptr_t)&rint },
        { "sin", (uintptr_t)&sin },
        { "sinf", (uintptr_t)&sinf },
        { "sqrt", (uintptr_t)&sqrt },
        { "sqrtf", (uintptr_t)&sqrtf },


        // Memory
        { "calloc", (uintptr_t)&calloc },
        { "free", (uintptr_t)&free },
        { "malloc", (uintptr_t)&malloc },
        { "memcmp", (uintptr_t)&memcmp },
        { "memcpy", (uintptr_t)&sceClibMemcpy },
        { "memmove", (uintptr_t)&memmove },
        { "memset", (uintptr_t)&memset },
        { "realloc", (uintptr_t)&realloc },


        // IO
        { "close", (uintptr_t)&close_soloader },
        { "fclose", (uintptr_t)&fclose_soloader },
        { "fopen", (uintptr_t)&fopen_soloader },

        #ifdef USE_SCELIBC_IO
            { "fflush", (uintptr_t)&sceLibcBridge_fflush },
            { "fputc", (uintptr_t)&sceLibcBridge_fputc },
            { "fputs", (uintptr_t)&sceLibcBridge_fputs },
            { "fread", (uintptr_t)&sceLibcBridge_fread },
            { "fseek", (uintptr_t)&sceLibcBridge_fseek },
            { "ftell", (uintptr_t)&sceLibcBridge_ftell },
            { "fwrite", (uintptr_t)&sceLibcBridge_fwrite },
            { "putc", (uintptr_t)&sceLibcBridge_putc },
            { "putchar", (uintptr_t)&sceLibcBridge_putchar },
            { "puts", (uintptr_t)&sceLibcBridge_puts },
        #else
            { "fflush", (uintptr_t)&fflush },
            { "fputc", (uintptr_t)&fputc },
            { "fputs", (uintptr_t)&fputs },
            { "fread", (uintptr_t)&fread },
            { "fseek", (uintptr_t)&fseek },
            { "ftell", (uintptr_t)&ftell },
            { "fwrite", (uintptr_t)&fwrite },
            { "putc", (uintptr_t)&putc },
            { "putchar", (uintptr_t)&putchar },
            { "puts", (uintptr_t)&puts },
        #endif

        { "chdir", (uintptr_t)&chdir_soloader },
        { "mkdir", (uintptr_t)&mkdir_soloader },
        { "remove", (uintptr_t)&remove_soloader },
        { "rename", (uintptr_t)&rename_soloader },
        { "write", (uintptr_t)&write },


        // *printf, *scanf
        { "snprintf", (uintptr_t)&snprintf },
        { "vsnprintf", (uintptr_t)&vsnprintf },
        { "vsprintf", (uintptr_t)&vsprintf },
        { "printf", (uintptr_t)&sceClibPrintf },

        #ifdef USE_SCELIBC_IO
            { "sscanf", (uintptr_t)&sceLibcBridge_sscanf },
            { "vfprintf", (uintptr_t)&sceLibcBridge_vfprintf },
        #else
            { "sscanf", (uintptr_t)&sscanf },
            { "vfprintf", (uintptr_t)&vfprintf },
        #endif


        // EGL
        { "eglBindAPI", (uintptr_t)&eglBindAPI },
        { "eglChooseConfig", (uintptr_t)&eglChooseConfig },
        { "eglCreateContext", (uintptr_t)&eglCreateContext },
        { "eglCreatePbufferSurface", (uintptr_t)&eglCreatePbufferSurface },
        { "eglCreateWindowSurface", (uintptr_t)&eglCreateWindowSurface },
        { "eglDestroySurface", (uintptr_t)&eglDestroySurface },
        { "eglGetConfigAttrib", (uintptr_t)&eglGetConfigAttrib },
        { "eglGetDisplay", (uintptr_t)&eglGetDisplay },
        { "eglGetError", (uintptr_t)&eglGetError },
        { "eglGetProcAddress", (uintptr_t)&eglGetProcAddress },
        { "eglInitialize", (uintptr_t)&eglInitialize },
        { "eglMakeCurrent", (uintptr_t)&eglMakeCurrent },
        { "eglQuerySurface", (uintptr_t)&eglQuerySurface },
        { "eglSwapBuffers", (uintptr_t)&eglSwapBuffers },


        // OpenGL
        { "glActiveTexture", (uintptr_t)&glActiveTexture_soloader },
        { "glAttachShader", (uintptr_t)&glAttachShader },
        { "glBindAttribLocation", (uintptr_t)&glBindAttribLocation },
        { "glBindBuffer", (uintptr_t)&glBindBuffer_soloader },
        { "glBindFramebuffer", (uintptr_t)&glBindFramebuffer },
        { "glBindTexture", (uintptr_t)&glBindTexture_soloader },
        { "glBlendEquationSeparate", (uintptr_t)&glBlendEquationSeparate },
        { "glBlendFuncSeparate", (uintptr_t)&glBlendFuncSeparate },
        { "glBufferData", (uintptr_t)&glBufferData_soloader },
        { "glBufferSubData", (uintptr_t)&glBufferSubData_soloader },
        { "glCheckFramebufferStatus", (uintptr_t)&glCheckFramebufferStatus },
        { "glClear", (uintptr_t)&glClear },
        { "glClearColor", (uintptr_t)&glClearColor },
        { "glCompileShader", (uintptr_t)&glCompileShader_soloader },
        { "glCompressedTexImage2D", (uintptr_t)&glCompressedTexImage2D_soloader },
        { "glCopyTexImage2D", (uintptr_t)&glCopyTexImage2D_soloader },
        { "glCreateProgram", (uintptr_t)&glCreateProgram },
        { "glCreateShader", (uintptr_t)&glCreateShader },
        { "glCullFace", (uintptr_t)&glCullFace },
        { "glDeleteBuffers", (uintptr_t)&glDeleteBuffers },
        { "glDeleteFramebuffers", (uintptr_t)&glDeleteFramebuffers },
        { "glDeleteProgram", (uintptr_t)&glDeleteProgram },
        { "glDeleteRenderbuffers", (uintptr_t)&glDeleteRenderbuffers },
        { "glDeleteShader", (uintptr_t)&glDeleteShader },
        { "glDeleteTextures", (uintptr_t)&glDeleteTextures },
        { "glDepthFunc", (uintptr_t)&glDepthFunc },
        { "glDepthMask", (uintptr_t)&glDepthMask },
        { "glDisable", (uintptr_t)&glDisable },
        { "glDisableVertexAttribArray", (uintptr_t)&glDisableVertexAttribArray },
        { "glDrawArrays", (uintptr_t)&glDrawArrays },
        { "glDrawElements", (uintptr_t)&glDrawElements },
        { "glEnable", (uintptr_t)&glEnable },
        { "glEnableVertexAttribArray", (uintptr_t)&glEnableVertexAttribArray },
        { "glFinish", (uintptr_t)&glFinish },
        { "glFlush", (uintptr_t)&glFlush },
        { "glFrontFace", (uintptr_t)&glFrontFace },
        { "glGenBuffers", (uintptr_t)&glGenBuffers },
        { "glGenerateMipmap", (uintptr_t)&glGenerateMipmap_soloader },
        { "glGenFramebuffers", (uintptr_t)&glGenFramebuffers },
        { "glGenTextures", (uintptr_t)&glGenTextures },
        { "glGetActiveAttrib", (uintptr_t)&glGetActiveAttrib },
        { "glGetActiveUniform", (uintptr_t)&glGetActiveUniform },
        { "glGetAttachedShaders", (uintptr_t)&glGetAttachedShaders },
        { "glGetAttribLocation", (uintptr_t)&glGetAttribLocation },
        { "glGetError", (uintptr_t)&glGetError },
        { "glGetIntegerv", (uintptr_t)&glGetIntegerv_soloader },
        { "glGetProgramInfoLog", (uintptr_t)&glGetProgramInfoLog },
        { "glGetProgramiv", (uintptr_t)&glGetProgramiv },
        { "glGetShaderSource", (uintptr_t)&glGetShaderSource },
        { "glGetShaderiv", (uintptr_t)&glGetShaderiv },
        { "glGetString", (uintptr_t)&glGetString_soloader },
        { "glGetUniformLocation", (uintptr_t)&glGetUniformLocation_soloader },
        { "glGetVertexAttribiv", (uintptr_t)&glGetVertexAttribiv },
        { "glGetVertexAttribPointerv", (uintptr_t)&glGetVertexAttribPointerv },
        { "glLinkProgram", (uintptr_t)&glLinkProgram },
        { "glReleaseShaderCompiler", (uintptr_t)&glReleaseShaderCompiler },
        { "glShaderSource", (uintptr_t)&glShaderSource_soloader },
        { "glTexImage2D", (uintptr_t)&glTexImage2D_soloader },
        { "glTexParameteri", (uintptr_t)&glTexParameteri_soloader },
        { "glUniform1fv", (uintptr_t)&glUniform1fv_soloader },
        { "glUniform1i", (uintptr_t)&glUniform1i_soloader },
        { "glUniform2fv", (uintptr_t)&glUniform2fv_soloader },
        { "glUniform3fv", (uintptr_t)&glUniform3fv_soloader },
        { "glUniform4fv", (uintptr_t)&glUniform4fv_soloader },
        { "glUseProgram", (uintptr_t)&glUseProgram_soloader },
        { "glValidateProgram", (uintptr_t)&ret0 },
        { "glVertexAttribPointer", (uintptr_t)&glVertexAttribPointer },
        { "glViewport", (uintptr_t)&glViewport },


        // OpenSL ES
        { "SL_IID_ANDROIDSIMPLEBUFFERQUEUE", (uintptr_t)&SL_IID_ANDROIDSIMPLEBUFFERQUEUE },
        { "SL_IID_ENGINE", (uintptr_t)&SL_IID_ENGINE },
        { "SL_IID_ENGINECAPABILITIES", (uintptr_t)&SL_IID_ENGINECAPABILITIES },
        { "SL_IID_ENVIRONMENTALREVERB", (uintptr_t)&SL_IID_ENVIRONMENTALREVERB },
        { "SL_IID_PLAY", (uintptr_t)&SL_IID_PLAY },
        { "SL_IID_VOLUME", (uintptr_t)&SL_IID_VOLUME },
        { "slCreateEngine", (uintptr_t)&slCreateEngine },


        // Pthread
        { "pthread_attr_destroy", (uintptr_t)&pthread_attr_destroy_soloader },
        { "pthread_attr_init", (uintptr_t) &pthread_attr_init_soloader },
        { "pthread_attr_setdetachstate", (uintptr_t) &pthread_attr_setdetachstate_soloader },
        { "pthread_attr_setstacksize", (uintptr_t) &pthread_attr_setstacksize_soloader },
        { "pthread_attr_setschedparam", (uintptr_t) &ret0 },

        { "pthread_cond_broadcast", (uintptr_t) &pthread_cond_broadcast_soloader },
        { "pthread_cond_destroy", (uintptr_t) &pthread_cond_destroy_soloader },
        { "pthread_cond_init", (uintptr_t) &pthread_cond_init_soloader },
        { "pthread_cond_signal", (uintptr_t) &pthread_cond_signal_soloader },
        { "pthread_cond_wait", (uintptr_t) &pthread_cond_wait_soloader },

        { "pthread_create", (uintptr_t) &pthread_create_soloader },
        { "pthread_exit", (uintptr_t)&pthread_exit },
        { "pthread_getschedparam", (uintptr_t) &pthread_getschedparam_soloader },
        { "pthread_getspecific", (uintptr_t)&pthread_getspecific },
        { "pthread_key_create", (uintptr_t)&pthread_key_create },
        { "pthread_key_delete", (uintptr_t)&pthread_key_delete },

        { "pthread_mutex_destroy", (uintptr_t) &pthread_mutex_destroy_soloader },
        { "pthread_mutex_init", (uintptr_t) &pthread_mutex_init_soloader },
        { "pthread_mutex_lock", (uintptr_t) &pthread_mutex_lock_soloader },
        { "pthread_mutex_unlock", (uintptr_t) &pthread_mutex_unlock_soloader },
        { "pthread_mutexattr_destroy", (uintptr_t) &pthread_mutexattr_destroy_soloader },
        { "pthread_mutexattr_init", (uintptr_t) &pthread_mutexattr_init_soloader },
        { "pthread_mutexattr_settype", (uintptr_t) &pthread_mutexattr_settype_soloader },
        { "pthread_once", (uintptr_t)&pthread_once_soloader },

        { "pthread_self", (uintptr_t) &pthread_self_soloader },
        { "pthread_setspecific", (uintptr_t)&pthread_setspecific },

        { "sched_yield", (uintptr_t)&sched_yield },


        // wchar, wctype
        { "btowc", (uintptr_t)&btowc },


        // libdl
        { "dlclose", (uintptr_t)&ret0 },
        { "dlerror", (uintptr_t)&ret0 },
        { "dlopen", (uintptr_t)&ret1 },
        { "dlsym", (uintptr_t)&dlsym_soloader },


        // Errno
        { "__errno", (uintptr_t)&__errno_soloader },


        // Strings
        { "memchr", (uintptr_t)&memchr },
        { "strcat", (uintptr_t)&strcat },
        { "strchr", (uintptr_t)&strchr },
        { "strcmp", (uintptr_t)&strcmp },
        { "strcpy", (uintptr_t)&strcpy },
        { "strlen", (uintptr_t)&strlen },
        { "strncmp", (uintptr_t)&strncmp },
        { "strncpy", (uintptr_t)&strncpy },
        { "strrchr", (uintptr_t)&strrchr },


        // Syscalls
        { "syscall", (uintptr_t)&syscall },


        // Time
        { "clock_gettime", (uintptr_t)&clock_gettime_soloader },
        { "nanosleep", (uintptr_t)&nanosleep },


        // stdlib
        { "abort", (uintptr_t)&abort_soloader },
        { "exit", (uintptr_t)&exit_soloader },
        { "lrand48", (uintptr_t)&lrand48 },
        { "srand48", (uintptr_t)&srand48 },

        #ifdef USE_SCELIBC_IO
            { "qsort", (uintptr_t)&sceLibcBridge_qsort },
        #else
            { "qsort", (uintptr_t)&qsort },
        #endif


        // Signals
        { "raise", (uintptr_t)&raise },
};

void resolve_imports(so_module* mod) {
    __sF_fake[0] = *stdin;
    __sF_fake[1] = *stdout;
    __sF_fake[2] = *stderr;

    so_resolve(mod, default_dynlib, sizeof(default_dynlib), 0);
}
