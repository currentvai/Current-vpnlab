#!/bin/bash

# --- Color Codes ---
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${YELLOW}[!] Installing required package (dnsutils)...${NC}"
pkg install dnsutils -y > /dev/null 2>&1

echo -e "${CYAN}[*] Checking for DNS leaks by sending 5 requests...${NC}"
echo -e "   ${YELLOW}If you see multiple different servers (especially your ISP's), you might have a leak.${NC}"
echo "-----------------------------------------------------"

for i in {1..5}
do
    # Get the DNS server IP using dig
    server_ip=$(dig +short whoami.akamai.net @ns1.google.com | tail -n1)
    echo -e "   Test $i: Your DNS server appears to be: ${CYAN}$server_ip${NC}"
    sleep 1
done

echo "-----------------------------------------------------"
echo -e "${YELLOW}[!] Result: All IPs above should belong to your VPN provider, not your actual ISP.${NC}"
