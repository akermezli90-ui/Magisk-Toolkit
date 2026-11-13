# Magisk Toolkit

Windows and WSL utilities for Magisk module installation and Android boot image patching.

## Included tools

| Tool | Environment | Purpose |
| --- | --- | --- |
| `Module.cmd` | Windows + ADB | Install Magisk modules on a connected Android device |
| `MagiskRoot.cmd` | Windows + ADB | Patch boot images using Magisk installed on a phone |
| `magiskrootWSL.cmd` | Windows + WSL | Invoke the offline Linux patcher from Windows |
| `magiskroot` | Ubuntu WSL | Patch boot images offline, without a connected phone |

**Project status:** Documentation is published. The author's original scripts are still pending upload from the Windows/WSL machine. No reconstructed scripts are presented as originals.

## Quick start

After installing the original scripts, run:

```powershell
magiskrootWSL "C:\path\to\boot.img"
```

Expected output: `boot_magisk.img` next to the original image.

## Documentation

- [Installation](docs/INSTALLATION.md)
- [Usage](docs/USAGE.md)
- [Safety](docs/SAFETY.md)

## Requirements

- Windows 10/11
- Android Platform Tools for ADB-based tools
- Ubuntu 24.04 on WSL2 for offline patching
- A compatible official Magisk APK and `magiskboot` binary

## Credits

Magisk is developed by [topjohnwu](https://github.com/topjohnwu/Magisk). This repository is an independent collection of helper scripts, not an official Magisk distribution.
