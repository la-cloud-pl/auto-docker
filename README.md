# 🚀 auto-docker
**auto-docker** is a lightweight shell-based automation tool that helps you install and configure Dockerized environments quickly and consistently with zero hassle.
This project is ideal for servers, virtual machines, or development setups where you want Docker ready in one shot.
**❌ Currently works only on Debian 12 systems.**

---
## ⚙️ Features:
- Installs Docker in a clean, automated way
- Downloads and configures your Docker environment
- Runs from a single command
- Lightweight and fast — written in pure Bash
- Open-source and customizable

---
## 🧪 Quick Install:
Before you use make sure you are root! And check if you're on the Debian 12 system image.
> ✅ Requires: `curl`, `unzip`, and root access (e.g., `sudo`)

To install run the command below in your terminal:
```
curl -sSL https://raw.githubusercontent.com/la-cloud-pl/auto-docker/main/init.sh | sudo bash
```