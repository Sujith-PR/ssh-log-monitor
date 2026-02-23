# SSH Log Monitor

A real-time SSH log monitoring script for Ubuntu that sends email alerts for failed login attempts.

## Features
- Monitors `/var/log/auth.log` for failed SSH login attempts
- Sends email alerts for suspicious login attempts
- Keeps track of notified IPs to avoid duplicate alerts

## Usage
1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR_GITHUB_USERNAME/ssh-log-monitor.git
   cd ssh-log-monitor
   chmod +x ssh_log_monitor.sh
   ./ssh_log_monitor.sh

## Requirements

Ubuntu Linux

Mail configured for sending alerts


Save and exit (`Ctrl+O`, `Enter`, `Ctrl+X`).

---
