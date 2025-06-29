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
echo "              ${GREEN}v2.0 - IP and DNS Leak Checker${NC}"
echo ""
echo -e "${YELLOW}This tool checks your public IP address and DNS servers.${NC}"
echo -e "${YELLOW}Run it once WITHOUT VPN, and once WITH VPN to see the difference.${NC}"

# --- Step 1: Public IP Address Check ---
echo -e "\n${CYAN}[*] Step 1: Checking Public IP Address...${NC}"
echo "-----------------------------------------------------"

# ifconfig.me ব্যবহার করে পাবলিক আইপি বের করা
PUBLIC_IP=$(curl -s ifconfig.me)

if [ -z "$PUBLIC_IP" ]; then
    echo -e "${RED}[!] Could not fetch Public IP. Check your internet connection.${NC}"
else
    # whois.ipip.net দিয়ে আইপি-র দেশ ও মালিক খুঁজে বের করা
    country_org=$(curl -s "https://whois.ipip.net/json/${PUBLIC_IP}" | jq -r '.data.country, .data.owner' | tr '\n' ' ' | sed 's/ $//')
    echo -e "${GREEN}Your Public IP is: ${YELLOW}${PUBLIC_IP}${NC}"
    echo -e "${GREEN}Provider Info:     ${CYAN}${country_org}${NC}"
fi
echo "-----------------------------------------------------"
sleep 1

# --- Step 2: DNS Leak Test ---
echo -e "\n${CYAN}[*] Step 2: Checking DNS Servers...${NC}"
bash modules/dns_leak_test.sh

echo -e "\n${GREEN}[✔] All checks completed.${NC}"
