<p align="center">
  <img src="https://github.com/currentvai/Current-vpnlab/blob/main/assets/logo.png" alt="Current VPN Toolkit Logo" width="200"/>
</p>

<# 🔰 VPN Leak Toolkit

A simple, command-line based toolkit for Termux and other Linux systems to perform basic VPN leak tests. Designed with a hacker-style interface for a better user experience.

![Demo Image/GIF](link_to_your_screenshot.png) <!-- আপনি একটি স্ক্রিনশট তুলে এখানে লিঙ্ক দিতে পারেন -->

---

### ✨ Features

-   **🌐 WebRTC Leak Test:** Opens a test page to check for WebRTC IP leaks.
-   **🛡️ DNS Leak Test:** Checks if your DNS queries are leaking your real ISP's address.
-   **🧠 VPN Log Analyzer:** Scans a log file to find and list all unique IP addresses.
-   **💻 Hacker-Style Interface:** Uses colors and symbols for a cool and readable output.
-   **📱 Termux Ready:** Optimized for use on mobile with Termux.

---

### ⚙️ Prerequisites

-   A Linux-based system (Termux recommended)
-   `git`
-   `python`
-   `dnsutils` (the script will try to install it automatically)

---

### 🚀 Installation & Usage

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/currentvai/Current-vpnlab.git
    ```

2.  **Navigate to the directory:**
    ```bash
    cd Current-vpnlab
    ```

3.  **Make the main script executable (optional but good practice):**
    ```bash
    chmod +x vpnlab.sh
    ```

4.  **Run the toolkit:**
    You need to provide a log file as an argument.
    ```bash
    bash vpnlab.sh /path/to/your/vpn.log
    ```
    *Example with a sample log:*
    ```bash
    bash vpnlab.sh sample.log
    ```

---

### ⚠️ Disclaimer

This tool is for educational and testing purposes only. Use it responsibly to check your own VPN's security. The author is not responsible for any misuse.

🔐 License
This project is licensed under the MIT License
© 2025 Current Vai ♚

<h3 align="center">🛡️ Stay Private. Stay Secure. Stay Current ♚</h3> ```
