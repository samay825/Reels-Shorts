@echo off
setlocal enabledelayedexpansion
title Instagram Telegram Bot Manager
color 0F

REM Check if token exists in telegram_config.json
call :check_token

:menu
cls
echo.
echo ========================================
echo    INSTAGRAM TELEGRAM BOT MANAGER
echo ========================================
echo.
echo Please select an option:
echo.
echo [1] Start Bot 24/7 (Background Mode)
echo [2] Stop Bot
echo [3] Check Bot Status
echo [4] Configure Bot Token
echo [5] Exit
echo.
echo ========================================

set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" goto start_bot
if "%choice%"=="2" goto stop_bot
if "%choice%"=="3" goto check_bot
if "%choice%"=="4" goto configure_token
if "%choice%"=="5" goto exit_program

echo.
echo [ERROR] Invalid choice! Please select 1, 2, 3, 4, or 5.
timeout /t 2 /nobreak >nul
goto menu

:start_bot
cls
call "bot_scripts\start_bot_background.bat"
echo.
pause >nul
goto menu

:stop_bot
cls

call "bot_scripts\stop_bot.bat"
echo.
echo Press any key to return to main menu...
pause >nul
goto menu

:check_bot
cls

call "bot_scripts\check_bot.bat"
echo.
echo Press any key to return to main menu...
pause >nul
goto menu

:configure_token
cls
echo.
echo ========================================
echo       BOT TOKEN CONFIGURATION
echo ========================================
echo.
echo Please enter your Telegram Bot Token:
echo (You can get this from @BotFather on Telegram)
echo.
set /p new_token="Bot Token: "

if "!new_token!"=="" (
    echo.
    echo [ERROR] Token cannot be empty!
    timeout /t 2 /nobreak >nul
    goto configure_token
)

REM Update telegram_config.json with new token
echo {"token": "!new_token!"} > telegram_config.json

echo.
echo [SUCCESS] Bot token has been configured successfully!
echo.
echo Press any key to return to main menu...
pause >nul
goto menu

:check_token
REM Check if telegram_config.json exists
if not exist "telegram_config.json" (
    echo {"token": ""} > telegram_config.json
)

REM Read token from telegram_config.json
for /f "tokens=2 delims=:" %%a in ('findstr "token" telegram_config.json') do (
    set token_line=%%a
)

REM Remove quotes and spaces from token
set token_line=!token_line:"=!
set token_line=!token_line: =!
set token_line=!token_line:}=!

REM If token is empty, prompt user to configure it
if "!token_line!"=="" (
    cls
    echo.
    echo ========================================
    echo       BOT TOKEN REQUIRED
    echo ========================================
    echo.
    echo No bot token found in configuration!
    echo You need to configure your Telegram Bot Token first.
    echo.
    echo Press any key to configure your bot token...
    pause >nul
    goto configure_token
)
goto :eof

:exit_program
cls
echo.
echo ========================================
echo    THANK YOU FOR USING BOT MANAGER
echo ========================================
echo.
echo Goodbye!
timeout /t 2 /nobreak >nul
exit