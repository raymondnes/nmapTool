#!/bin/bash

# This script is an all-in-one NMAP utility tool.

# Define color variables
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"

# Display a welcome message with ASCII art
cat << 'EOF'

                                ______
             |\_______________ (_____\\________________
      HH======#H###############H#######################
              ''''~""""""""""""""`##(R))#H""""Y########
                                  ))    \#H\      "Y###                                  
                                  "      }#H)

EOF

sleep 2

echo -e "${RED}====================================================${RESET}"
echo -e "${RED}            NMAP Utility Tool By STINGRAY           ${RESET}"
echo -e "${RED}====================================================${RESET}"

sleep 1
echo -e "${BLUE}An all-in-one script to perform various NMAP scans.${RESET}"
date +"Date: %d-%m-%Y  Time: %H:%M:%S"
sleep 1

# Display the options
cat << EOF

Available Scan Options:

1. Scan Top 1000 Ports with Verbosity Levels
2. Aggressive Ping Sweep
3. Enable OS Detection, Version Detection, Script Scanning, and Traceroute (from a file)
4. Scan Specific Ports (e.g., 1-65535)
5. Service and Version Detection of Top 1000 Ports
6. Scan Using Default and Safe NSE Scripts
7. Scan for Web Servers (Port 80 and 443) Using HTTP NSE Scripts
8. Evade IDS/IPS (Slow Scan, Decoy, Fragmentation, Random Data)

EOF

# Prompt user for input
read -p "$(echo -e "${CYAN}Choose an option (1-8): ${RESET}")" OPTION

# Trim whitespace from input
OPTION=$(echo "${OPTION}" | xargs)

# Validate the option
if ! [[ "${OPTION}" =~ ^[1-8]$ ]]; then
    echo -e "${RED}Invalid option. Please choose a number between 1 and 8.${RESET}"
    exit 1
fi

# Ask for domain or IP address
read -p "$(echo -e "${CYAN}Enter the target domain, host, or IP address: ${RESET}")" DOMAIN

# Validate domain or IP input
if [[ -z "${DOMAIN}" ]]; then
    echo -e "${RED}No target provided. Exiting...${RESET}"
    exit 1
fi

echo -e "${YELLOW}Selected Option: ${OPTION} - Target: ${DOMAIN}${RESET}"
echo -e "${CYAN}---------------------------------------------${RESET}"
sleep 1

# Execute the appropriate scan based on user input
case "${OPTION}" in
    1)
        echo -e "${GREEN}Scanning Top 1000 Ports with Verbosity Level 1...${RESET}"
        nmap -v "${DOMAIN}"
        ;;
    2)
        echo -e "${CYAN}Performing Aggressive Ping Sweep...${RESET}"
        nmap -sn "${DOMAIN}"
        ;;
    3)
        echo -e "${BLUE}OS Detection, Version Detection, Script Scanning, and Traceroute...${RESET}"
        read -p "$(echo -e "${CYAN}Enter the file path containing hosts: ${RESET}")" FILE
        if [[ -f "${FILE}" ]]; then
            nmap -A -iL "${FILE}"
        else
            echo -e "${RED}File not found. Exiting...${RESET}"
            exit 1
        fi
        ;;
    4)
        echo -e "${YELLOW}Scanning Specific Ports...${RESET}"
        read -p "$(echo -e "${CYAN}Enter the port range (e.g., 1-65535): ${RESET}")" PORTS
        nmap -p "${PORTS}" "${DOMAIN}"
        ;;
    5)
        echo -e "${GREEN}Service and Version Detection of Top 1000 Ports...${RESET}"
        nmap -sV "${DOMAIN}"
        ;;
    6)
        echo -e "${CYAN}Scanning Using Default and Safe NSE Scripts...${RESET}"
        nmap --script=safe "${DOMAIN}"
        ;;
    7)
        echo -e "${BLUE}Scanning for Web Servers on Ports 80 and 443 with HTTP NSE Scripts...${RESET}"
        nmap -p 80,443 --script=http* "${DOMAIN}"
        ;;
    8)
        echo -e "${RED}Evading IDS/IPS Detection...${RESET}"
        nmap -sS -T2 -D RND:10 -f -data-length 64 "${DOMAIN}"
        ;;
    *)
        echo -e "${RED}Invalid option. Exiting...${RESET}"
        exit 1
        ;;
esac

echo -e "${GREEN}---------------------------------------------${RESET}"
echo -e "${GREEN}Scan Completed for ${DOMAIN}. Exiting...${RESET}"
exit 0

