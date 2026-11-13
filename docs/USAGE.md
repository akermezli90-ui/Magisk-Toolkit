# Usage

## Module.cmd

Windows/ADB-based Magisk module installation helper. The exact supported parameters will be documented after the original script is uploaded.

## MagiskRoot.cmd

Device-assisted image patching through Magisk installed on a connected Android phone. ADB access is required.

## magiskrootWSL.cmd

Windows wrapper for the offline WSL patcher:

```powershell
magiskrootWSL "C:\path\to\boot.img"
```

## magiskroot

Linux patching utility installed at `/usr/local/bin/magiskroot`. It runs Magisk's official patching components offline.

The author's tested environment uses Magisk 31.1, `KEEPVERITY=true`, and `KEEPFORCEENCRYPT=true`. A patch created offline may differ from one created on the device.

A successful patch does not guarantee that the image will boot.
