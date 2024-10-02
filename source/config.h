/*
 * Copyright (C) 2024 Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

#ifndef SOLOADER_CONFIG_H
#define SOLOADER_CONFIG_H

#define INTERNAL_PATH "/data/user/0/com.wb.lego.tcs/files"

#define ACTIVITY_INTERNAL_PATH INTERNAL_PATH

#define ANDROID_OS_BUILD_MANUFACTURER "Sony" // android.os.Build.MANUFACTURER
#define ANDROID_OS_BUILD_MODEL "PlayStation Vita" // android.os.Build.MODEL
#define ANDROID_OS_BUILD_VERSION_RELEASE "5.0.2" // android.os.Build.VERSION.RELEASE

#define ASSET_PACK_AUDIO_PATH INTERNAL_PATH "/assetpacks/asset_Audio/20202/20202/assets/Audio.dat"
#define ASSET_PACK_LEVELS_PATH INTERNAL_PATH "/assetpacks/asset_Levels/20202/20202/assets/Levels.dat"
#define ASSET_PACK_OTHERS_PATH INTERNAL_PATH "/assetpacks/asset_Others/20202/20202/assets/Others.dat"
#define ASSET_PACK_TEXTURES_PATH INTERNAL_PATH "/assetpacks/asset_Textures/20202/20202/assets/Textures.dat"

#define APK_VERSION_NAME "2.0.2.02"

// obb_info.xml
#define OBB_INFO_FORCE_ETC1 1
#define OBB_INFO_MAIN_SIZE 2
#define OBB_INFO_MAIN_VERSION 2017
#define OBB_INFO_PATCH_SIZE 0
#define OBB_INFO_PATCH_VERSION 2017

#endif
