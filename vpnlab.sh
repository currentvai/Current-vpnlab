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
echo -e "${GREEN}[✔] Toolkit starting...${NC}"
sleep 1

# --- Step 1: Setup Storage Access and Create Folder ---
echo -e "\n${CYAN}[*] Step 1: Setting up Internal Storage Access...${NC}"
termux-setup-storage

# Create a dedicated folder in internal storage
STORAGE_FOLDER="/sdcard/Current-vpnlab"
echo -e "${CYAN}[*] Creating directory '${STORAGE_FOLDER}'...${NC}"
mkdir -p "$STORAGE_FOLDER"
sleep 1

# --- Step 2: Create Log File from Video List ---
LOG_FILE="$STORAGE_FOLDER/vpnlab.log"
echo -e "\n${CYAN}[*] Step 2: Scanning for video files in internal storage...${NC}"
echo -e "${YELLOW}[!] This might take some time depending on your files...${NC}"

# Find all common video files and save their paths to the log file
find /sdcard -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.mov" -o -iname "*.avi" -o -iname "*.webm" \) > "$LOG_FILE" 2>/dev/null

echo -e "${GREEN}[✔] List of all video files has been saved to '${LOG_FILE}'.${NC}"
sleep 2

# --- Step 3: Run the rest of the toolkit ---
echo -e "\n${CYAN}[*] Step 3: Running WebRTC Leak Test...${NC}"
bash modules/webrtc_test.sh
echo -e "${YELLOW}[!] Check your browser to see if your real IP is visible.${NC}"
sleep 2

echo -e "\n${CYAN}[*] Step 4: Running DNS Leak Test...${NC}"
bash modules/dns_leak_test.sh
sleep 2

# The log analyzer will now analyze the newly created video log
echo -e "\n${CYAN}[*] Step 5: Analyzing the newly created log file...${NC}"
python3 modules/vpn_log_analyzer.py "$LOG_FILE"
sleep 2

echo -e "\n${GREEN}[✔] All tests completed.${NC}"
