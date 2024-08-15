/*
 * Copyright (C) 2024 Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

#include "reimpl/gl.h"

#include "utils/glutil.h"
#include "utils/logger.h"

#include <psp2/kernel/clib.h>

#define PROGRAM_UNIFORM_SPEEDHACK
//#define SKIP_ERROR_HANDLING

extern _Thread_local _egl_context *current_context;
extern GLint uniforms[GLUTIL_MAX_PROGRAMS * GLUTIL_MAX_UNIFORMS];

GLint find_uniform(GLuint p, GLint u);

void glActiveTexture_soloader(GLenum texture) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glActiveTexture<%p>(texture: %u)\n", __builtin_return_address(0), texture);
#endif
        return;
    }
#endif

    current_context->texture = texture - GL_TEXTURE0;
    if (current_context->is_pbuffer == EGL_FALSE) {
        glActiveTexture(texture);
    }
}

void glBindBuffer_soloader(GLenum target, GLuint buffer) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glBindBuffer<%p>(target: %u, buffer: %u)\n", __builtin_return_address(0),
                      target, buffer);
#endif
        return;
    }
#endif

    current_context->buffers[target - GL_ARRAY_BUFFER] = buffer;
    if (current_context->is_pbuffer == EGL_FALSE) {
        glBindBuffer(target, buffer);
    }
}

void glBindTexture_soloader(GLenum target, GLuint texture) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glBindTexture<%p>(target: %u, texture: %u)\n", __builtin_return_address(0),
                      target, texture);
#endif
        return;
    }
#endif

    const size_t i = target == GL_TEXTURE_2D ? 0 : 1;
    current_context->textures[current_context->texture * 2 + i] = texture;
    if (current_context->is_pbuffer == EGL_FALSE) {
        glBindTexture(target, texture);
    }
}

void glBufferData_soloader(GLenum target, GLsizei size, const void *data, GLenum usage) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glBufferData<%p>(target: %u, size: %i, data: %p, usage: %u)\n",
                      __builtin_return_address(0), target, size, data, usage);
#endif
        return;
    }
#endif

    glNamedBufferData(current_context->buffers[target - GL_ARRAY_BUFFER], size, data, usage);
}

void glBufferSubData_soloader(GLenum target, GLintptr offset, GLsizeiptr size, const void *data) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glBufferSubData<%p>(target: %u, offset: %i, size: %i, data: %p)\n",
                      __builtin_return_address(0), target, offset, size, data);
#endif
        return;
    }
#endif

    glNamedBufferSubData(current_context->buffers[target - GL_ARRAY_BUFFER], offset, size, data);
}

void glCompressedTexImage2D_soloader(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height,
                                     GLint border, GLsizei imageSize, const void *data) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf(
            "[gl_dbg][no_context] glCompressedTexImage2D<%p>(target: %u, level: %i, internalformat: %u, width: %i, height: %i, border: %i, imageSize: %i, data: %p)\n",
            __builtin_return_address(0), target, level, internalformat, width, height, border, imageSize, data);
#endif
        return;
    }
#endif

    const size_t i = target == GL_TEXTURE_2D ? 0 : 1;
    glCompressedTextureImage2D(current_context->textures[current_context->texture * 2 + i], target, level,
                               internalformat, width, height, border, imageSize, data);
}

void glCopyTexImage2D_soloader(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width,
                               GLsizei height, GLint border) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf(
            "[gl_dbg][no_context] glCopyTexImage2D<%p>(target: %u, level: %i, internalformat: %u, x: %i, y: %i, width: %i, height: %i, border: %i)\n",
            __builtin_return_address(0), target, level, internalformat, x, y, width, height, border);
#endif
        return;
    }
#endif

    if (current_context->is_pbuffer == EGL_FALSE) {
        glCopyTexImage2D(target, level, internalformat, x, y, width, height, border);
    } else {
        l_error("glCopyTexImage2D called from a pbuffer context");
        //glCopyTexImage2D(target, level, internalformat, x, y, width, height, border);
    }
}

void glGenerateMipmap_soloader(GLenum target) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glGenerateMipmap<%p>(target: %u)\n", __builtin_return_address(0), target);
#endif
        return;
    }
#endif

    const size_t i = target == GL_TEXTURE_2D ? 0 : 1;
    glGenerateTextureMipmap(current_context->textures[current_context->texture * 2 + i]);
}

void glGetIntegerv_soloader(GLenum pname, GLint *data) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glGetIntegerv<%p>(pname: %u, data: %p)\n", __builtin_return_address(0),
                      pname, data);
#endif
        return;
    }
#endif

    switch (pname) {
        case GL_ACTIVE_TEXTURE:
            *data = current_context->texture + GL_TEXTURE0;
            return;
        case GL_ARRAY_BUFFER_BINDING:
            *data = current_context->buffers[0];
            return;
        case GL_CURRENT_PROGRAM:
            *data = current_context->program + 1;
            return;
        case GL_ELEMENT_ARRAY_BUFFER_BINDING:
            *data = current_context->buffers[1];
            return;
        case GL_TEXTURE_BINDING_2D:
            *data = current_context->textures[current_context->texture * 2 + 0];
            return;
        case GL_TEXTURE_BINDING_CUBE_MAP:
            *data = current_context->textures[current_context->texture * 2 + 1];
            return;
        default:
            glGetIntegerv(pname, data);
            return;
    }
}

const GLubyte *glGetString_soloader(GLenum name) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glGetString<%p>(name: %u)\n", __builtin_return_address(0), name);
#endif
        return NULL;
    }
#endif

    switch (name) {
        case GL_VENDOR:
            return "Imagination Technologies";
        case GL_RENDERER:
            return "PowerVR SGX 544MP";
        default:
            return glGetString(name);
    }
}

GLint glGetUniformLocation_soloader(GLuint program, const GLchar *name) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glGetUniformLocation<%p>(program: %u, name: %s)\n",
                      __builtin_return_address(0), program, name);
#endif
        return -1;
    }
#endif

#ifdef DEBUG_OPENGL
    const GLint original = glGetUniformLocation(program, name);
    const GLint mapped = find_uniform(program, original);
    sceClibPrintf("[gl_dbg] glGetUniformLocation<%p>(program: %u, name: %s): %p => %d", __builtin_return_address(0),
                  program, name, (void *) original, mapped);
    return mapped;
#else
    return find_uniform(program, glGetUniformLocation(program, name));
#endif
}

void glLinkProgram_soloader(GLuint program) {
    // This is kinda crude, but it fixes for double linking of some shaders
    if (__builtin_return_address(0) == (void *)0x98576668) {
        return;
    }
    glLinkProgram(program);
}

void glTexImage2D_soloader(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height,
                           GLint border, GLenum format, GLenum type, const void *pixels) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf(
            "[gl_dbg][no_context] glTexImage2D<%p>(target: %u, level: %i, internalformat: %i, width: %i, height: %i, border: %i, format: %u, type: %u, pixels: %p)\n",
            __builtin_return_address(0), target, level, internalformat, width, height, border, format, type, pixels);
#endif
        return;
    }
#endif

    const size_t i = target == GL_TEXTURE_2D ? 0 : 1;
    glTextureImage2D(current_context->textures[current_context->texture * 2 + i], target, level, internalformat,
                     width, height, border, format, type, pixels);
}

void glTexParameteri_soloader(GLenum target, GLenum pname, GLint param) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glTexParameteri<%p>(target: %u, pname: %u, param: %i)\n",
                      __builtin_return_address(0), target, pname, param);
#endif
        return;
    }
#endif

    const size_t i = target == GL_TEXTURE_2D ? 0 : 1;
    glTextureParameteri(current_context->textures[current_context->texture * 2 + i], target, pname, param);
}

void glUniform1fv_soloader(GLint location, GLsizei count, const GLfloat *value) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glUniform1fv<%p>(location: %i, count: %i, value: %p)\n",
                      __builtin_return_address(0), location, count, value);
#endif
        return;
    }

    if (current_context->program == UINT32_MAX) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_program] glUniform1fv<%p>(location: %i, count: %i, value: %p)\n",
                      __builtin_return_address(0), location, count, value);
#endif
        return;
    }
#endif

#ifdef PROGRAM_UNIFORM_SPEEDHACK
    glUniform1fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#else
    glProgramUniform1fv(current_context->program + 1,
                        uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#endif
}

void glUniform1i_soloader(GLint location, GLint v0) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glUniform1i<%p>(location: %i, v0: %i)\n",
                      __builtin_return_address(0), location, v0);
#endif
        return;
    }

    if (current_context->program == UINT32_MAX) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_program] glUniform1i<%p>(location: %i, v0: %i)\n",
                      __builtin_return_address(0), location, v0);
#endif
        return;
    }
#endif

#ifdef PROGRAM_UNIFORM_SPEEDHACK
    glUniform1i(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], v0);
#else
    glProgramUniform1i(current_context->program + 1,
                       uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], v0);
#endif
}

void glUniform2fv_soloader(GLint location, GLsizei count, const GLfloat *value) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glUniform2fv<%p>(location: %i, count: %i, value: %p)\n",
                      __builtin_return_address(0), location, count, value);
#endif
        return;
    }

    if (current_context->program == UINT32_MAX) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_program] glUniform2fv<%p>(location: %i, count: %i, value: %p)\n",
                      __builtin_return_address(0), location, count, value);
#endif
        return;
    }
#endif

#ifdef PROGRAM_UNIFORM_SPEEDHACK
    glUniform2fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#else
    glProgramUniform2fv(current_context->program + 1,
                        uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#endif
}

void glUniform3fv_soloader(GLint location, GLsizei count, const GLfloat *value) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glUniform3fv<%p>(location: %i, count: %i, value: %p)\n",
                      __builtin_return_address(0), location, count, value);
#endif
        return;
    }

    if (current_context->program == UINT32_MAX) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_program] glUniform3fv<%p>(location: %i, count: %i, value: %p)\n",
                      __builtin_return_address(0), location, count, value);
#endif
        return;
    }
#endif

#ifdef PROGRAM_UNIFORM_SPEEDHACK
    glUniform3fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#else
    glProgramUniform3fv(current_context->program + 1,
                        uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#endif
}

void glUniform4fv_soloader(GLint location, GLsizei count, const GLfloat *value) {
#ifndef SKIP_ERROR_HANDLING
    if (current_context == NULL) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_context] glUniform4fv<%p>(location: %i, count: %i, value: %p)\n",
                      __builtin_return_address(0), location, count, value);
#endif
        return;
    }

    if (current_context->program == UINT32_MAX) {
#ifdef DEBUG_OPENGL
        sceClibPrintf("[gl_dbg][no_program] glUniform4fv<%p>(location: %i, count: %i, value: %p)\n",
                      __builtin_return_address(0), location, count, value);
#endif
        return;
    }
#endif

#ifdef PROGRAM_UNIFORM_SPEEDHACK
    glUniform4fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#else
    glProgramUniform4fv(current_context->program + 1,
                        uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#endif
}

void glUseProgram_soloader(GLuint program) {
    current_context->program = program == 0 ? UINT32_MAX : program - 1;
    if (current_context->is_pbuffer == EGL_FALSE) {
        glUseProgram(program);
    }
}

GLint find_uniform(const GLuint p, const GLint u) {
    const size_t begin = (p - 1) * GLUTIL_MAX_UNIFORMS;
    const size_t end = begin + GLUTIL_MAX_UNIFORMS;

    for (size_t i = begin; i < end; ++i) {
        if (uniforms[i] == -1) {
            uniforms[i] = u;
            return (GLint) (i - begin);
        }
        if (uniforms[i] == u) {
            return (GLint) (i - begin);
        }
    }

    l_error("MORE THEN %u UNIFORMS USED", GLUTIL_MAX_UNIFORMS);
    return -1;
}
