/*
 * Copyright (C) 2022-2024 Volodymyr Atamanenko
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

/**
 * @file  egl.h
 * @brief Implementations for EGL functions. Most of these are just stubs that
 *        don't actually do anything, but we try to conform to the standard
 *        as closely as possible in terms of return values, etc.
 */

#ifndef SOLOADER_EGL_H
#define SOLOADER_EGL_H

#include <vitaGL.h>

#ifdef __cplusplus
extern "C" {
#endif

EGLBoolean eglInitialize(EGLDisplay dpy, EGLint *major, EGLint *minor);

EGLBoolean eglGetConfigAttrib(EGLDisplay display, EGLConfig config,
                              EGLint attribute, EGLint *value);

EGLBoolean eglQueryContext(EGLDisplay dpy, EGLContext ctx, EGLint attribute,
                           EGLint *value);

EGLBoolean eglQuerySurface(EGLDisplay dpy, EGLSurface eglSurface,
                           EGLint attribute, EGLint *value);

EGLBoolean eglChooseConfig(EGLDisplay dpy, const EGLint * attrib_list,
                           EGLConfig * configs, EGLint config_size,
                           EGLint * num_config);

EGLContext eglCreateContext(EGLDisplay dpy, EGLConfig config,
                            EGLContext share_context,
                            const EGLint * attrib_list);

EGLSurface eglCreateWindowSurface(EGLDisplay dpy, EGLConfig config, void * win,
                                  const EGLint * attrib_list);

EGLBoolean eglMakeCurrent(EGLDisplay dpy, EGLSurface draw, EGLSurface read,
                          EGLContext ctx);

EGLBoolean eglDestroyContext(EGLDisplay dpy, EGLContext ctx);

EGLBoolean eglDestroySurface(EGLDisplay dpy, EGLSurface surface);

EGLBoolean eglTerminate(EGLDisplay dpy);

EGLContext eglGetCurrentContext (void);

EGLBoolean eglGetConfigs(EGLDisplay display, EGLConfig * configs,
                         EGLint config_size, EGLint * num_config);

char const * eglQueryString(EGLDisplay display, EGLint name);

#define EGL_CONFIG_ID                     0x3028
#define EGL_HEIGHT                        0x3056
#define EGL_WIDTH                         0x3057
#define EGL_TEXTURE_FORMAT                0x3080
#define EGL_TEXTURE_TARGET                0x3081
#define EGL_SWAP_BEHAVIOR                 0x3093
#define EGL_LARGEST_PBUFFER               0x3058
#define EGL_MIPMAP_TEXTURE                0x3082
#define EGL_MIPMAP_LEVEL                  0x3083
#define EGL_MULTISAMPLE_RESOLVE           0x3099
#define EGL_HORIZONTAL_RESOLUTION         0x3090
#define EGL_VERTICAL_RESOLUTION           0x3091
#define EGL_PIXEL_ASPECT_RATIO            0x3092
#define EGL_RENDER_BUFFER                 0x3086
#define EGL_VG_COLORSPACE                 0x3087
#define EGL_VG_COLORSPACE_sRGB            0x3089
#define EGL_VG_ALPHA_FORMAT               0x3088
#define EGL_VG_ALPHA_FORMAT_NONPRE        0x308B
#define EGL_TIMESTAMPS_ANDROID            0x3430
#define EGL_DISPLAY_SCALING               10000
#define EGL_BUFFER_PRESERVED              0x3094
#define EGL_MULTISAMPLE_RESOLVE_DEFAULT   0x309A
#define EGL_BACK_BUFFER                   0x3084
#define EGL_ALPHA_SIZE                    0x3021
#define EGL_ALPHA_MASK_SIZE               0x303E
#define EGL_BIND_TO_TEXTURE_RGB           0x3039
#define EGL_BIND_TO_TEXTURE_RGBA          0x303A
#define EGL_BLUE_SIZE                     0x3022
#define EGL_BUFFER_SIZE                   0x3020
#define EGL_COLOR_BUFFER_TYPE             0x303F
#define EGL_CONFIG_CAVEAT                 0x3027
#define EGL_CONFIG_ID                     0x3028
#define EGL_CONFORMANT                    0x3042
#define EGL_DEPTH_SIZE                    0x3025
#define EGL_GREEN_SIZE                    0x3023
#define EGL_LEVEL                         0x3029
#define EGL_LUMINANCE_SIZE                0x303D
#define EGL_MAX_PBUFFER_WIDTH             0x302C
#define EGL_MAX_PBUFFER_HEIGHT            0x302A
#define EGL_MAX_PBUFFER_PIXELS            0x302B
#define EGL_MAX_SWAP_INTERVAL             0x303C
#define EGL_MIN_SWAP_INTERVAL             0x303B
#define EGL_NATIVE_RENDERABLE             0x302D
#define EGL_NATIVE_VISUAL_ID              0x302E
#define EGL_NATIVE_VISUAL_TYPE            0x302F
#define EGL_RED_SIZE                      0x3024
#define EGL_RENDERABLE_TYPE               0x3040
#define EGL_SAMPLE_BUFFERS                0x3032
#define EGL_SAMPLES                       0x3031
#define EGL_STENCIL_SIZE                  0x3026
#define EGL_SURFACE_TYPE                  0x3033
#define EGL_TRANSPARENT_TYPE              0x3034
#define EGL_TRANSPARENT_RED_VALUE         0x3037
#define EGL_TRANSPARENT_GREEN_VALUE       0x3036
#define EGL_TRANSPARENT_BLUE_VALUE        0x3035
#define EGL_RGB_BUFFER                    0x308E
#define EGL_NONE                          0x3038
#define EGL_TEXTURE_RGBA                  0x305E
#define EGL_TEXTURE_2D                    0x305F
#define EGL_PBUFFER_BIT                   0x0001
#define EGL_PIXMAP_BIT                    0x0002
#define EGL_WINDOW_BIT                    0x0004
#define EGL_OPENGL_ES_BIT                 0x0001
#define EGL_OPENVG_BIT                    0x0002
#define EGL_OPENGL_ES2_BIT                0x0004
#define EGL_OPENGL_BIT                    0x0008
#define EGL_CONTEXT_CLIENT_TYPE           0x3097
#define EGL_CONTEXT_CLIENT_VERSION        0x3098
#define EGL_VENDOR                        0x3053
#define EGL_VERSION                       0x3054
#define EGL_EXTENSIONS                    0x3055
#define EGL_CLIENT_APIS                   0x308D

#ifdef __cplusplus
};
#endif

#endif // SOLOADER_EGL_H
