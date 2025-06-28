import re, sys
print("🧠 VPN Log Analyzer Running...")
try:
    with open(sys.argv[1], 'r') as f:
        data = f.read()
    ips = set(re.findall(r'(?:[0-9]{1,3}\.){3}[0-9]{1,3}', data))
    print(f"🔍 Found {len(ips)} unique IP addresses in log:")
    for ip in ips:
        print(" -", ip)
except:
    print("❌ Error reading log file")
