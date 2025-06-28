#!/bin/bash

# --- Color Codes ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# --- Banner ---
clear
echo -e "${CYAN}"
echo " ██████       ██    ██ ██████  ███    ██ ██       █████  ██████  "
echo "██            ██    ██ ██   ██ ████   ██ ██      ██   ██ ██   ██ "
echo "██      █████ ██    ██ ██████  ██ ██  ██ ██      ███████ ██████  "
echo "██             ██  ██  ██      ██  ██ ██ ██      ██   ██ ██   ██ "
echo " ██████         ████   ██      ██   ████ ███████ ██   ██ ██████  "
echo "              ${GREEN}v1.0 - VPN Leak Toolkit by Current Vai${NC}"
echo ""

# --- Input Check ---
if [ -z "$1" ]; then
    echo -e "${RED}[!] Error: You must provide a log file name.${NC}"
    echo -e "${YELLOW}Usage: bash vpnlab.sh <your_log_file.log>${NC}"
    exit 1
fi

LOG_FILE=$1

echo -e "${GREEN}[✔] Toolkit starting...${NC}"
sleep 1

# --- Step 1: WebRTC Test ---
echo -e "\n${CYAN}[*] Step 1: Running WebRTC Leak Test...${NC}"
bash modules/webrtc_test.sh
echo -e "${YELLOW}[!] Check your browser to see if your real IP is visible.${NC}"
sleep 2

# --- Step 2: DNS Leak Test ---
echo -e "\n${CYAN}[*] Step 2: Running DNS Leak Test...${NC}"
bash modules/dns_leak_test.sh
sleep 2

# --- Step 3: VPN Log Analysis ---
echo -e "\n${CYAN}[*] Step 3: Analyzing file '$LOG_FILE'...${NC}"
python3 modules/vpn_log_analyzer.py "$LOG_FILE"
sleep 2

echo -e "\n${GREEN}[✔] All tests completed.${NC}"
