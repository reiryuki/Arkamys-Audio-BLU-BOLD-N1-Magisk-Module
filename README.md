# Arkamys Audio BLU BOLD N1 Magisk Module

## DISCLAIMER
- Arkamys apps and blobs are owned by Arkamys™.
- The MIT license specified here is for the Magisk Module only, not for Arkamys apps and blobs.

## Description
Equalizer global type sound effect ported from BLU BOLD N1 (N0030WW) and integrated as a Magisk Module for all supported and rooted devices with Magisk

## Sources
- https://dumps.tadiphone.dev/dumps/blu/n0030ww full_k71v1_64_bsp-user-9-PPR1.180610.011-1571196448-release-keys
- Reverse engeneered by @isus203

## Download Links and Changelog

v2.0 https://github.com/reiryuki/Arkamys-Audio-BLU-BOLD-N1-Magisk-Module
- Reverse engeneered by @isus203
  - Add user interface with some new features
  - 64 bit audio service support
  - Enhances headset mode and Bluetooth mode audio
- Minimum SDK 28 (Android 9)
- Remove akm script
- Remove libmagiskpolicy.so
- Resets module folders/files permissions at post-fs-data
- Removes conflicted weird modules

v1.9 https://move2link.co/bd79401
- Support NoMount metamodule
- Update libmagiskpolicy.so from Magisk (stable) 30.7 (30700)
- Move _uninstall.log to /data/adb/logs/

v1.8
- Does not disable raw playback (You can use Audio Compatibility Patch Reborn Magisk Module instead)

v1.7
- Fix wrong target in latest KernelSU

v1.6
- Tidy up aml.sh
- Exclude \*audio\*effects\*haptic\*.xml
- Abort installation if fail to mount mirror system
- Fix wrong file permissions in some ROMs

v1.5
- Improve /odm and /my_product support detection

v1.4
- Improve akm script

v1.3
- Add Action button to clear apps caches
- Fix architecture detection in some weird ROMs
- Fix bug in uninstall.sh

v1.2
- Allow installation in Android Emulator
- Fix architecture detection

v1.1
- Using hardwareaudio instead of audio* for AUDIO64BIT detection

## Download Tutorial
https://t.me/ryukinotes/97

## Screenshot
https://t.me/ryukimodsscreenshots/126

## Requirements
- arm64-v8a or armeabi-v7a architecture
- HIDL audio service
- Android 9 (SDK 28) and up
- Magisk or Kitsune Mask or KernelSU or Apatch installed

## Installation Guide
- If you are using KernelSU, you need to disable Unmount Modules by Default in KernelSU app settings and install https://github.com/KernelSU-Modules-Repo/meta-overlayfs or https://github.com/KernelSU-Modules-Repo/magic_mount_rs or https://github.com/KernelSU-Modules-Repo/hybrid_mount or https://github.com/maxsteeel/nomount first depending on ROM compatibility
- Install this module via Magisk app or Kitsune Mask app or KernelSU app or Apatch app or Recovery if Magisk or Kitsune Mask installed
- Install AML Magisk Module https://t.me/ryukinotes/34 only if using any other else audio mod module
- Reboot
- If you are using KernelSU, you need to allow superuser list manually all package name listed in package.txt (enable show system apps) and reboot afterwards

## Optionals
- Global: https://t.me/ryukinotes/35
- Stream: https://t.me/ryukinotes/52

## Troubleshootings
Global: https://t.me/ryukinotes/34

## Support & Bug Report
- https://t.me/ryukinotes/54
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- @HuskyDG
- @isus203
- https://t.me/viperatmos
- https://t.me/androidryukimodsdiscussions
- https://t.me/androidappsportdevelopment

## Sponsors
https://t.me/ryukinotes/25


