[![GitHub release](https://img.shields.io/github/v/release/la-cloud-pl/auto-docker?style=flat-square)](https://github.com/la-cloud-pl/auto-docker/releases)
[![License: MIT](https://img.shields.io/github/license/la-cloud-pl/auto-docker?style=flat-square)](LICENSE)
[![Issues](https://img.shields.io/github/issues/la-cloud-pl/auto-docker?style=flat-square)](https://github.com/la-cloud-pl/auto-docker/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/la-cloud-pl/auto-docker?style=flat-square)](https://github.com/la-cloud-pl/auto-docker/pulls)

# 🚀 auto-docker
**auto-docker** is a lightweight shell-based automation tool that helps you install and configure Dockerized environments quickly and consistently with zero hassle.
This project is ideal for servers, virtual machines, or development setups where you want Docker ready in one shot.
**❌ Currently works only on Debian 12 systems.**
## ⚙️ Features:
- Installs Docker in a clean, automated way
- Downloads and configures your Docker environment
- Runs from a single command
- Lightweight and fast — written in pure Bash
- Open-source and customizable
## ✅ Supported Systems:
| Distribution                        | Version(s)                   | Status      | Notes                                      |
| ----------------------------------- | ---------------------------- | ----------- | ------------------------------------------ |
| **Debian**                          | 11 (Bullseye), 12 (Bookworm) | ✅ Supported | Official Docker packages available         |
| **Ubuntu**                          | 20.04, 22.04, 24.04          | ⚠️ Untested | LTS versions recommended                   |
| **Red Hat Enterprise Linux (RHEL)** | 8, 9                         | ❌ Not Supported | Requires Docker CE or Podman install tweak |
| **CentOS Stream**                   | 8, 9                         | ❌ Not Supported  | Docker support via custom repo (see docs)  |
| **Fedora**                          | 37+                          | ❌ Not Supported | Docker often replaced with Podman          |
| **Arch Linux**                      | Rolling release              | ❌ Not Supported | Docker in AUR and official repos           |
| **Alpine Linux**                    | 3.18+                        | ❌ Not Supported | Minimalist, requires careful script logic  |
| **Amazon Linux 2/2023**             | 2, 2023                      | ❌ Not Supported | Docker supported via Amazon's repos        |
#### 📝 Legend:
- ✅ Supported – Actively tested or known to work reliably
- ⚠️ Partial/Untested – May require manual tweaks or isn't fully tested
- ❌ Not Supported – Will not work without major changes
## 🧪 Quick Install:
Before you use make sure you are root! And check if you're on the Debian 12 system image.
> ✅ Requires: `curl`, `unzip`, and root access (e.g., `sudo`)

To install run the command below in your terminal:
```
curl -sSL https://raw.githubusercontent.com/la-cloud-pl/auto-docker/main/init.sh | sudo bash
```