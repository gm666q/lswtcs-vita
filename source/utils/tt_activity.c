/*
 * Copyright (C) 2024      Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

#include "utils/tt_activity.h"

#include "utils/dialog.h"
#include "utils/logger.h"

#include <stdlib.h>

#include <so_util/so_util.h>

#define LOAD_SYMBOL(name)                                                                                 \
activity.name = (void*)so_symbol(&so_mod, "Java_com_tt_tech_TTActivity_" #name);                        \
if (activity.name == NULL) {                                                                            \
    l_fatal("%s symbol could not found.", "Java_com_tt_tech_TTActivity_" #name);                          \
    fatal_error("Error: could not find symbol %s in %s.", "Java_com_tt_tech_TTActivity_" #name, SO_PATH); \
}

extern TTActivity activity;
extern so_module so_mod;

void tt_activity_init() {
    LOAD_SYMBOL(nativeAddAssetsPath)
    LOAD_SYMBOL(nativeCacheJNIVars)
    LOAD_SYMBOL(nativeOnCreate)
    LOAD_SYMBOL(nativeOnKeyDown)
    LOAD_SYMBOL(nativeOnKeyUp)
    LOAD_SYMBOL(nativeOnPause)
    LOAD_SYMBOL(nativeOnResume)
    LOAD_SYMBOL(nativeOnSensorUpdate)
    LOAD_SYMBOL(nativeOnStart)
    LOAD_SYMBOL(nativeOnStop)
    LOAD_SYMBOL(nativeOnTouchDown)
    LOAD_SYMBOL(nativeOnTouchMove)
    LOAD_SYMBOL(nativeOnTouchUp)
    LOAD_SYMBOL(nativeOnWindowFocusChanged)
    LOAD_SYMBOL(nativeSetAndroidVersion)
    LOAD_SYMBOL(nativeSetAssetManager)
    LOAD_SYMBOL(nativeSetCaps)
    LOAD_SYMBOL(nativeSetLanguage)
    LOAD_SYMBOL(nativeSetManufacturer)
    LOAD_SYMBOL(nativeSetModel)
    LOAD_SYMBOL(nativeSetObbInfo)
    LOAD_SYMBOL(nativeSetPath)
    LOAD_SYMBOL(nativeSetScreenDimesions)
    LOAD_SYMBOL(nativeSetSurface)
    LOAD_SYMBOL(nativeUpdateGamepadAxisValues)
}
