import re
import sys

# --- Color Codes ---
RED = '\033[0;31m'
GREEN = '\033[0;32m'
YELLOW = '\033[1;33m'
CYAN = '\033[0;36m'
NC = '\033[0m' # No Color

print(f"{CYAN}🧠 VPN Log Analyzer running...{NC}")

if len(sys.argv) < 2:
    print(f"{RED}[!] Error: No log file provided.{NC}")
    sys.exit(1)

log_file = sys.argv[1]

try:
    with open(log_file, 'r') as f:
        data = f.read()
    
    # Regular expression to find IPv4 addresses
    ips = set(re.findall(r'(?:[0-9]{1,3}\.){3}[0-9]{1,3}', data))

    if not ips:
        print(f"{YELLOW}[!] No IP addresses found in this log.{NC}")
    else:
        print(f"{GREEN}[+] Found a total of {len(ips)} unique IP addresses in the log:{NC}")
        for ip in sorted(list(ips)):
            print(f"  - {YELLOW}{ip}{NC}")

except FileNotFoundError:
    print(f"{RED}[!] Error: File '{log_file}' not found.{NC}")
except Exception as e:
    print(f"{RED}[!] An unexpected error occurred: {e}{NC}")
