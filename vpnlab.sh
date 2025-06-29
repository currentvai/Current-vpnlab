#!/bin/bash

# --- Color Codes ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# --- Banner ---
clear
echo -e "${CYAN}"
echo " ██████       ██    ██ ██████  ███    ██ ██       █████  ██████  "
echo "██            ██    ██ ██   ██ ████   ██ ██      ██   ██ ██   ██ "
echo "██      █████ ██    ██ ██████  ██ ██  ██ ██      ███████ ██████  "
echo "██             ██  ██  ██      ██  ██ ██ ██      ██   ██ ██   ██ "
echo " ██████         ████   ██      ██   ████ ███████ ██   ██ ██████  "
echo "              ${GREEN}v2.1 - IP and DNS Leak Checker${NC}"
echo ""
echo -e "${YELLOW}This tool checks your public IP address and DNS servers.${NC}"
echo -e "${YELLOW}Run it once WITHOUT VPN, and once WITH VPN to see the difference.${NC}"

# --- Step 1: Public IP Address Check ---
echo -e "\n${CYAN}[*] Step 1: Checking Public IP Address...${NC}"
echo "-----------------------------------------------------"

# ip-api.com ব্যবহার করে সব তথ্য একসাথে আনা
API_RESPONSE=$(curl -s http://ip-api.com/json)
PUBLIC_IP=$(echo "$API_RESPONSE" | jq -r '.query')

if [ -z "$PUBLIC_IP" ] || [ "$PUBLIC_IP" == "null" ]; then
    echo -e "${RED}[!] Could not fetch Public IP. Check your internet connection.${NC}"
else
    PROVIDER_INFO=$(echo "$API_RESPONSE" | jq -r '.country, .isp' | tr '\n' ' ' | sed 's/ $//')
    echo -e "${GREEN}Your Public IP is: ${YELLOW}${PUBLIC_IP}${NC}"
    echo -e "${GREEN}Provider Info:     ${CYAN}${PROVIDER_INFO}${NC}"
fi
echo "-----------------------------------------------------"
sleep 1

# --- Step 2: DNS Leak Test ---
echo -e "\n${CYAN}[*] Step 2: Checking DNS Servers...${NC}"
bash modules/dns_leak_test.sh

echo -e "\n${GREEN}[✔] All checks completed.${NC}"
