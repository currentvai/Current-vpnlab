#!/bin/bash
# Installer script for Current-vpnlab
chmod +x vpnlab.sh
cp vpnlab.sh /data/data/com.termux/files/usr/bin/vpnlab 2>/dev/null || sudo cp vpnlab.sh /usr/local/bin/vpnlab
echo "✅ Installed! Now use 'vpnlab' to run the toolkit."
