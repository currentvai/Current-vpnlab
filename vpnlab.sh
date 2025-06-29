#!/bin/bash

# VPN Leak Tester v1.1
# A simple tool to check for common IP, DNS, and WebRTC leaks.

# --- Color Codes ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

# --- Banner ---
clear
echo -e "${CYAN}"
echo " ██████       ██    ██ ██████  ███    ██ ██       █████  ██████  "
echo "██            ██    ██ ██   ██ ████   ██ ██      ██   ██ ██   ██ "
echo "██      █████ ██    ██ ██████  ██ ██  ██ ██      ███████ ██████  "
echo "██             ██  ██  ██      ██  ██ ██ ██      ██   ██ ██   ██ "
echo " ██████         ████   ██      ██   ████ ███████ ██   ██ ██████  "
echo -e "${BLUE}Developed By Current Vai ♚ | Current-vpnlab v1.1${NC}"
echo -e "${YELLOW}© Copyright $(date +%Y) — All Rights Reserved.${NC}"
echo ""
echo -e "${YELLOW}Usage: Run WITH and WITHOUT your VPN to compare results.${NC}"
echo ""

# --- Prerequisites Check ---
if ! command -v jq &> /dev/null || ! command -v curl &> /dev/null; then
    echo -e "${YELLOW}[!] 'jq' or 'curl' not found. Installing them...${NC}"
    pkg install jq curl -y > /dev/null 2>&1
    echo -e "${GREEN}[✔] Dependencies installed. Please run the script again.${NC}"
    exit 1
fi

# --- 1. Public IP Address Check ---
echo -e "${CYAN}[*] Checking Public IP Address...${NC}"
echo "-----------------------------------------------------"
ip_info=$(curl -s http://ip-api.com/json/)
public_ip=$(echo "$ip_info" | jq -r '.query')

if [ -z "$public_ip" ] || [ "$public_ip" == "null" ]; then
    echo -e "${RED}[!] Could not fetch Public IP. Check your internet connection.${NC}"
else
    provider_info=$(echo "$ip_info" | jq -r '.isp + ", " + .country')
    echo -e "${GREEN}Your Public IP is: ${YELLOW}${public_ip}${NC} (${CYAN}${provider_info}${NC})"
fi
echo "-----------------------------------------------------"
sleep 1

# --- 2. DNS Leak Check ---
echo -e "\n${CYAN}[*] Checking for DNS Server Leaks...${NC}"
echo "-----------------------------------------------------"
# We use ipleak.net's API as it's reliable for this
api_response=$(curl -s "https://ipleak.net/json/")
dns_servers=$(echo "$api_response" | jq -r '.dns_servers[]' 2>/dev/null)

if [ -z "$dns_servers" ]; then
    echo -e "${RED}[!] Could not fetch DNS servers. Check your internet connection.${NC}"
else
    echo -e "${GREEN}Your DNS Servers are:${NC}"
    echo "$dns_servers" | while IFS= read -r server; do
        echo -e "  - ${YELLOW}${server}${NC}"
    done
fi
echo "-----------------------------------------------------"
sleep 1

# --- 3. WebRTC Leak Check ---
echo -e "\n${CYAN}[*] Checking for WebRTC Leaks...${NC}"
echo -e "${YELLOW}[!] This test reveals IPs that your browser might be leaking.${NC}"
echo "-----------------------------------------------------"
webrtc_ips=$(echo "$api_response" | jq -r '.webrtc_local_ips[], .webrtc_public_ips[]' 2>/dev/null | sort -u)

if [ -z "$webrtc_ips" ] || [ "$webrtc_ips" == "null" ]; then
    echo -e "${GREEN}[✔] No WebRTC leaks detected through this API method.${NC}"
else
    echo -e "${RED}[!] POTENTIAL WEBRTC LEAK DETECTED!${NC}"
    echo -e "${GREEN}Your system is revealing these IP addresses via WebRTC:${NC}"
    echo "$webrtc_ips" | while IFS= read -r ip; do
        echo -e "  - ${YELLOW}${ip}${NC}"
    done
    echo -e "${YELLOW}If any of these is your REAL public IP, your connection is leaking!${NC}"
fi
echo "-----------------------------------------------------"

echo -e "\n${GREEN}[✔] All tests completed successfully.${NC}"
