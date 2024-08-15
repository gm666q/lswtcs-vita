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

void __assert2(const char *file, int line, const char *function, const char *failed_expression) {
    l_fatal("%s:%d: %s: assertion \"%s\" failed", file, line, function, failed_expression);
    //abort();
}

void *__memcpy_chk(void *dst, const void *src, size_t count, size_t dst_len) {
    return memcpy(dst, src, count);
}

void *__memmove_chk(void *dst, const void *src, size_t len, size_t dst_len) {
    return memmove(dst, src, len);
}

void *__memset_chk(void *dest, int c, size_t n, size_t dest_len) {
    return memset(dest, c, n);
}

char *__strcat_chk(char *dest, const char *src, size_t dest_buf_size) {
    return strcat(dest, src);
}

char *__strcpy_chk(char *dest, const char *src, size_t dest_len) {
    return strcpy(dest, src);
}

size_t __strlen_chk(const char *s, size_t s_len) {
    return strlen(s);
}

char *__strrchr_chk(const char *p, int ch, size_t s_len) {
    return strrchr(p, ch);
}

int __vsprintf_chk(char *dst, int flags, size_t dst_len_from_compiler, const char *format, va_list va) {
    return vsprintf(dst, format, va);
}

void *dlsym_soloader(void *handle, const char *symbol) {
    // Usage example:
    // if (strcmp("AMotionEvent_getAxisValue", symbol) == 0)
    //    return &AMotionEvent_getAxisValue;

    l_error("dlsym: Unknown symbol \"%s\".", symbol);
    return NULL;
}

