# 🔐 SecureVault Campus

> A Simulated Privileged Access Management (PAM) Lab using CyberArk Conjur Open Source, Windows Server Active Directory, Windows LAPS and PowerShell JEA.

![Platform](https://img.shields.io/badge/Platform-Windows%20%26%20Ubuntu-blue)
![CyberArk](https://img.shields.io/badge/CyberArk-Conjur-orange)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1-blue)
![Docker](https://img.shields.io/badge/Docker-Enabled-2496ED)
![VirtualBox](https://img.shields.io/badge/Oracle-VirtualBox-blue)

---

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

# 👨‍💻 Author

**Shyam Kumar D**

LinkedIn

https://linkedin.com/in/shyam-kumar-d

GitHub

https://github.com/ShyamD2

---

⭐ If you like this project, consider giving it a Star!