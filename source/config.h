/*
 * Copyright (C) 2024      Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

#ifndef SOLOADER_CONFIG_H
#define SOLOADER_CONFIG_H

#define EXTERNAL_DATA_PATH "/ext/Android/data/com.wb.lego.tcs/files"
#define EXTERNAL_OBB_PATH "/ext/Android/obb/com.wb.lego.tcs"
#define INTERNAL_PATH "/int/com.wb.lego.tcs/files"

#define ACTIVITY_EXTERNAL_PATH EXTERNAL_DATA_PATH
#define ACTIVITY_INTERNAL_PATH INTERNAL_PATH

#define ANDROID_OS_BUILD_MANUFACTURER "Sony" // android.os.Build.MANUFACTURER
#define ANDROID_OS_BUILD_MODEL "PlayStation Vita" // android.os.Build.MODEL
#define ANDROID_OS_BUILD_VERSION_RELEASE "4.2.2" // android.os.Build.VERSION.RELEASE

#define APK_VERSION_NAME "2.0.0.5"

// obb_info.xml
#define OBB_INFO_FORCE_ETC1 1
#define OBB_INFO_MAIN_SIZE 1
#define OBB_INFO_MAIN_VERSION 2005
#define OBB_INFO_PATCH_SIZE 0
#define OBB_INFO_PATCH_VERSION 2005

#endif
