/*
 * Copyright (C) 2024 Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

#include "reimpl/gl.h"

#include "utils/glutil.h"
#include "utils/logger.h"

#define PROGRAM_UNIFORM_SPEEDHACK

extern _Thread_local _egl_context *current_context;
extern GLint uniforms[GLUTIL_MAX_PROGRAMS * GLUTIL_MAX_UNIFORMS];

GLint find_uniform(GLuint p, GLint u);

void glActiveTexture_soloader(GLenum texture) {
    current_context->texture = texture - GL_TEXTURE0;
    if (current_context->is_fake == EGL_FALSE) {
        glActiveTexture(texture);
    }
}

void glBindBuffer_soloader(GLenum target, GLuint buffer) {
    current_context->buffers[target - GL_ARRAY_BUFFER] = buffer;
    if (current_context->is_fake == EGL_FALSE) {
        glBindBuffer(target, buffer);
    }
}

void glBindTexture_soloader(GLenum target, GLuint texture) {
    const size_t i = target == GL_TEXTURE_2D ? 0 : 1;
    current_context->textures[current_context->texture * 2 + i] = texture;
    if (current_context->is_fake == EGL_FALSE) {
        glBindTexture(target, texture);
    }
}

void glBufferData_soloader(GLenum target, GLsizei size, const void *data, GLenum usage) {
    if (current_context->is_fake == EGL_FALSE) {
        glBufferData(target, size, data, usage);
    } else {
        glNamedBufferData(current_context->buffers[target - GL_ARRAY_BUFFER], size, data, usage);
    }
}

void glBufferSubData_soloader(GLenum target, GLintptr offset, GLsizeiptr size, const void *data) {
    if (current_context->is_fake == EGL_FALSE) {
        glBufferSubData(target, offset, size, data);
    } else {
        glNamedBufferSubData(current_context->buffers[target - GL_ARRAY_BUFFER], offset, size, data);
    }
}

void glCompressedTexImage2D_soloader(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height,
                                     GLint border, GLsizei imageSize, const void *data) {
    if (current_context->is_fake == EGL_FALSE) {
        glCompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data);
    } else {
        const size_t i = target == GL_TEXTURE_2D ? 0 : 1;
        glCompressedTextureImage2D(current_context->textures[current_context->texture * 2 + i], target, level,
                                   internalformat, width, height, border, imageSize, data);
    }
}

void glCopyTexImage2D_soloader(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width,
                               GLsizei height, GLint border) {
    if (current_context->is_fake == EGL_FALSE) {
        glCopyTexImage2D(target, level, internalformat, x, y, width, height, border);
    } else {
        l_error("glCopyTexImage2D called from a fake context");
        //glCopyTexImage2D(target, level, internalformat, x, y, width, height, border);
    }
}

void glGenerateMipmap_soloader(GLenum target) {
    if (current_context->is_fake == EGL_FALSE) {
        glGenerateMipmap(target);
    } else {
        const size_t i = target == GL_TEXTURE_2D ? 0 : 1;
        glGenerateTextureMipmap(current_context->textures[current_context->texture * 2 + i]);
    }
}

void glGetIntegerv_soloader(GLenum pname, GLint *data) {
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
    if (current_context == NULL) {
        return NULL;
    }
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
#ifdef DEBUG_OPENGL
    const GLint original = glGetUniformLocation(program, name);
    const GLint mapped = find_uniform(program, original);
    l_debug("glGetUniformLocation(%u, %s): %p => %d", program, name, (void*)original, mapped);
    return mapped;
#else
    return find_uniform(program, glGetUniformLocation(program, name));
#endif
}

void glTexImage2D_soloader(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height,
                           GLint border, GLenum format, GLenum type, const void *pixels) {
    if (current_context->is_fake == EGL_FALSE) {
        glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels);
    } else {
        const size_t i = target == GL_TEXTURE_2D ? 0 : 1;
        glTextureImage2D(current_context->textures[current_context->texture * 2 + i], target, level, internalformat,
                         width, height, border, format, type, pixels);
    }
}

void glTexParameteri_soloader(GLenum target, GLenum pname, GLint param) {
    if (current_context->is_fake == EGL_FALSE) {
        glTexParameteri(target, pname, param);
    } else {
        const size_t i = target == GL_TEXTURE_2D ? 0 : 1;
        glTextureParameteri(current_context->textures[current_context->texture * 2 + i], target, pname, param);
    }
}

void glUniform1fv_soloader(GLint location, GLsizei count, const GLfloat *value) {
#ifdef PROGRAM_UNIFORM_SPEEDHACK
    glUniform1fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#else
    if (current_context->is_fake == EGL_FALSE) {
        glUniform1fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
    } else {
        glProgramUniform1fv(current_context->program + 1,
                            uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
    }
#endif
}

void glUniform1i_soloader(GLint location, GLint v0) {
#ifdef PROGRAM_UNIFORM_SPEEDHACK
    glUniform1i(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], v0);
#else
    if (current_context->is_fake == EGL_FALSE) {
        glUniform1i(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], v0);
    } else {
        glProgramUniform1i(current_context->program + 1,
                           uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], v0);
    }
#endif
}

void glUniform2fv_soloader(GLint location, GLsizei count, const GLfloat *value) {
#ifdef PROGRAM_UNIFORM_SPEEDHACK
    glUniform2fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#else
    if (current_context->is_fake == EGL_FALSE) {
        glUniform2fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
    } else {
        glProgramUniform2fv(current_context->program + 1,
                            uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
    }
#endif
}

void glUniform3fv_soloader(GLint location, GLsizei count, const GLfloat *value) {
#ifdef PROGRAM_UNIFORM_SPEEDHACK
    glUniform3fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#else
    if (current_context->is_fake == EGL_FALSE) {
        glUniform3fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
    } else {
        glProgramUniform3fv(current_context->program + 1,
                            uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
    }
#endif
}

void glUniform4fv_soloader(GLint location, GLsizei count, const GLfloat *value) {
#ifdef PROGRAM_UNIFORM_SPEEDHACK
    glUniform4fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
#else
    if (current_context->is_fake == EGL_FALSE) {
        glUniform4fv(uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
    } else {
        glProgramUniform4fv(current_context->program + 1,
                            uniforms[current_context->program * GLUTIL_MAX_UNIFORMS + location], count, value);
    }
#endif
}

void glUseProgram_soloader(GLuint program) {
    // TODO: This can be a problem if glUniform is called with no shader bound
    current_context->program = program - 1;
    if (current_context->is_fake == EGL_FALSE) {
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
