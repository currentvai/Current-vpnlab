<p align="center">
  <img src="https://github.com/currentvai/Current-vpnlab/blob/main/assets/logo.png" alt="Current VPN Toolkit Logo" width="200"/>
</p>


# 🔰 Current-vpnlab v1.1 - VPN Leak Tester

A simple, fast, and effective command-line tool to check for common IP, DNS, and WebRTC leaks, helping you verify if your VPN is working correctly and protecting your real IP address.

![Banner](link_to_your_banner_screenshot.png) <!-- Optional: Add a screenshot of your tool in action -->

---

### ✨ Features

-   **🌐 Public IP Check:** Quickly finds your current public IP address and shows your ISP and country.
-   **🛡️ DNS Leak Check:** Lists the DNS servers your system is currently using to resolve domain names.
-
-   **🕵️‍♂️ WebRTC Leak Check:** Detects potential IP leaks through your browser's WebRTC functionality.
-   **💻 Clean CLI Interface:** Uses colors for a clear, readable, and professional output directly in your terminal.
-   **📱 Termux Ready:** Fully optimized for use on mobile with Termux, with automatic dependency installation.

---

### 🤔 How to Test Your VPN

The best way to use this tool is to run it twice and compare the results:

1.  **Run WITHOUT VPN:**
    ```bash
    bash vpnlab.sh
    ```
    Note down your **real Public IP**, your **ISP's DNS servers**, and any IPs shown in the **WebRTC** section.

2.  **Run WITH VPN:**
    - Connect to your VPN.
    - Run the script again:
      ```bash
      bash vpnlab.sh
      ```

**🔎 Compare the results:** If your VPN is working correctly, the Public IP, DNS Servers, and any WebRTC IPs in the second run should be **completely different** from the first run. They should now belong to your VPN provider, and your real IP should not be visible anywhere.

---

### 🚀 Installation & Usage

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-github-username/Current-vpnlab.git
    ```

2.  **Navigate to the directory:**
    ```bash
    cd Current-vpnlab
    ```

3.  **Run the tester:**
    ```bash
    bash vpnlab.sh
    ```
---

### ⚠️ Disclaimer

This tool is for educational and testing purposes only. Use it responsibly to verify your own connection's privacy.

---
**Developed By Current Vai ♚**
*© Copyright $(date +%Y) — All Rights Reserved.*

<h3 align="center">🛡️ Stay Private. Stay Secure. Stay Current ♚</h3> ```
