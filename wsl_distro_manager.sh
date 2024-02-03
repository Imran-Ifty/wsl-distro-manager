#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

function show_wsl_status() {
    wsl -l -v > /dev/null 2>&1

    if [ $? -ne 0 ]; then
        echo " "
        echo -e "${YELLOW} You are not a WSL user.${NC}"
    else 
        echo " "
        echo -e "${YELLOW} You are already a WSL user.${NC}"
    fi
}

function main_menu() {
    while true; do 
        echo -e "${YELLOW}+--------------------------------------------------+${NC}"
        echo -e "${BLUE}|${NC}                   WSL Manager                    ${BLUE}|${NC}"  
        echo -e "${BLUE}|${NC}                       B Y                        ${BLUE}|${NC}"
        echo -e "${BLUE}|${NC}                 p a r z i v a l                  ${BLUE}|${NC}"
        echo -e "${YELLOW}|--------------------------------------------------|${NC}"
        echo -e "${BLUE}|${GREEN}       ------------ Main Menu   ------------      ${BLUE}|${NC}"
        echo -e "${BLUE}|                                                  |${NC}"
        echo -e "${BLUE}|${YELLOW} 1.${NC} ${CYAN}List Installed Distributions${NC}                  ${BLUE}|${NC}"
        echo -e "${BLUE}|${YELLOW} 2.${NC} ${CYAN}List Available Distributions Online${NC}           ${BLUE}|${NC}"
        echo -e "${BLUE}|${YELLOW} 3.${NC} ${CYAN}Install Ubuntu 22.04${NC}                          ${BLUE}|${NC}"
        echo -e "${BLUE}|${YELLOW} 4.${NC} ${CYAN}Launch Ubuntu${NC}                                 ${BLUE}|${NC}"
        echo -e "${BLUE}|${YELLOW} 5.${NC} ${CYAN}Unregister Ubuntu${NC}                             ${BLUE}|${NC}"      # TODO add multiple methods
        echo -e "${BLUE}|${YELLOW} 6.${NC} ${RED}Exit${NC}                                          ${BLUE}|${NC}"        # update that
        echo -e "${GREEN}|--------------------   User  ---------------------|${NC}"
        echo -e "${GREEN}Please choose an option:${NC}"
        echo -e ""

        read -p "Enter option number: " choice

        case $choice in
            1)
                # List installed distro
                echo -e "${GREEN} ===  Showing Distro === ${NC}"
                wsl -l -v
                ;;

            2)
                # List online distro
                wsl --list --online
                read -p "Enter the distribution name to install: " distro_name
                wsl --install -d "$distro_name"
                echo -e "${GREEN} $distro_name has been installed.. ${NC}"           
                echo "-----------------------------"
                ;;

            3)
                # Install Ubuntu
                echo -e "${GREEN}Ubuntu is installing.... ${NC}"           
                wsl --install -d Ubuntu-22.04
                echo -e "${GREEN}Ubuntu 22.04 has been installed. ${NC}"  
                break
                ;;

            4)
                # Launch current distro
                echo -e "${GREEN}Launching current distro ${NC}"  
                wsl
                ;;

            5)
                echo -e "${GREEN}Unregistering Ubuntu 22.04 ${NC}" 
                wsl --unregister Ubuntu-22.04
                echo -e "${RED}Unregistered Ubuntu 22.04 ${NC}" 
                ;;

            6)
                # Exit
                echo -e "${RED}Exit ${NC}"
                exit  # This will break out of the while loop
                ;;
        esac
    done
}

while true; do
    show_wsl_status
    main_menu
done
