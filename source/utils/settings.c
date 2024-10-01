/*
 * Copyright (C) 2021      Andy Nguyen
 * Copyright (C) 2022-2023 Volodymyr Atamanenko
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

#include <stdio.h>
#include <string.h>
#include "settings.h"

#define CONFIG_FILE_PATH DATA_PATH"config.txt"

bool setting_openWebBrowser;
bool setting_patchControls;

void settings_reset() {
    setting_openWebBrowser = false;
    setting_patchControls = true;
}

void settings_load() {
    settings_reset();

    char buffer[30];
    int value;

    FILE *config = fopen(CONFIG_FILE_PATH, "r");

    if (config) {
        while (EOF != fscanf(config, "%[^ ] %d\n", buffer, &value)) {
            if (strcmp("setting_openWebBrowser", buffer) == 0) setting_openWebBrowser = value == 1 ? true : false;
            else if (strcmp("setting_patchControls", buffer) == 0) setting_patchControls = value == 1 ? true : false;
        }
        fclose(config);
    }
}

void settings_save() {
    FILE *config = fopen(CONFIG_FILE_PATH, "w+");

    if (config) {
        fprintf(config, "%s %d\n", "setting_openWebBrowser", setting_openWebBrowser ? 1 : 0);
        fprintf(config, "%s %d\n", "setting_patchControls", setting_patchControls ? 1 : 0);
        fclose(config);
    }
}
