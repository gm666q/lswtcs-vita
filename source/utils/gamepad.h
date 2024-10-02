/*
 * Copyright (C) 2024 Jan Smialkowski
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */

#ifndef SOLOADER_GAMEPAD_H
#define SOLOADER_GAMEPAD_H

#ifdef __cplusplus
extern "C" {
#endif

enum {
    // Base
    GAMEPAD_ACTION      = 0x00000080,
    GAMEPAD_DDOWN       = 0x00004000,
    GAMEPAD_DLEFT       = 0x00008000,
    GAMEPAD_DRIGHT      = 0x00002000,
    GAMEPAD_DUP         = 0x00001000,
    GAMEPAD_JUMP        = 0x00000040,
    GAMEPAD_L1          = 0x00000004,
    GAMEPAD_L2          = 0x00000001,
    GAMEPAD_L3          = 0x00000200,
    GAMEPAD_R1          = 0x00000008,
    GAMEPAD_R2          = 0x00000002,
    GAMEPAD_R3          = 0x00000400,
    GAMEPAD_SELECT      = 0x00000100,
    GAMEPAD_SPECIAL     = 0x00000020,
    GAMEPAD_START       = 0x00000800,
    GAMEPAD_TAG         = 0x00000010,

    // Combo
    GAMEPAD_MENUCANCEL  = GAMEPAD_TAG, // 0x00000010
    GAMEPAD_MENUSELECT  = GAMEPAD_JUMP, // 0x00000040
    GAMEPAD_SKIP        = GAMEPAD_TAG | GAMEPAD_JUMP | GAMEPAD_START, // 0x00000850
    GAMEPAD_TOGGLELEFT  = GAMEPAD_L1 | GAMEPAD_L2, // 0x00000005
    GAMEPAD_TOGGLERIGHT = GAMEPAD_R1 | GAMEPAD_R2, // 0x0000000A

    // Special
    GAMEPAD_LIFT        = 0x00000008,
};

#ifdef __cplusplus
}
#endif

#endif // SOLOADER_GAMEPAD_H
