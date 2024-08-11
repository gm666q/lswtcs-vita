/*
 * Copyright (C) 2021      Andy Nguyen
 * Copyright (C) 2022      Rinnegatamante
 * Copyright (C) 2022-2024 Volodymyr Atamanenko
 * Copyright (C) 2024      Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

#include "../config.h"

#include "reimpl/io.h"

#include <string.h>
#include <sys/stat.h>
#include <sys/unistd.h>
#include <stdlib.h>
#include <dirent.h>
#include <stdarg.h>
#include <psp2/kernel/threadmgr.h>

#ifdef USE_SCELIBC_IO
#include <libc_bridge/libc_bridge.h>
#endif

#include "utils/logger.h"
#include "utils/utils.h"

// Includes the following inline utilities:
// int oflags_musl_to_newlib(int flags);
// dirent64_bionic * dirent_newlib_to_bionic(struct dirent* dirent_newlib);
// void stat_newlib_to_bionic(struct stat * src, stat64_bionic * dst);
#include "reimpl/bits/_struct_converters.c"

static _Thread_local char buf[512];
static _Thread_local size_t i = 0;

const char *fix_path(const char *filename) {
    const char* file = NULL;

    if (filename[0] != '/') {
        return filename;
    }

    file = strstr(filename, EXTERNAL_DATA_PATH);
    if (file != NULL) {
        char *offset = buf + i * (sizeof(buf) / 2);
        snprintf(offset, sizeof(buf) / 2, "%s%s", DATA_PATH, file + strlen(EXTERNAL_DATA_PATH) + 1);
        i = (i + 1) % 2;
        return offset;
    }
    file = strstr(filename, EXTERNAL_OBB_PATH);
    if (file != NULL) {
        char *offset = buf + i * (sizeof(buf) / 2);
        snprintf(offset, sizeof(buf) / 2, "%s%s", DATA_PATH, file + strlen(EXTERNAL_OBB_PATH) + 1);
        i = (i + 1) % 2;
        return offset;
    }
    file = strstr(filename, INTERNAL_PATH);
    if (file != NULL) {
        char *offset = buf + i * (sizeof(buf) / 2);
        snprintf(offset, sizeof(buf) / 2, "%s%s", DATA_PATH, file + strlen(INTERNAL_PATH) + 1);
        i = (i + 1) % 2;
        return offset;
    }

    return filename;
}

FILE * fopen_soloader(const char * filename, const char * mode) {
    const char* p = fix_path(filename);

#ifdef USE_SCELIBC_IO
    FILE* ret = sceLibcBridge_fopen(p, mode);
#else
    FILE* ret = fopen(p, mode);
#endif

    if (ret)
        l_debug("fopen(%s => %s, %s): %p", filename, p, mode, ret);
    else
        l_warn("fopen(%s => %s, %s): %p", filename, p, mode, ret);

    return ret;
}

int open_soloader(const char * path, int oflag, ...) {
    mode_t mode = 0666;
    if (((oflag & BIONIC_O_CREAT) == BIONIC_O_CREAT) ||
        ((oflag & BIONIC_O_TMPFILE) == BIONIC_O_TMPFILE)) {
        va_list args;
        va_start(args, oflag);
        mode = (mode_t)(va_arg(args, int));
        va_end(args);
    }

    oflag = oflags_bionic_to_newlib(oflag);
    int ret = open(path, oflag, mode);
    if (ret >= 0)
        l_debug("open(%s, %x): %i", path, oflag, ret);
    else
        l_warn("open(%s, %x): %i", path, oflag, ret);
    return ret;
}

int fstat_soloader(int fd, stat64_bionic * buf) {
    struct stat st;
    int res = fstat(fd, &st);

    if (res == 0)
        stat_newlib_to_bionic(&st, buf);

    l_debug("fstat(%i): %i", fd, res);
    return res;
}

int stat_soloader(const char * path, stat64_bionic * buf) {
    struct stat st;
    int res = stat(path, &st);

    if (res == 0)
        stat_newlib_to_bionic(&st, buf);

    l_debug("stat(%s): %i", path, res);
    return res;
}

int fclose_soloader(FILE * f) {
#ifdef USE_SCELIBC_IO
    int ret = sceLibcBridge_fclose(f);
#else
    int ret = fclose(f);
#endif

    l_debug("fclose(%p): %i", f, ret);
    return ret;
}

int close_soloader(int fd) {
    int ret = close(fd);
    l_debug("close(%i): %i", fd, ret);
    return ret;
}

DIR* opendir_soloader(char* _pathname) {
    DIR* ret = opendir(_pathname);
    l_debug("opendir(\"%s\"): %p", _pathname, ret);
    return ret;
}

struct dirent64_bionic * readdir_soloader(DIR * dir) {
    static struct dirent64_bionic dirent_tmp;

    struct dirent* ret = readdir(dir);
    l_debug("readdir(%p): %p", dir, ret);

    if (ret) {
        dirent64_bionic* entry_tmp = dirent_newlib_to_bionic(ret);
        memcpy(&dirent_tmp, entry_tmp, sizeof(dirent64_bionic));
        free(entry_tmp);
        return &dirent_tmp;
    }

    return NULL;
}

int readdir_r_soloader(DIR * dirp, dirent64_bionic * entry,
                       dirent64_bionic ** result) {
    struct dirent dirent_tmp;
    struct dirent * pdirent_tmp;

    int ret = readdir_r(dirp, &dirent_tmp, &pdirent_tmp);

    if (ret == 0) {
        dirent64_bionic* entry_tmp = dirent_newlib_to_bionic(&dirent_tmp);
        memcpy(entry, entry_tmp, sizeof(dirent64_bionic));
        *result = (pdirent_tmp != NULL) ? entry : NULL;
        free(entry_tmp);
    }

    l_debug("readdir_r(%p, %p, %p): %i", dirp, entry, result, ret);
    return ret;
}

int closedir_soloader(DIR * dir) {
    int ret = closedir(dir);
    l_debug("closedir(%p): %i", dir, ret);
    return ret;
}

int fcntl_soloader(int fd, int cmd, ...) {
    l_warn("fcntl(%i, %i, ...): not implemented", fd, cmd);
    return 0;
}

int ioctl_soloader(int fd, int request, ...) {
    l_warn("ioctl(%i, %i, ...): not implemented", fd, request);
    return 0;
}

int fsync_soloader(int fd) {
    int ret = fsync(fd);
    l_debug("fsync(%i): %i", fd, ret);
    return ret;
}

int chdir_soloader(const char *__path) {
    const char *p = fix_path(__path);

    const int ret = chdir(p);

    if (ret == 0)
        l_debug("chdir(%s => %s): %i", __path, p, ret);
    else
        l_warn("chdir(%s => %s): %i", __path, p, ret);

    return ret;
}

int mkdir_soloader(const char *_path, mode_t __mode) {
    const char *p = fix_path(_path);

    const int ret = mkdir(p, __mode);

    if (ret == 0)
        l_debug("mkdir(%s => %s, %u): %i", _path, p, __mode, ret);
    else
        l_warn("mkdir(%s => %s, %u): %i", _path, p, __mode, ret);

    return ret;
}

int remove_soloader(const char *pathname) {
    const char *p = fix_path(pathname);

    const int ret = remove(p);

    if (ret == 0)
        l_debug("remove(%s => %s): %i", pathname, p, ret);
    else
        l_warn("remove(%s => %s): %i", pathname, p, ret);

    return ret;
}

int rename_soloader(const char *old_filename, const char *new_filename) {
    const char *old_p = fix_path(old_filename);
    const char *new_p = fix_path(new_filename);

    const int ret = rename(old_p, new_p);

    if (ret == 0)
        l_debug("rename(%s => %s, %s => %s): %i", old_filename, old_p, new_filename, new_p, ret);
    else
        l_warn("rename(%s => %s, %s => %s): %i", old_filename, old_p, new_filename, new_p, ret);

    return ret;
}
