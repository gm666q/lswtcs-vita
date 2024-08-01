/*
 * Copyright (C) 2021      Andy Nguyen
 * Copyright (C) 2021      Rinnegatamante
 * Copyright (C) 2022-2023 Volodymyr Atamanenko
 * Copyright (C) 2024      Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

/**
 * @file  glutil.h
 * @brief OpenGL API initializer, related functions.
 */

#ifndef SOLOADER_GLUTIL_H
#define SOLOADER_GLUTIL_H

#include <vitaGL.h>

#define GLUTIL_MAX_PROGRAMS 1024
#define GLUTIL_MAX_UNIFORMS 1024

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _egl_context {
    GLuint buffers[2];
    EGLBoolean is_fake;
    GLuint program;
    size_t texture;
    GLuint textures[16 * 2];
} _egl_context;

void gl_preload();

#ifdef __cplusplus
};
#endif

#endif // SOLOADER_GLUTIL_H
