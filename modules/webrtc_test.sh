#!/bin/bash
echo "🌐 WebRTC test (browser): Open browser to https://browserleaks.com/webrtc"
termux-open-url https://browserleaks.com/webrtc 2>/dev/null || xdg-open https://browserleaks.com/webrtc
