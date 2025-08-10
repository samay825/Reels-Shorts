@echo off
title Instagram Telegram Bot - Background Starter
color 0A

echo.
echo ========================================
echo   INSTAGRAM TELEGRAM BOT BACKGROUND
echo ========================================
echo.


python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH!
    pause
    exit /b 1
)


cd /d "%~dp0.."


python -c "import json; f=open('telegram_config.json'); data=json.load(f); token=data.get('token', ''); f.close(); exit(0 if token else 1)" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Telegram token is not configured!
    echo Please configure token in telegram_config.json
    pause
    exit /b 1
)


pip install -r requirements.txt >nul 2>&1

echo [INFO] Starting bot in background...


echo Set WshShell = CreateObject("WScript.Shell") > start_bg.vbs
echo WshShell.CurrentDirectory = "%CD%" >> start_bg.vbs
echo WshShell.Run "python main.py", 0, False >> start_bg.vbs


cscript //nologo start_bg.vbs


timeout /t 3 /nobreak >nul


tasklist /FI "IMAGENAME eq python.exe" | findstr "python.exe" >nul
if not errorlevel 1 (
    echo [SUCCESS] Bot started in background!
    echo.
    echo Bot is now running in background mode.
    echo To stop the bot, run: stop_bot.bat
    echo.
    echo Test your bot: @bot
) else (
    echo [ERROR] Failed to start bot in background.
    echo Try running: start_bot_simple.bat
)


if exist "start_bg.vbs" del "start_bg.vbs" >nul 2>&1

echo.
pause