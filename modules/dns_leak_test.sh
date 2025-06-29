#!/bin/bash

# --- Color Codes ---
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}[*] Running DNS Leak Test via dnsleak.com...${NC}"
echo "-----------------------------------------------------"

if ! command -v jq &> /dev/null
then
    echo -e "${YELLOW}[!] 'jq' is not installed. Installing it now...${NC}"
    pkg install jq -y > /dev/null 2>&1
fi

# dnsleak.com থেকে JSON ফলাফল আনা এবং jq দিয়ে পার্স করা
# প্রথমবার একটি টেস্ট আইডি তৈরি হয়, দ্বিতীয়বার সেই আইডি দিয়ে ফলাফল আনা হয়
test_id=$(curl -s https://www.dnsleak.com/api/v1/request)
dns_servers=$(curl -s "https://www.dnsleak.com/api/v1/result?id=${test_id}" | jq -r '.servers[] | .ip + " (" + .country_name + ", " + .isp + ")"')

if [ -z "$dns_servers" ]; then
    echo -e "${RED}[!] Could not fetch DNS servers. Check your internet connection or try with a VPN.${NC}"
else
    echo -e "${GREEN}Your DNS Servers are:${NC}"
    while IFS= read -r server_info; do
        echo -e "  - ${YELLOW}${server_info}${NC}"
    done <<< "$dns_servers"
fi
echo "-----------------------------------------------------"
