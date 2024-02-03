# wsl-distro-manager
 A simple Windows Batch script for managing Windows Subsystem for Linux (WSL) distributions. It allows users to list installed distributions, list available distributions online, install Ubuntu 22.04, launch Ubuntu, unregister Ubuntu, and exit the script. 

## Features

- List installed distributions
- List available distributions online
- Install Ubuntu 22.04
- Launch Ubuntu
- Unregister Ubuntu
- Exit the script

## Prerequisites

- Windows operating system with WSL installed.

 ## How to Use
 # Using batch file [.bat] 
 1. Clone the repository:
    ```bash
    https://github.com/Imran-Ifty/wsl-distro-manager.git
 2. Navigate to the repository
    ```bash 
    cd wsl-distro-manager
 3. Run the script:
    ```bash
    wsl_distro_manager.bat
 
 # Using shell script [.sh]
 1. Do the same for this too
 2. Open Command Prompt of Powershell
 3. Run the Command
    ```bash
    chmod +x wsl_distro_manager.sh
    ./wsl_distro_manager.sh
 this will work as same 
 
## Problem you might face
If  you haven't enable WSL [Linux subsytem] then 
1. Open PowerShell as an Administrator.
2. Run the following command to enable the WSL feature:
     ```bash
     dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
3.Restart your computer.
After enabling WSL, you can proceed with [wsl-distro-manager] script or any other WSL-related tasks. 

Follow the on-screen menu to perform various WSL distribution management tasks. For more information on Windows Subsystem for Linux (WSL), you can visit the [official Microsoft WSL Documentation](https://learn.microsoft.com/en-us/windows/wsl/about).

