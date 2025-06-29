#!/bin/bash

# --- Color Codes ---
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}[*] Running DNS Leak Test via web service...${NC}"
echo "-----------------------------------------------------"

# bash.ws/dnsleak সাইটটি ব্যবহার করে DNS সার্ভারগুলো বের করা হচ্ছে
# এই সাইটটি JSON ফরম্যাটে ফলাফল দেয়, যা jq দিয়ে পার্স করা সহজ
if ! command -v jq &> /dev/null
then
    echo -e "${YELLOW}[!] 'jq' is not installed. Installing it now...${NC}"
    pkg install jq -y > /dev/null 2>&1
fi

# API থেকে ফলাফল আনা এবং jq দিয়ে পার্স করা
dns_servers=$(curl -s https://bash.ws/dnsleak/json | jq -r '.[].ip' | sort -u)

if [ -z "$dns_servers" ]; then
    echo -e "${RED}[!] Could not fetch DNS servers. Check your internet connection.${NC}"
else
    echo -e "${GREEN}Your DNS Servers are:${NC}"
    while IFS= read -r server; do
        # whois.ipip.net দিয়ে সার্ভারের দেশ ও মালিক খুঁজে বের করা
        country_org=$(curl -s "https://whois.ipip.net/json/${server}" | jq -r '.data.country, .data.owner' | tr '\n' ' ' | sed 's/ $//')
        echo -e "  - ${YELLOW}${server}${NC} (${CYAN}${country_org}${NC})"
    done <<< "$dns_servers"
fi
echo "-----------------------------------------------------"
