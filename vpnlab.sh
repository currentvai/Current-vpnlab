#!/bin/bash
echo "🔰 Welcome to Current Vai's VPN Leak Toolkit 🔰"
bash modules/webrtc_test.sh
bash modules/proxychains_tor.sh
python3 modules/vpn_log_analyzer.py sample.log
bash modules/github_push.sh
