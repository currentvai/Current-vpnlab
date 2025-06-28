#!/bin/bash
echo "🛡️ Launching Tor with Proxychains..."
pkg install tor proxychains-ng -y
tor &
sleep 10
proxychains curl https://check.torproject.org
