/*
 * Copyright (C) 2021      Andy Nguyen
 * Copyright (C) 2021-2022 Rinnegatamante
 * Copyright (C) 2022-2024 Volodymyr Atamanenko
 * Copyright (C) 2024      Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

#include "utils/init.h"

#include "utils/dialog.h"
#include "utils/glutil.h"
#include "utils/logger.h"
#include "utils/settings.h"
#include "utils/tt_activity.h"
#include "utils/utils.h"

#include <string.h>

#include <psp2/appmgr.h>
#include <psp2/apputil.h>
#include <psp2/kernel/clib.h>
#include <psp2/power.h>

#include <falso_jni/FalsoJNI.h>
#include <so_util/so_util.h>
#include <fios/fios.h>
#include <malloc.h>

// Base address for the Android .so to be loaded at
#define LOAD_ADDRESS 0x98000000

extern so_module so_mod;

void soloader_init_all() {
	// Launch `app0:configurator.bin` on `-config` init param
    sceAppUtilInit(&(SceAppUtilInitParam){}, &(SceAppUtilBootParam){});
    SceAppUtilAppEventParam eventParam;
    sceClibMemset(&eventParam, 0, sizeof(SceAppUtilAppEventParam));
    sceAppUtilReceiveAppEvent(&eventParam);
    if (eventParam.type == 0x05) {
        char buffer[2048];
        sceAppUtilAppEventParseLiveArea(&eventParam, buffer);
        if (strstr(buffer, "-config"))
            sceAppMgrLoadExec("app0:/configurator.bin", NULL, NULL);
    }

    // Set default overclock values
    scePowerSetArmClockFrequency(444);
    scePowerSetBusClockFrequency(222);
    scePowerSetGpuClockFrequency(222);
    scePowerSetGpuXbarClockFrequency(166);

#ifdef USE_SCELIBC_IO
    if (fios_init(DATA_PATH) == 0)
        l_success("FIOS initialized.");
#endif

    if (!module_loaded("kubridge")) {
        l_fatal("kubridge is not loaded.");
        fatal_error("You need to install kubridge.skprx to play this game. "
                    "You can download it at https://github.com/bythos14/kubridge/releases");
    }

    // Checking for kubridge version
    char *kubridge_hash = file_sha1sum("ux0:/tai/kubridge.skprx");
    if (!kubridge_hash) kubridge_hash = file_sha1sum("ur0:/tai/kubridge.skprx");

    if (!kubridge_hash) {
        fatal_error("Could not find kubridge.skprx file despite the plugin "
                    "itself being active. Please put it in either ur0:/tai or "
                    "ux0:/tai folder.");
    }

    l_info("kubridge hash: %s", kubridge_hash);

    const char * currently_installed_version = NULL;

    if      (strcmp(kubridge_hash, "E033D76A90C9B8F2D496735C2692AFD8C3ED32FE") == 0) // v0.1 (TheFloW)
    {
        currently_installed_version = "v0.1";
    }
    else if (strcmp(kubridge_hash, "6CFC985904F9BBE3A4F54DD96197F5DF3E523DCB") == 0) // v0.2 (Bythos)
    {
        currently_installed_version = "v0.2";
    }
    else if (strcmp(kubridge_hash, "AFAC6077618245D87CFF9ED2819223E6BB2DE5F8") == 0) // v0.3 (Bythos)
    {
        currently_installed_version = "v0.3";
    }

    if (currently_installed_version) {
        free(kubridge_hash);
        l_fatal("kubridge check failed.");
        fatal_error("You need to update kubridge.skprx to version v0.3.1 or higher to play this game. "
                    "Currently installed version: %s. "
                    "You can download the update at https://github.com/bythos14/kubridge/releases",
                    currently_installed_version);
    }

    free(kubridge_hash);

    l_success("kubridge check passed.");

    // Checking for SO version
    char *so_hash = file_sha1sum(SO_PATH);

    if (!so_hash) {
        l_fatal("SO could not be located.");
        fatal_error("Looks like you haven't installed the data files for this "
                    "port, or they are in an incorrect location. Please make "
                    "sure that you have %s file exactly at that path.", SO_PATH);
    }

    l_info("SO hash: %s", so_hash);

    currently_installed_version = NULL;

    if      (strcmp(so_hash, "291321330A3789414CAB7D411DAE64DEBC990AD6") == 0) // v2.0.2.02 (20202)
    {
        currently_installed_version = "20202";
    }

    if (!currently_installed_version)
    {
        free(so_hash);
        l_fatal("SO check failed.");
        fatal_error("Looks like the data files you installed for this port "
                    "are from an unsupported version. Please refer to the README "
                    "for the list of supported versions.");
    }

    free(so_hash);

    l_success("SO check passed.");

    if (so_file_load(&so_mod, SO_PATH, LOAD_ADDRESS) < 0) {
        l_fatal("SO could not be loaded.");
        fatal_error("Error: could not load %s.", SO_PATH);
    }

    settings_load();
    l_success("Settings loaded.");

    so_relocate(&so_mod);
    l_success("SO relocated.");

    resolve_imports(&so_mod);
    l_success("SO imports resolved.");

    so_patch();
    l_success("SO patched.");

    so_flush_caches(&so_mod);
    l_success("SO caches flushed.");

    so_initialize(&so_mod);
    l_success("SO initialized.");

    tt_activity_init();
    l_success("TTActivity initialized.");

    gl_preload();
    l_success("OpenGL preloaded.");

    jni_init();
    l_success("FalsoJNI initialized.");
}
