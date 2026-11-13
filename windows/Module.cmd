@echo off
setlocal

if "%~1"=="" (
    echo Usage: Module fichier.zip
    exit /b 1
)

if not exist "%~1" (
    echo ERREUR: Fichier introuvable: %~1
    exit /b 1
)

echo.
echo [1/3] Transfert du module...
adb push "%~f1" "/data/local/tmp/%~nx1"
if errorlevel 1 goto error

echo.
echo [2/3] Installation via Magisk...
adb shell su -c "magisk --install-module '/data/local/tmp/%~nx1'"
if errorlevel 1 goto error

echo.
echo [3/3] Installation terminee !
echo Redemarre le telephone pour activer le module.
exit /b 0

:error
echo.
echo ERREUR: Installation echouee.
exit /b 1
