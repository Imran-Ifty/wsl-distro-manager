
@echo off

:start
cls && color 03

for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a")


echo.
echo.
:: Check if any WSL distributions are installed
wsl -l -v >nul 2>&1
if %errorlevel% neq 0 (
    echo You are not a WSL user.
    goto :menu
) else (
    echo You are already a WSL user.
    goto :menu
)

echo.
:menu
echo =======================================================
echo            WSL Distro Management Menu
echo =======================================================
echo [1] List Installed Distributions
echo [2] List Available Distributions Online
echo [3] Install Ubuntu 22.04
echo [4] Launch Ubuntu
echo [5] Unregister Ubuntu
echo [6] Exit
echo -------------------------------------------------------
set /p choice=Enter your choice (1-6): 

if "%choice%"=="1" goto list_installed
if "%choice%"=="2" goto list_available
if "%choice%"=="3" goto install_ubuntu_22_04
if "%choice%"=="4" goto launch_ubuntu
if "%choice%"=="5" goto unregister_ubuntu
if "%choice%"=="6" goto exit_script

:list_installed
echo =======================================================
echo          Installed Distributions
echo =======================================================
wsl -l -v
pause
goto start

:list_available
echo =======================================================
echo          Available Distributions Online
echo =======================================================
wsl --list --online
set /p distro_name=Enter the distribution name to install: 
wsl --install -d %distro_name%
echo %distro_name% has been installed.
pause
goto start

:install_ubuntu_22_04
wsl --install -d Ubuntu-22.04
echo Ubuntu 22.04 has been installed.
pause
goto start

:launch_ubuntu
wsl
goto start

:unregister_ubuntu
wsl --unregister Ubuntu-22.04
echo Unregistered Ubuntu 22.04.
pause
goto start


:PainText
<nul set /p "=%DEL%" > "%~2"
findstr /v /a:%1 /R "+" "%~2" nul
del "%~2" > nul
goto :eof


:exit_script
exit
