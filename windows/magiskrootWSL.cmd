@echo off
setlocal

if "%~1"=="" (
    echo Usage: magiskrootWSL "C:\chemin\boot.img"
    exit /b 1
)

if not exist "%~f1" (
    echo ERREUR: fichier introuvable: "%~f1"
    exit /b 1
)

wsl.exe -d Ubuntu-24.04 -- bash -c 'exec /usr/local/bin/magiskroot "$(wslpath -u "$1")"' bash "%~f1"

exit /b %errorlevel%
