<div align=center>

![banner](https://raw.githubusercontent.com/gist/v-atamanenko/e547f3f0667e4684ca665b11a7ce1e3c/raw/6dd7ce900576ae334cda1886095c09a784663507/solobop_logo.svg "Banner")

</div>

<h1 align=center>Lego Star Wars: The Complete Saga · PSVita Port</h1>

<p align=center>
  <a href="#setup-instructions-for-players">How to install</a> •
  <a href="#controls">Controls</a> •
  <a href="#known-issues">Known Issues</a> •
  <a href="#build-instructions-for-developers">How to compile</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>

Lego Star Wars: The Complete Saga is a Lego-themed action-adventure video game based on the Lego Star Wars line of
construction toys. It is a combination of the game Lego Star Wars: The Video Game and its sequel, Lego Star Wars
II: The Original Trilogy, which span the first six episodes of the Skywalker Saga.

This repository contains a loader for **the Android release of Lego Star Wars: The Complete Saga v2.0.0.5**, based on
the [Android SO Loader by TheFloW][gtasa]. The loader provides a tailored, minimalistic Android-like environment to run
the official ARMv7 game executable on the PS Vita.

Disclaimer
----------

**LEGO® STAR WARS™: THE COMPLETE SAGA** software © 2022 TT Games Publishing Ltd. LEGO, the LEGO logo, the Brick and the
Knob configurations and the Minifigure are trademarks of the LEGO Group. © 2022 The LEGO Group. LucasArts and the
LucasArts logo are registered trademarks of Lucasfilm Ltd. © 2022 Lucasfilm Entertainment Company Ltd. or Lucasfilm Ltd.
® or TM as indicated, which are owned by Disney Enterprises, Inc. All rights reserved.

The work presented in this repository is not "official" or produced or sanctioned by the owner(s) of the aforementioned
trademark(s) or any other registered trademark mentioned in this repository.

This software does not contain the original code, executables, or other non-redistributable parts of the original game
product. The authors of this work do not promote or condone piracy in any way. To launch and play the game on their PS
Vita device, users must possess their own legally obtained copy of the game in the form of an .apk file.

Setup Instructions (For Players)
--------------------------------

In order to properly install the game, you'll have to follow these steps precisely:

- (Recommended) Make sure that you are either on 3.60 enso or 3.65 enso firmware version. Other versions may work too,
  but no support is provided for them! If you experience any issues apart from those described in
  the [Known Issues](#known-issues) section, please upgrade or downgrade your firmware accordingly before asking for
  support.

- Install or update [kubridge][kubridge] and [FdFix][fdfix] by copying `kubridge.skprx` and `fd_fix.skprx` to your
  taiHEN plugins folder (usually `ur0:tai`) and adding two entries to your `config.txt` under `*KERNEL`:

```
  *KERNEL
  ur0:tai/kubridge.skprx
  ur0:tai/fd_fix.skprx
```

```diff
! ⚠️ Don't install `fd_fix.skprx` if you're using the rePatch plugin!
```

```diff
- ⚠️ Even if you had `kubridge.skprx` installed before, most likely you still
- need to update it, since a new version of the plugin was released at the same
- time as this port. kubridge v0.3.1 or newer is required to run the game!
```

- Make sure you have `libshacccg.suprx` in the `ur0:/data/` folder on your console. If you don't,
  use [ShaRKBR33D][shrkbrd] to get it quickly and easily.

- <u>Legally</u> obtain your copy of Lego Star Wars: The Complete Saga for Android in a form of an `.apk` file and data
  files. This port is tailored for the v2.0.2.02(20202) version of the game. **Older versions will not work**. Newer
  versions may work, but no support is provided for them.

    - If you have it installed on your phone, you can [get all the required files directly from it][unpack-on-phone] or
      by using any APK extractor you can find on Google Play. **Note, this app uses split apks**.

> ℹ️ Verify that your build is the correct one using **sha1sum** (can also be found as an online tool). sha1sum for
> `lib/armeabi-v7a/libTTapp.so` **must** be `291321330a3789414cab7d411dae64debc990ad6`

- Open the `.apk` with any zip explorer (like [7-Zip](https://www.7-zip.org/)) and extract the file
  `lib/armeabi-v7a/libTTapp.so` from the `.apk` into `ux0:data/lswtcs/` on your Vita. Example of a correct resulting
  path: `ux0:data/lswtcs/libTTapp.so`

- Fetch the game data files from your device. You can find them in the internal data folder of the device, **rooted
  device might be required**. Copy the file you find there (`Audio.dat`, `Levels.dat`, `Other.dat`, and `Textures.dat`)
  to `ux0:data/lswtcs/` on your Vita. Example of a correct resulting path: `ux0:data/lswtcs/Audio.dat`.

- Install `lswtcs.vpk` (from [Releases][latest-release]).

- (Optional) Install [CapUnlocker](https://github.com/GrapheneCt/CapUnlocker). It may give you a bit better performance.

Controls
--------

WIP

Known Issues
------------

- Cutscenes don't play and must be manually skipped (press start). Level 1-2, and 3-6 cutscenes can't be skipped, making
  it impossible to finish.
- Some sounds don't play correctly

Build Instructions (For Developers)
----------------

In order to build the loader, you'll need a [vitasdk](https://github.com/vitasdk) build fully compiled with softfp
usage. The easiest way to obtain one is following the instructions on https://vitasdk.org/ while replacing the URL in
this command:

```bash
git clone https://github.com/vitasdk/vdpm
```

Like this:

```bash
git clone https://github.com/vitasdk-softfp/vdpm
```

All the required libraries should get installed automatically if you follow the installation process
from https://vitasdk.org/.

After all these requirements are met, you can compile the loader with the following commands:

```bash
cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Debug # Or =Release if you don't want debug logging
cmake --build build -j$(nproc)
```

Also note that this CMakeLists has two "convenience targets". While developing, I highly recommend using them, like
this:

```bash
cmake --build build --target send # Build, upload eboot.bin and run (requires vitacompanion)
cmake --build build --target dump # Fetch latest coredump and parse
```

For more information and build options, read the [CMakeLists](CMakeLists.txt).

Credits
-------

- [Andy "The FloW" Nguyen][flow] for the original .so loader.
- [Rinnegatamante][rinne] for help with rendering issues.
- [Volodymyr Atamanenko][v-atamanenko] for
  the [boilerplate template](https://github.com/v-atamanenko/soloader-boilerplate)
- [GrapheneCt][graph] for CapUnlocker.

License
-------

This software may be modified and distributed under the terms of the MIT license. See the [LICENSE](LICENSE) file for
details.

[gtasa]: https://github.com/TheOfficialFloW/gtasa_vita

[kubridge]: https://github.com/bythos14/kubridge/releases/

[fdfix]: https://github.com/TheOfficialFloW/FdFix/releases/

[unpack-on-phone]: https://stackoverflow.com/questions/11012976/how-do-i-get-the-apk-of-an-installed-app-without-root-access

[shrkbrd]: https://github.com/Rinnegatamante/ShaRKBR33D/releases/latest

[latest-release]: https://github.com/gm666q/lswtcs-vita/releases/latest

[issue]: https://github.com/gm666q/lswtcs-vita/issues/new

[flow]: https://github.com/TheOfficialFloW/

[graph]: https://github.com/GrapheneCt/

[rinne]: https://github.com/Rinnegatamante/

[v-atamanenko]: https://github.com/v-atamanenko/
