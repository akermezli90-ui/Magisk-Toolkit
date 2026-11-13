@echo off
setlocal EnableExtensions

if "%~1"=="" (
    echo Usage: MagiskRoot boot.img
    exit /b 1
)

if not exist "%~1" (
    echo ERREUR: Fichier introuvable: %~1
    exit /b 1
)

where adb >nul 2>&1
if errorlevel 1 (
    echo ERREUR: ADB introuvable.
    exit /b 1
)

set "INPUT=%~f1"
set "OUTPUT=%~dp1%~n1_magisk.img"
set "REMOTE=/data/local/tmp/magiskroot"

echo.
echo [1/5] Preparation...
adb shell su -c "mkdir -p /data/local/tmp/magiskroot"
if errorlevel 1 goto error
adb shell su -c "chown shell:shell /data/local/tmp/magiskroot"
if errorlevel 1 goto error

adb shell su -c "rm -f /data/adb/magisk/new-boot.img /data/local/tmp/magiskroot/new-boot.img"
if errorlevel 1 goto error

echo.
echo [2/5] Transfert de l'image...
adb push "%INPUT%" "%REMOTE%/boot.img"
if errorlevel 1 goto error

echo.
echo [3/5] Patch Magisk...
adb shell su -c "sh /data/adb/magisk/boot_patch.sh /data/local/tmp/magiskroot/boot.img"
if errorlevel 1 goto error

adb shell su -c "test -s /data/adb/magisk/new-boot.img"
if errorlevel 1 goto error

echo.
echo [4/5] Recuperation sur Windows...
adb shell su -c "cp /data/adb/magisk/new-boot.img /data/local/tmp/magiskroot/new-boot.img"
if errorlevel 1 goto error

adb shell su -c "chown shell:shell /data/local/tmp/magiskroot/new-boot.img"
if errorlevel 1 goto error

adb pull "%REMOTE%/new-boot.img" "%OUTPUT%"
if errorlevel 1 goto error

if not exist "%OUTPUT%" goto error

for %%F in ("%OUTPUT%") do if %%~zF==0 goto error

echo.
echo [5/5] Nettoyage Android...
adb shell su -c "rm -f /data/local/tmp/magiskroot/boot.img /data/local/tmp/magiskroot/new-boot.img /data/adb/magisk/new-boot.img"
if errorlevel 1 (
    echo ATTENTION: Nettoyage incomplet.
    goto success
)

echo Nettoyage termine.

:success
echo.
echo ========================================
echo SUCCES !
echo Image patchee : %OUTPUT%
echo ========================================
exit /b 0

:error
echo.
echo ERREUR: Operation echouee.
echo Les fichiers temporaires peuvent encore etre presents sur Android.
exit /b 1
