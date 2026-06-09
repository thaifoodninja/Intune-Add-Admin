@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
setlocal enabledelayedexpansion

set domain=

echo.
echo ========================================
echo Add User to Local Administrators Group
echo ========================================
echo.

set /p kerb="Enter username: "

if "%kerb%"=="" (
    echo Error: Username cannot be empty.
    pause
    exit /b 1
)

echo.
echo Adding AzureAD\%kerb%@%domain% to administrators...
echo.

net localgroup administrators AzureAD\%kerb%@%domain% /add

echo.
if %errorlevel% equ 0 (
    echo Success: User has been added to administrators group.
) else (
    echo Error: Failed to add user. Error code: %errorlevel%
)

echo.
pause
