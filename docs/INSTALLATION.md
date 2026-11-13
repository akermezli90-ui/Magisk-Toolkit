# Installation

## Windows tools

Install Android Platform Tools and add `adb` and `fastboot` to your PATH.

Copy the original `.cmd` scripts from `windows/` into a folder in PATH, or add a dedicated scripts folder to PATH.

## WSL offline patcher

Install Ubuntu 24.04 with WSL2. Once the original Linux script is available, install it with:

```bash
sudo install -m 755 wsl/magiskroot /usr/local/bin/magiskroot
```

The author's environment uses the official Magisk APK at `~/.local/share/magiskroot/magisk.apk` and `magiskboot` at `~/.local/share/magiskroot/tools/magiskboot`. The APK and binary must be compatible.

The Windows wrapper targets the WSL distribution `Ubuntu-24.04`. Change this name if your distribution differs.

## Run

```powershell
magiskrootWSL "C:\path\to\boot.img"
```

Expected output: `boot_magisk.img` alongside the input.

**Current status:** The original scripts and automatic dependency setup are not yet included in this repository.
