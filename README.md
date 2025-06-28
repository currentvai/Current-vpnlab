<p align="center">
  <img src="https://github.com/currentvai/Current-vpnlab/blob/main/assets/logo.png" alt="Current VPN Toolkit Logo" width="200"/>
</p>

<h1 align="center">🔐 Current VPN Toolkit</h1>
<p align="center"><strong>vpnlab Developed by <span style="color:#00ffff;">Current Vai ♚</span></strong></p>
<p align="center">A powerful privacy and penetration testing toolkit for Termux & Linux. Analyze VPN leaks, test DNS/WebRTC exposure, anonymize via Tor/Proxychains, and inspect VPN logs — all from your terminal.</p>

---

## ✨ Features

✅ Public IP & DNS Leak Detection  
🌐 WebRTC Leak Checker (via browser)  
🧠 VPN Log Analyzer (OpenVPN, WireGuard, IPsec logs)  
🛡️ Proxychains + Tor Integration  
⛓️ GitHub Auto Push System  
📦 `.sh` Installer & `.deb` Package  
⚙️ Built-in Ethical Tools (e.g. [Breacher](https://github.com/s0md3v/Breacher))

---

## ⚙️ Installation Guide

### 📱 Termux / 🖥️ Linux Users

```bash
git clone https://github.com/CurrentVai/Current-vpnlab.git
cd Current-vpnlab
bash install.sh
```

---

After installation, run the toolkit using:
vpnlab

---

💡 Make sure **bash**, **python3**, and **curl** are installed before running the script.
---
📂 Toolkit Structure

| Module                | Description                               |
| --------------------- | ----------------------------------------- |
| `vpnlab.sh`           | Main interface to run all tools           |
| `webrtc_test.sh`      | Launches WebRTC browser-based leak test   |
| `proxychains_tor.sh`  | Enables Proxychains & Tor routing         |
| `vpn_log_analyzer.py` | Parses & analyzes VPN-related IP logs     |
| `github_push.sh`      | GitHub automation script for safe updates |

---

🧪 Example Output
🔰 Welcome to Current Vai's VPN Leak Toolkit 🔰

🌍 Public IP: 103.xxx.xxx.122
🧪 DNS Leak Test: Resolved via 1.1.1.1
🧠 VPN Log Analyzer: 17 unique IPs found
🛡️ Tor + Proxychains: Connected Successfully

---

🖼️ Screenshots
(Add your screenshots here)
You can use ![screenshot](https://your-link.com/screenshot1.png) to show the UI or terminal output.

🧑‍💻 **Contributing**
**Pull requests are welcome! If you want to suggest a feature or report a bug, feel free to open an issue.**

---

🔐 License
This project is licensed under the MIT License
© 2025 Current Vai ♚

<h3 align="center">🛡️ Stay Private. Stay Secure. Stay Current ♚</h3> ```
