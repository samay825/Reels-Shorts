@echo off
title Instagram Telegram Bot - Status Check
color 0B

echo.
echo ========================================
echo    INSTAGRAM TELEGRAM BOT STATUS
echo ========================================
echo.


cd /d "%~dp0.."

echo [INFO] Checking bot status...
echo.


tasklist /FI "IMAGENAME eq python.exe" | findstr "python.exe" >nul
if not errorlevel 1 (
    echo [STATUS] Python processes found:
    echo.
    tasklist /FI "IMAGENAME eq python.exe" /FO TABLE
    echo.
    echo [INFO] Bot appears to be RUNNING
    echo.
    
    
    echo [DETAILS] Process information:
    for /f "tokens=2" %%i in ('tasklist /FI "IMAGENAME eq python.exe" /FO CSV /NH') do (
        set "pid=%%i"
        set "pid=!pid:"=!"
        echo Process ID: !pid!
    )
) else (
    echo [STATUS] No Python processes found
    echo [INFO] Bot appears to be STOPPED
)

echo.


if exist "telegram_config.json" (
    echo [CONFIG] telegram_config.json - EXISTS
) else (
    echo [CONFIG] telegram_config.json - MISSING
)


if exist "main.py" (
    echo [CONFIG] main.py - EXISTS
) else (
    echo [CONFIG] main.py - MISSING
)


if exist "requirements.txt" (
    echo [CONFIG] requirements.txt - EXISTS
) else (
    echo [CONFIG] requirements.txt - MISSING
)

echo.
echo ========================================
echo         STATUS CHECK COMPLETE
echo ========================================
echo.
pause