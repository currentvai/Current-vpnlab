#!/bin/bash

# --- Color Codes ---
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}[*] Opening WebRTC test page in your browser...${NC}"
echo -e "${YELLOW}[!] Important: On the opened page, check the 'Public IP Address' section.${NC}"
echo -e "${YELLOW}--> If you see your real IP address there, your VPN is leaking!${NC}"

# Try to open URL in Termux or a Linux desktop
termux-open-url https://browserleaks.com/webrtc 2>/dev/null || xdg-open https://browserleaks.com/webrtc 2>/dev/null || echo -e "${RED}[!] Could not open browser. Please open this link manually: https://browserleaks.com/webrtc${NC}"
