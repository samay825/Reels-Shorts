@echo off
title Instagram Telegram Bot - Stop Bot
color 0C

echo.
echo ========================================
echo      STOP INSTAGRAM TELEGRAM BOT
echo ========================================
echo.

echo [INFO] Stopping bot processes...

:: Method 1: Kill all python processes (simple approach)
echo [INFO] Terminating Python processes...
tasklist /FI "IMAGENAME eq python.exe" | findstr "python.exe" >nul
if not errorlevel 1 (
    taskkill /F /IM python.exe >nul 2>&1
    if not errorlevel 1 (
        echo [SUCCESS] Python processes terminated!
    ) else (
        echo [WARNING] Some processes may still be running.
    )
) else (
    echo [INFO] No Python processes found.
)

:: Method 2: Wait and verify
timeout /t 2 /nobreak >nul
echo [INFO] Verifying bot status...

:: Check if any python processes are still running
tasklist /FI "IMAGENAME eq python.exe" | findstr "python.exe" >nul
if errorlevel 1 (
    echo [SUCCESS] All Python processes stopped!
    echo [INFO] Bot has been successfully terminated.
) else (
    echo [WARNING] Some Python processes are still running.
    echo.
    echo Current Python processes:
    tasklist /FI "IMAGENAME eq python.exe"
    echo.
    echo [INFO] If these are bot processes, you can:
    echo 1. Run this script again
    echo 2. Manually kill them in Task Manager
    echo 3. Restart your computer
)

:: Clean up any VBS files
echo [INFO] Cleaning up temporary files...
if exist "..\run_bot.vbs" del "..\run_bot.vbs" >nul 2>&1
if exist "..\start_bg.vbs" del "..\start_bg.vbs" >nul 2>&1

echo.
echo ========================================
echo           OPERATION COMPLETE
echo ========================================
pause