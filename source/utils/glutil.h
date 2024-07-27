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

#ifdef __cplusplus
extern "C" {
#endif

void gl_preload();

void glCompileShader_soloader(GLuint shader);

const GLubyte *glGetString_soloader(GLenum name);

GLint glGetUniformLocation_soloader(GLuint prog, const GLchar *name);

void glShaderSource_soloader(GLuint handle, GLsizei count, const GLchar *const *string, const GLint *length);

void glUniform1fv_soloader(GLint location, GLsizei count, const GLfloat *value);

void glUniform1i_soloader(GLint location, GLint v0);

void glUniform2fv_soloader(GLint location, GLsizei count, const GLfloat *value);

void glUniform3fv_soloader(GLint location, GLsizei count, const GLfloat *value);

void glUniform4fv_soloader(GLint location, GLsizei count, const GLfloat *value);

#ifdef __cplusplus
};
#endif

#endif // SOLOADER_GLUTIL_H
