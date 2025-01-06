#!/bin/bash

# This script is an all-in-one NMAP utility tool.

# Display a welcome message
echo "=================================="
echo "       NMAP Utility Tool          "
echo "=================================="
sleep 1
echo "An all-in-one script to perform various NMAP scans."
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
read -p "Choose an option (1-8): " OPTION

# Validate the option
if ! [[ "${OPTION}" =~ ^[1-8]$ ]]; then
    echo "Invalid option. Please choose a number between 1 and 8."
    exit 1
fi

# Ask for domain or IP address
read -p "Enter the target domain, host, or IP address: " DOMAIN

# Validate domain or IP input
if [[ -z "${DOMAIN}" ]]; then
    echo "No target provided. Exiting..."
    exit 1
fi

echo "Selected Option: ${OPTION} - Target: ${DOMAIN}"
echo "---------------------------------------------"
sleep 1

# Execute the appropriate scan based on user input
case "${OPTION}" in
    1)
        echo "Scanning Top 1000 Ports with Verbosity Level 1..."
        nmap -v1 "${DOMAIN}"
        ;;
    2)
        echo "Performing Aggressive Ping Sweep..."
        nmap -sn "${DOMAIN}"
        ;;
    3)
        echo "OS Detection, Version Detection, Script Scanning, and Traceroute..."
        echo "Provide a file containing host(s) to scan:"
        read -p "Enter the file path: " FILE
        if [[ -f "${FILE}" ]]; then
            nmap -A -iL "${FILE}"
        else
            echo "File not found. Exiting..."
            exit 1
        fi
        ;;
    4)
        echo "Scanning Specific Ports..."
        read -p "Enter the port range (e.g., 1-65535): " PORTS
        nmap -p "${PORTS}" "${DOMAIN}"
        ;;
    5)
        echo "Service and Version Detection of Top 1000 Ports..."
        nmap -sV "${DOMAIN}"
        ;;
    6)
        echo "Scanning Using Default and Safe NSE Scripts..."
        nmap --script=safe "${DOMAIN}"
        ;;
    7)
        echo "Scanning for Web Servers on Ports 80 and 443 with HTTP NSE Scripts..."
        nmap -p 80,443 --script=http* "${DOMAIN}"
        ;;
    8)
        echo "Evading IDS/IPS Detection..."
        nmap -sS -T2 -D RND:10 -f -data-length 64 "${DOMAIN}"
        ;;
    *)
        echo "Invalid option. Exiting..."
        exit 1
        ;;
esac

echo "---------------------------------------------"
echo "Scan Completed for ${DOMAIN}. Exiting..."
exit 0

