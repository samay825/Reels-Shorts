@echo off
title Instagram Telegram Bot - Background Starter with Popup
color 0A

echo.
echo ========================================
echo   INSTAGRAM TELEGRAM BOT BACKGROUND
echo ========================================
echo.

:: Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH!
    :: Show error popup
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Python is not installed or not in PATH!', 'Error', 'OK', 'Error')"
    pause
    exit /b 1
)

:: Change to parent directory
cd /d "%~dp0.."

:: Check Telegram token configuration
python -c "import json; f=open('telegram_config.json'); data=json.load(f); token=data.get('token', ''); f.close(); exit(0 if token else 1)" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Telegram token is not configured!
    echo Please configure token in telegram_config.json
    :: Show error popup
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Telegram token is not configured! Please configure token in telegram_config.json', 'Configuration Error', 'OK', 'Warning')"
    pause
    exit /b 1
)

:: Install requirements
echo [INFO] Installing requirements...
pip install -r requirements.txt >nul 2>&1

echo [INFO] Starting bot in background...

:: Start the bot using PowerShell
powershell -WindowStyle Hidden -Command "Start-Process python -ArgumentList 'main.py' -WindowStyle Hidden"

:: Wait for process to start
echo [INFO] Waiting for bot to start...
timeout /t 5 /nobreak >nul

:: Check if bot is running by looking for python processes
echo [INFO] Checking if bot is running...
tasklist /FI "IMAGENAME eq python.exe" /FO CSV | findstr "python.exe" >nul
if not errorlevel 1 (
    echo.
    echo [SUCCESS] Bot started in background!
    echo.
    echo ========================================
    echo Bot is now running in background mode.
    echo To stop the bot, run: stop_bot.bat
    echo ========================================
    echo.
    echo Test your bot: @bot
    echo.
    
    :: Show success popup
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Bot started successfully in background! Bot is now running in background mode. To stop the bot, run: stop_bot.bat Test your bot: @bot', 'Success!', 'OK', 'Information')"
    
) else (
    echo.
    echo [ERROR] Failed to start bot in background.
    echo Try running a simple start instead.
    echo.
    
    :: Show error popup
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Failed to start bot in background! Try running a simple start instead. Check if main.py exists and is working properly.', 'Error!', 'OK', 'Error')"
)

echo.
echo Press any key to exit...
pause >nul