int posix_memalign(void **memptr, size_t alignment, size_t size) {

    void *ret = memalign(alignment, size);
    if (ret == NULL) {
        return errno;
    }
    *memptr = ret;
    return 0;
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
        { "__aeabi_memset4", (uintptr_t)&__aeabi_memset4 },
        { "__aeabi_memset8", (uintptr_t)&__aeabi_memset8 },
        { "__assert2", (uintptr_t)&__assert2 },
        { "__cxa_atexit", (uintptr_t)&__cxa_atexit },
        { "__cxa_finalize", (uintptr_t)&__cxa_finalize },
        { "__gnu_Unwind_Find_exidx", (uintptr_t)&ret0 },
        { "__memcpy_chk", (uintptr_t)&__memcpy_chk },
        { "__memmove_chk", (uintptr_t)&__memmove_chk },
        { "__memset_chk", (uintptr_t)&__memset_chk },
        { "__sF", (uintptr_t)&__sF_fake },
        { "__stack_chk_fail", (uintptr_t)&__stack_chk_fail_soloader },
        { "__stack_chk_guard", (uintptr_t)&__stack_chk_guard },
        { "__strcat_chk", (uintptr_t)&__strcat_chk },
        { "__strcpy_chk", (uintptr_t)&__strcpy_chk },
        { "__strlen_chk", (uintptr_t)&__strlen_chk },
        { "__strrchr_chk", (uintptr_t)&__strrchr_chk },
        { "__vsprintf_chk", (uintptr_t)&__vsprintf_chk },


        // ctype
        { "_toupper_tab_", (uintptr_t)&BIONIC_toupper_tab_ },
        { "isblank", (uintptr_t)&isblank },
        { "islower", (uintptr_t)&islower },
        { "isupper", (uintptr_t)&isupper },
        { "isxdigit", (uintptr_t)&isxdigit },
        { "tolower", (uintptr_t)&tolower },
        { "toupper", (uintptr_t)&toupper },


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
        { "ANativeWindow_fromSurface", (uintptr_t)&ret1 },
        { "ANativeWindow_getHeight", (uintptr_t)&ANativeWindow_getHeight },
        { "ANativeWindow_getWidth", (uintptr_t)&ANativeWindow_getWidth },
        { "ANativeWindow_setBuffersGeometry", (uintptr_t)&ANativeWindow_setBuffersGeometry },


        // Math
        { "acos", (uintptr_t)&acos },
        { "acosf", (uintptr_t)&acosf },
        { "asin", (uintptr_t)&asin },
        { "asinf", (uintptr_t)&asinf },
        { "atan", (uintptr_t)&atan },
        { "atan2f", (uintptr_t)&atan2f },
        { "atanf", (uintptr_t)&atanf },
        { "ceil", (uintptr_t)&ceil },
        { "ceilf", (uintptr_t)&ceilf },
        { "cos", (uintptr_t)&cos },
        { "cosf", (uintptr_t)&cosf },
        { "exp", (uintptr_t)&exp },
        { "expf", (uintptr_t)&expf },
        { "floor", (uintptr_t)&floor },
        { "floorf", (uintptr_t)&floorf },
        { "ldexp", (uintptr_t)&ldexp },
        { "ldexpf", (uintptr_t)&ldexpf },
        { "log", (uintptr_t)&log },
        { "log10", (uintptr_t)&log10 },
        { "log10f", (uintptr_t)&log10f },
        { "logf", (uintptr_t)&logf },
        { "pow", (uintptr_t)&pow },
        { "powf", (uintptr_t)&powf },
        { "rint", (uintptr_t)&rint },
        { "rintf", (uintptr_t)&rintf },
        { "sin", (uintptr_t)&sin },
        { "sincos", (uintptr_t)&sincos },
        { "sincosf", (uintptr_t)&sincosf },
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
        { "open", (uintptr_t)&open_soloader },

        #ifdef USE_SCELIBC_IO
            { "fflush", (uintptr_t)&sceLibcBridge_fflush },
            { "fputc", (uintptr_t)&sceLibcBridge_fputc },
            { "fputs", (uintptr_t)&sceLibcBridge_fputs },
            { "fread", (uintptr_t)&sceLibcBridge_fread },
            { "fseek", (uintptr_t)&sceLibcBridge_fseek },
            { "ftell", (uintptr_t)&sceLibcBridge_ftell },
            { "fwrite", (uintptr_t)&sceLibcBridge_fwrite },
            { "getc", (uintptr_t)&sceLibcBridge_getc },
            { "putc", (uintptr_t)&sceLibcBridge_putc },
            { "putchar", (uintptr_t)&sceLibcBridge_putchar },
            { "puts", (uintptr_t)&sceLibcBridge_puts },
            { "ungetc", (uintptr_t)&sceLibcBridge_ungetc },
        #else
            { "fflush", (uintptr_t)&fflush },
            { "fputc", (uintptr_t)&fputc },
            { "fputs", (uintptr_t)&fputs },
            { "fread", (uintptr_t)&fread },
            { "fseek", (uintptr_t)&fseek },
            { "ftell", (uintptr_t)&ftell },
            { "fwrite", (uintptr_t)&fwrite },
            { "getc", (uintptr_t)&getc },
            { "putc", (uintptr_t)&putc },
            { "putchar", (uintptr_t)&putchar },
            { "puts", (uintptr_t)&puts },
            { "ungetc", (uintptr_t)&ungetc },
        #endif

        { "chdir", (uintptr_t)&chdir_soloader },
        { "mkdir", (uintptr_t)&mkdir_soloader },
        { "read", (uintptr_t)&read },
        { "remove", (uintptr_t)&remove_soloader },
        { "rename", (uintptr_t)&rename_soloader },
        { "write", (uintptr_t)&write },


        // *printf, *scanf
        { "snprintf", (uintptr_t)&snprintf },
        { "vasprintf", (uintptr_t)&vasprintf },
        { "vsnprintf", (uintptr_t)&vsnprintf },
        { "vsprintf", (uintptr_t)&vsprintf },
        { "vsscanf", (uintptr_t)&vsscanf },
        { "printf", (uintptr_t)&sceClibPrintf },
        { "swprintf", (uintptr_t)&swprintf },

        #ifdef USE_SCELIBC_IO
            { "fprintf", (uintptr_t)&sceLibcBridge_fprintf },
            { "sscanf", (uintptr_t)&sceLibcBridge_sscanf },
            { "vfprintf", (uintptr_t)&sceLibcBridge_vfprintf },
        #else
            { "fprintf", (uintptr_t)&fprintf },
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
        { "pthread_attr_init", (uintptr_t)&pthread_attr_init_soloader },
        { "pthread_attr_setdetachstate", (uintptr_t)&pthread_attr_setdetachstate_soloader },
        { "pthread_attr_setstacksize", (uintptr_t)&pthread_attr_setstacksize_soloader },
        { "pthread_attr_setschedparam", (uintptr_t)&ret0 },

        { "pthread_cond_broadcast", (uintptr_t)&pthread_cond_broadcast_soloader },
        { "pthread_cond_destroy", (uintptr_t)&pthread_cond_destroy_soloader },
        { "pthread_cond_init", (uintptr_t)&pthread_cond_init_soloader },
        { "pthread_cond_signal", (uintptr_t)&pthread_cond_signal_soloader },
        { "pthread_cond_timedwait", (uintptr_t)&pthread_cond_timedwait_soloader },
        { "pthread_cond_wait", (uintptr_t)&pthread_cond_wait_soloader },

        { "pthread_create", (uintptr_t)&pthread_create_soloader },
        { "pthread_detach", (uintptr_t)&pthread_detach_soloader },
        { "pthread_equal", (uintptr_t)&pthread_equal_soloader },
        { "pthread_exit", (uintptr_t)&pthread_exit },
        { "pthread_getschedparam", (uintptr_t)&pthread_getschedparam_soloader },
        { "pthread_getspecific", (uintptr_t)&pthread_getspecific },
        { "pthread_join", (uintptr_t)&pthread_join_soloader },
        { "pthread_key_create", (uintptr_t)&pthread_key_create },
        { "pthread_key_delete", (uintptr_t)&pthread_key_delete },

        { "pthread_mutex_destroy", (uintptr_t)&pthread_mutex_destroy_soloader },
        { "pthread_mutex_init", (uintptr_t)&pthread_mutex_init_soloader },
        { "pthread_mutex_lock", (uintptr_t)&pthread_mutex_lock_soloader },
        { "pthread_mutex_trylock", (uintptr_t)&pthread_mutex_trylock_soloader },
        { "pthread_mutex_unlock", (uintptr_t)&pthread_mutex_unlock_soloader },
        { "pthread_mutexattr_destroy", (uintptr_t)&pthread_mutexattr_destroy_soloader },
        { "pthread_mutexattr_init", (uintptr_t)&pthread_mutexattr_init_soloader },
        { "pthread_mutexattr_settype", (uintptr_t)&pthread_mutexattr_settype_soloader },
        { "pthread_once", (uintptr_t)&pthread_once_soloader },

        { "pthread_self", (uintptr_t)&pthread_self_soloader },
        { "pthread_setspecific", (uintptr_t)&pthread_setspecific },

        { "sched_yield", (uintptr_t)&sched_yield },


        // wchar, wctype
        { "btowc", (uintptr_t)&btowc },
        { "iswalpha", (uintptr_t)&iswalpha },
        { "iswcntrl", (uintptr_t)&iswcntrl },
        { "iswdigit", (uintptr_t)&iswdigit },
        { "iswlower", (uintptr_t)&iswlower },
        { "iswprint", (uintptr_t)&iswprint },
        { "iswpunct", (uintptr_t)&iswpunct },
        { "iswspace", (uintptr_t)&iswspace },
        { "iswupper", (uintptr_t)&iswupper },
        { "iswxdigit", (uintptr_t)&iswxdigit },
        { "mbrlen", (uintptr_t)&mbrlen },
        { "mbrtowc", (uintptr_t)&mbrtowc },
        { "mbsnrtowcs", (uintptr_t)&mbsnrtowcs },
        { "mbsrtowcs", (uintptr_t)&mbsrtowcs },
        { "mbtowc", (uintptr_t)&mbtowc },
        { "towlower", (uintptr_t)&towlower },
        { "towupper", (uintptr_t)&towupper },
        { "wcrtomb", (uintptr_t)&wcrtomb },
        { "wcscoll", (uintptr_t)&wcscoll },
        { "wcslen", (uintptr_t)&wcslen },
        { "wcsnrtombs", (uintptr_t)&wcsnrtombs },
        { "wcstod", (uintptr_t)&wcstod },
        { "wcstof", (uintptr_t)&wcstof },
        { "wcstol", (uintptr_t)&wcstol },
        { "wcstoll", (uintptr_t)&wcstoll },
        { "wcstoul", (uintptr_t)&wcstoul },
        { "wcstoull", (uintptr_t)&wcstoull },
        { "wcsxfrm", (uintptr_t)&wcsxfrm },
        { "wctob", (uintptr_t)&wctob },
        { "wmemchr", (uintptr_t)&wmemchr },
        { "wmemcmp", (uintptr_t)&wmemcmp },
        { "wmemcpy", (uintptr_t)&wmemcpy },
        { "wmemmove", (uintptr_t)&wmemmove },
        { "wmemset", (uintptr_t)&wmemset },


        // libdl
        { "dladdr", (uintptr_t)&ret0 }, // TODO
        { "dlclose", (uintptr_t)&ret0 },
        { "dlerror", (uintptr_t)&ret0 },
        { "dlopen", (uintptr_t)&ret1 },
        { "dlsym", (uintptr_t)&dlsym_soloader },


        // Errno
        { "__errno", (uintptr_t)&__errno_soloader },
        { "strerror_r", (uintptr_t)&strerror_r_soloader },


        // Strings
        { "memchr", (uintptr_t)&memchr },
        { "strcat", (uintptr_t)&strcat },
        { "strchr", (uintptr_t)&strchr },
        { "strcmp", (uintptr_t)&strcmp },
        { "strcoll", (uintptr_t)&strcoll },
        { "strcpy", (uintptr_t)&strcpy },
        { "strlen", (uintptr_t)&strlen },
        { "strncmp", (uintptr_t)&strncmp },
        { "strncpy", (uintptr_t)&strncpy },
        { "strrchr", (uintptr_t)&strrchr },
        { "strxfrm", (uintptr_t)&strxfrm },


        // Syscalls
        { "syscall", (uintptr_t)&syscall },
        { "sysconf", (uintptr_t)&ret0 },


        // Time
        { "clock_gettime", (uintptr_t)&clock_gettime_soloader },
        { "nanosleep", (uintptr_t)&nanosleep },
        { "strftime", (uintptr_t)&strftime },


        // stdlib
        { "abort", (uintptr_t)&abort_soloader },
        { "exit", (uintptr_t)&exit_soloader },
        { "lrand48", (uintptr_t)&lrand48 },
        { "posix_memalign", (uintptr_t)&memalign },
        { "srand48", (uintptr_t)&srand48 },
        { "strtod", (uintptr_t)&strtod },
        { "strtol", (uintptr_t)&strtol },
        { "strtold_l", (uintptr_t)&strtold_l },
        { "strtoll", (uintptr_t)&strtoll },
        { "strtoll_l", (uintptr_t)&strtoll_l },
        { "strtoul", (uintptr_t)&strtoul },
        { "strtoull", (uintptr_t)&strtoull },
        { "strtoull_l", (uintptr_t)&strtoull_l },

        #ifdef USE_SCELIBC_IO
            { "qsort", (uintptr_t)&sceLibcBridge_qsort },
            { "rand", (uintptr_t)&sceLibcBridge_rand },
            { "srand", (uintptr_t)&sceLibcBridge_srand },
        #else
            { "qsort", (uintptr_t)&qsort },
            { "rand", (uintptr_t)&rand },
            { "srand", (uintptr_t)&srand },
        #endif


        // Signals
        { "raise", (uintptr_t)&raise },

        // Locale
        { "freelocale", (uintptr_t)&freelocale },
        { "localeconv", (uintptr_t)&localeconv },
        { "newlocale", (uintptr_t)&newlocale },
        { "setlocale", (uintptr_t)&setlocale },
        { "uselocale", (uintptr_t)&uselocale },
};

void resolve_imports(so_module* mod) {
    __sF_fake[0] = *stdin;
    __sF_fake[1] = *stdout;
    __sF_fake[2] = *stderr;

    so_resolve(mod, default_dynlib, sizeof(default_dynlib), 0);
}
