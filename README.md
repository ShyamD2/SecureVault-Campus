<p align="center">
  <img src="images/banner.png" alt="SecureVault Campus Banner" width="100%">
</p>

# SecureVault Campus# 🔐 SecureVault Campus
![Windows Server](https://img.shields.io/badge/Windows_Server-2025-blue?style=for-the-badge&logo=windows)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1-blue?style=for-the-badge&logo=powershell)
![Active Directory](https://img.shields.io/badge/Active_Directory-AD_DS-0052CC?style=for-the-badge)
![Windows LAPS](https://img.shields.io/badge/Windows-LAPS-success?style=for-the-badge)
![Docker](https://img.shields.io/badge/Docker-Container-blue?style=for-the-badge&logo=docker)
![CyberArk Conjur](https://img.shields.io/badge/CyberArk-Conjur-orange?style=for-the-badge)
![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-E95420?style=for-the-badge&logo=ubuntu)
![VirtualBox](https://img.shields.io/badge/VirtualBox-7.x-blue?style=for-the-badge&logo=virtualbox)
> A Simulated Privileged Access Management (PAM) Lab using CyberArk Conjur Open Source, Windows Server Active Directory, Windows LAPS and PowerShell JEA.

![Platform](https://img.shields.io/badge/Platform-Windows%20%26%20Ubuntu-blue)
![CyberArk](https://img.shields.io/badge/CyberArk-Conjur-orange)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1-blue)
![Docker](https://img.shields.io/badge/Docker-Enabled-2496ED)
![VirtualBox](https://img.shields.io/badge/Oracle-VirtualBox-blue)

---
# 🏗️ Architecture Diagram

![Architecture](images/architecture.png)
# 📖 Overview

SecureVault Campus is a self-built Privileged Access Management (PAM) lab designed to demonstrate the core concepts behind CyberArk PAM using freely available technologies.

The project simulates enterprise privileged access management by combining:

- Windows Server 2025 Active Directory
- Windows LAPS
- PowerShell JEA
- CyberArk Conjur Open Source
- Docker
- Oracle VirtualBox

---

# 🏗 Architecture

DC01
- Active Directory
- DNS
- Group Policy

↓

CLIENT01

- Domain Joined Server
- Windows LAPS
- JEA Restricted Endpoint

↓

CONJURVM

- Ubuntu Server
- Docker
- CyberArk Conjur Open Source

---

# 🚀 Features

✅ Active Directory Domain

✅ Organizational Units

✅ Domain Users

✅ Domain Joined Server

✅ Windows LAPS

✅ Password Rotation

✅ Just Enough Administration (JEA)

✅ CyberArk Conjur Open Source

✅ Secret Management

✅ Docker Deployment

✅ PowerShell Automation

---

# 🛠 Technologies

- Windows Server 2025
- Ubuntu Server 24.04
- Active Directory
- Group Policy
- Windows LAPS
- PowerShell
- Docker
- Docker Compose
- CyberArk Conjur OSS
- Oracle VirtualBox

---

# 📂 Project Structure

```text
SecureVault-Campus
│
├── docs
├── docker
├── diagrams
├── screenshots
├── scripts
└── README.md
```

---

## 📸 Project Screenshots

### Active Directory Structure
![AD Structure](screenshots/05-active-directory-structure.png)

### Domain Joined Client Verification
![Client Verification](screenshots/06-domain-joined-client-verification.png)

### Windows LAPS Password Retrieval
![LAPS Password](screenshots/04-windows-laps-password-retrieval.png)

### LAPS Password Report
![LAPS Report](screenshots/02-laps-password-report-script.png)

### PowerShell JEA Restricted Session
![JEA Session](screenshots/08-jea-restricted-powershell-session.png)

### Available Commands in JEA
![JEA Commands](screenshots/09-jea-available-commands.png)

### LAPS Group Policy
![LAPS GPO](screenshots/07-laps-group-policy.png)

### CyberArk Conjur Docker Services
![Docker Services](screenshots/10-conjur-docker-services.png)

### Conjur Policy & Secret Retrieval
![Conjur Policy](screenshots/01-conjur-policy-and-secret-retrieval.png)

### Conjur Secret Management
![Conjur Secret](screenshots/11-conjur-secret-management.png)

# 🎯 Learning Outcomes

This project demonstrates practical knowledge of:

- Identity Management
- Privileged Access Management
- Least Privilege
- Secret Management
- Windows Administration
- Linux Administration
- Docker
- PowerShell Automation

---
# 📖 Project Overview

SecureVault Campus is a simulated enterprise Privileged Access Management (PAM) lab that demonstrates how organizations secure privileged accounts using Microsoft Active Directory, Windows LAPS, PowerShell Just Enough Administration (JEA), and CyberArk Conjur Open Source.

The project simulates a production-style environment using three virtual machines connected through a secure virtual network. It showcases password rotation, least-privilege administration, secret management, and secure authentication workflows.
# ✨ Key Features

- Active Directory Domain Services (AD DS)
- Organizational Unit (OU) Management
- Domain User Management
- Windows LAPS Password Rotation
- PowerShell JEA Restricted Administration
- CyberArk Conjur Open Source
- Docker-based Secret Management
- Secure Secret Retrieval
- Least Privilege Administration
- Role-Based Access Control (RBAC)
# 🛠 Technologies Used

- Windows Server 2025
- Ubuntu Server 24.04 LTS
- Active Directory Domain Services
- Windows LAPS
- PowerShell
- Docker Engine
- Docker Compose
- CyberArk Conjur Open Source
- Oracle VirtualBox

# 👨‍💻 Author

**Shyam Kumar D**

LinkedIn

https://linkedin.com/in/shyam-kumar-d

GitHub

https://github.com/ShyamD2

---

⭐ If you like this project, consider giving it a Star!