<div align="center">

<img src="images/banner.png" alt="SecureVault Campus Banner" width="100%">

# 🔐 SecureVault Campus

### Simulated Privileged Access Management (PAM) Lab
**CyberArk Conjur Open Source · Windows Active Directory · Microsoft LAPS · PowerShell JEA**

<p>
A self-built enterprise-style lab recreating the core pillars of CyberArk PAM —<br/>
Identity Management · Password Rotation · Least Privilege · Secrets Management
</p>

<p>
  <img src="https://img.shields.io/badge/Windows_Server-2025-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="Windows Server">
  <img src="https://img.shields.io/badge/Active_Directory-AD_DS-0052CC?style=for-the-badge&logo=microsoft&logoColor=white" alt="Active Directory">
  <img src="https://img.shields.io/badge/Windows-LAPS-00A4EF?style=for-the-badge&logo=windows&logoColor=white" alt="Windows LAPS">
  <img src="https://img.shields.io/badge/PowerShell-JEA-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell JEA">
  <img src="https://img.shields.io/badge/CyberArk-Conjur_OSS-FF6600?style=for-the-badge" alt="CyberArk Conjur">
  <img src="https://img.shields.io/badge/Ubuntu-24.04_LTS-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" alt="Ubuntu">
  <img src="https://img.shields.io/badge/Docker-Compose-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker">
  <img src="https://img.shields.io/badge/VirtualBox-7.x-183A61?style=for-the-badge&logo=virtualbox&logoColor=white" alt="VirtualBox">
</p>

<p>
  <img src="https://img.shields.io/github/last-commit/ShyamD2/SecureVault-Campus?style=flat-square&color=blue" alt="Last Commit">
  <img src="https://img.shields.io/github/repo-size/ShyamD2/SecureVault-Campus?style=flat-square&color=blue" alt="Repo Size">
  <img src="https://img.shields.io/github/stars/ShyamD2/SecureVault-Campus?style=flat-square&color=yellow" alt="Stars">
  <img src="https://img.shields.io/github/license/ShyamD2/SecureVault-Campus?style=flat-square&color=green" alt="License">
</p>

**[📖 Documentation](docs/) · [🏗 Architecture](ARCHITECTURE.md) · [⚙️ Installation](INSTALLATION.md) · [📸 Screenshots](#-screenshots)**

</div>

---

## 📑 Table of Contents

- [Overview](#-overview)
- [Why This Project Matters](#-why-this-project-matters)
- [Architecture](#-architecture)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Repository Structure](#-repository-structure)
- [Project Workflow](#-project-workflow)
- [Screenshots](#-screenshots)
- [Technical Deep Dive](#-technical-deep-dive)
- [Skills Demonstrated](#-skills-demonstrated)
- [Lessons Learned & Roadmap](#-lessons-learned--roadmap)
- [Documentation](#-documentation)
- [Author](#-author)

---

## 📖 Overview

**SecureVault Campus** is a hands-on Privileged Access Management lab built from the ground up to demonstrate the concepts that sit at the core of **CyberArk's PAM suite** — using free, industry-standard tooling instead of a commercial license.

The lab provisions a small three-tier "campus" domain and layers four PAM disciplines on top of it:

| Discipline | Technology | CyberArk Equivalent |
|---|---|---|
| Identity foundation | Active Directory Domain Services + OUs | Core PAS identity store |
| Local admin password rotation | Windows LAPS | CPM (Central Policy Manager) |
| Least-privilege administration | PowerShell JEA | PSM / restricted sessions |
| Secrets management & retrieval | CyberArk Conjur OSS on Docker | Conjur Enterprise / AAM |

Every component was deployed, configured, and verified inside an isolated VirtualBox network — no cloud credits, no trial license, just the same architecture patterns used in production PAM deployments.

---

## 🎯 Why This Project Matters

<table>
<tr>
<td width="50%" valign="top">

**For Recruiters**

This isn't a tutorial clone. It's an original lab that maps 1:1 onto real enterprise PAM job requirements: rotating privileged credentials, enforcing least privilege, centralizing secrets, and auditing access — the exact language used in CyberArk Engineer, IAM Analyst, and Cloud Security job descriptions.

</td>
<td width="50%" valign="top">

**For the Security Community**

Windows LAPS, JEA, and Conjur OSS are each individually well documented — but rarely wired together into one coherent PAM story. This repo shows how they compose into a single privileged-access control plane.

</td>
</tr>
</table>

**Concepts demonstrated:**
`Least Privilege` · `Password Rotation` · `Secrets Management` · `Role-Based Access Control` · `Audit Logging` · `Identity Segmentation` · `Infrastructure Hardening`

---

## 🏗 Architecture

```mermaid
flowchart TB
    INET([Internet])

    subgraph LAB["SecureVault Campus — Isolated VirtualBox Network"]
        direction TB

        subgraph DC["DC01 — Windows Server 2025"]
            AD[Active Directory Domain Services]
            DNS[DNS Server]
            GPO[Group Policy — LAPS Policy]
        end

        subgraph CLIENT["CLIENT01 — Domain-Joined Server"]
            LAPS[Windows LAPS Agent]
            JEA[PowerShell JEA Restricted Endpoint]
        end

        subgraph CONJ["CONJURVM — Ubuntu Server 24.04"]
            DOCKER[Docker Engine]
            CONJUR[CyberArk Conjur OSS]
            PG[(Conjur Backend DB)]
        end
    end

    ADMIN([Security Engineer])

    INET -.->|Package Updates Only| LAB
    ADMIN -->|1 - Authenticate| AD
    AD -->|2 - Apply LAPS GPO| GPO
    GPO -->|3 - Rotate Local Admin Password| LAPS
    ADMIN -->|4 - Connect via JEA| JEA
    JEA -->|Restricted Cmdlet Set Only| CLIENT
    ADMIN -->|5 - Authenticate and Fetch Secret| CONJUR
    CONJUR --> DOCKER
    DOCKER --> PG
    AD -.->|Domain Trust| CLIENT
```

**Flow summary**

1. **DC01** is the domain controller — it hosts AD DS, DNS, and the Group Policy that drives LAPS rotation.
2. **CLIENT01** is domain-joined and receives the LAPS policy, rotating its local administrator password on schedule. Administrators only ever touch it through a **JEA restricted endpoint** — never a full admin shell.
3. **CONJURVM** runs CyberArk Conjur OSS in Docker on Ubuntu, acting as the secrets vault for application credentials (e.g. `db-password`), retrievable only by authorized hosts/roles defined in Conjur policy.

📄 Full breakdown with authentication and password-rotation sequence diagrams: **[ARCHITECTURE.md](ARCHITECTURE.md)**

---

## 🚀 Features

<table>
<tr>
<td width="33%" valign="top">

### 🏢 Identity & Access
- Active Directory Domain Services
- Organizational Unit design
- Domain user & computer objects
- Domain-joined member server

</td>
<td width="33%" valign="top">

### 🔑 Privileged Access
- Windows LAPS password rotation
- Automated LAPS audit reporting
- PowerShell JEA restricted sessions
- Role-scoped cmdlet allow-lists

</td>
<td width="33%" valign="top">

### 🗝️ Secrets Management
- CyberArk Conjur OSS (Docker)
- Policy-as-code secret definitions
- Host-based authorization (RBAC)
- Secure secret retrieval via CLI

</td>
</tr>
</table>

---

## 🛠 Tech Stack

<table>
<tr><td><b>Platform</b></td><td>Windows Server 2025 · Ubuntu Server 24.04 LTS · Oracle VirtualBox 7.x</td></tr>
<tr><td><b>Identity</b></td><td>Active Directory Domain Services · DNS · Group Policy</td></tr>
<tr><td><b>Privileged Access</b></td><td>Windows LAPS · PowerShell 5.1 · PowerShell JEA</td></tr>
<tr><td><b>Secrets</b></td><td>CyberArk Conjur Open Source · Docker · Docker Compose</td></tr>
<tr><td><b>Tooling</b></td><td>Git · GitHub · PowerShell scripting</td></tr>
</table>

---

## 📂 Repository Structure

```text
SecureVault-Campus/
│
├── README.md                    → You are here
├── ARCHITECTURE.md              → Detailed architecture + sequence diagrams
├── INSTALLATION.md              → Step-by-step lab build guide
├── SECURITY.md                  → Threat model & security notes
├── CONTRIBUTING.md              → Contribution guidelines
├── LICENSE                      → MIT License
│
├── docker/
│   └── root.yml                 → Conjur policy: hosts, variables, permissions
│
├── scripts/
│   ├── SecureVault-LAPSReport.ps1     → LAPS password/expiration audit report
│   ├── SecureVaultOperator.pssc       → JEA session configuration
│   └── SecureVaultOperator.psrc       → JEA role capability (allowed cmdlets)
│
├── images/
│   ├── banner.png                → Repository hero banner
│   └── architecture-diagram.png  → Original architecture sketch
│
├── screenshots/                  → 11 annotated evidence screenshots
│   └── 01–11 ...
│
└── docs/
    └── SecureVault-Campus-Project-Report.pdf   → Full written project report
```

---

## 🔄 Project Workflow

```mermaid
flowchart LR
    A[Provision VMs] --> B[Configure AD DS + DNS]
    B --> C[Create OUs and Domain Users]
    C --> D[Join CLIENT01 to Domain]
    D --> E[Deploy LAPS GPO]
    E --> F[Rotate Local Admin Passwords]
    F --> G[Configure JEA Endpoint]
    G --> H[Deploy Conjur on Docker]
    H --> I[Define Conjur Policy]
    I --> J[Retrieve Secrets Securely]
    J --> K[Audit and Report]
```

---

## 📸 Screenshots

<table>
<tr>
<td width="50%">

**Conjur Policy & Secret Retrieval**
<img src="screenshots/01-conjur-policy-and-secret-retrieval.png" width="100%">

</td>
<td width="50%">

**LAPS Password Report Script**
<img src="screenshots/02-laps-password-report-script.png" width="100%">

</td>
</tr>
<tr>
<td width="50%">

**Active Directory Users**
<img src="screenshots/03-active-directory-users.png" width="100%">

</td>
<td width="50%">

**Windows LAPS Password Retrieval**
<img src="screenshots/04-windows-laps-password-retrieval.png" width="100%">

</td>
</tr>
<tr>
<td width="50%">

**Active Directory OU Structure**
<img src="screenshots/05-active-directory-structure.png" width="100%">

</td>
<td width="50%">

**Domain-Joined Client Verification**
<img src="screenshots/06-domain-joined-client-verification.png" width="100%">

</td>
</tr>
<tr>
<td width="50%">

**LAPS Group Policy Configuration**
<img src="screenshots/07-laps-group-policy.png" width="100%">

</td>
<td width="50%">

**JEA Restricted PowerShell Session**
<img src="screenshots/08-jea-restricted-powershell-session.png" width="100%">

</td>
</tr>
<tr>
<td width="50%">

**JEA Available Commands (Allow-listed)**
<img src="screenshots/09-jea-available-commands.png" width="100%">

</td>
<td width="50%">

**Conjur Docker Services Running**
<img src="screenshots/10-conjur-docker-services.png" width="100%">

</td>
</tr>
<tr>
<td width="50%">

**Conjur Secret Management**
<img src="screenshots/11-conjur-secret-management.png" width="100%">

</td>
<td width="50%"></td>
</tr>
</table>

---

## 🔍 Technical Deep Dive

<details>
<summary><b>Why Active Directory?</b></summary><br>

AD DS is the identity backbone almost every enterprise PAM deployment sits on top of — CyberArk's Vault, CPM, and PSM all integrate against it. Standing up a real domain (OUs, GPOs, domain-joined hosts) demonstrates the identity fundamentals PAM tooling depends on, rather than treating identity as a black box.
</details>

<details>
<summary><b>Why Windows LAPS?</b></summary><br>

LAPS solves the exact problem CyberArk's CPM solves at enterprise scale: **local administrator passwords that are unique per machine and rotated automatically**, eliminating shared local-admin credentials — one of the most common lateral-movement paths in real breaches.
</details>

<details>
<summary><b>Why PowerShell JEA?</b></summary><br>

JEA enforces **least privilege at the session level** — administrators connect through a constrained endpoint that only exposes an explicit allow-list of cmdlets (`Get-Service`, `Restart-Service`, `Get-Process`, `Get-EventLog` in this lab), mirroring how CyberArk's PSM brokers and restricts privileged sessions.
</details>

<details>
<summary><b>Why CyberArk Conjur Open Source?</b></summary><br>

Conjur is CyberArk's own open-source secrets manager, making it the most direct, resume-defensible way to demonstrate secrets-management concepts: policy-as-code, host-based authorization, and scoped secret retrieval — without needing an enterprise license.
</details>

---

## 🧠 Skills Demonstrated

`Identity & Access Management` `Privileged Access Management (PAM)` `Least Privilege Design` `Secrets Management` `Windows Server Administration` `Linux Administration` `Docker & Containerization` `PowerShell Scripting & Automation` `Group Policy Management` `Network Segmentation` `Security Documentation`

---

## 📈 Lessons Learned & Roadmap

**Challenges faced & resolved**

- **Docker GPG key conflicts on Ubuntu** — Docker's apt repo setup failed on CONJURVM due to a stale 
  GPG keyring from a prior attempt. Fixed by removing the old keyring, re-adding Docker's key with 
  `gpg --dearmor`, and re-pointing the apt source list to the correctly signed repo.
- **Disk space management across 3 concurrent VMs** — Only 45 GB free for three VMs. Installed CLIENT01 
  as Server Core (not Desktop Experience) to roughly halve its footprint, deleted installer ISOs immediately 
  after each VM was built, and used `VBoxManage modifymedium --compact` to reclaim space from 
  dynamically-allocated disks.
- **LAPS password not appearing after GPO link** — First `Get-LapsADPassword` query returned nothing 
  because the policy hadn't propagated. Resolved with `gpupdate /force` + a restart to trigger the LAPS 
  scheduled task on boot.

**Design honesty**

Where CyberArk's licensed components (CPM, PSM) weren't available, I substituted genuine functional 
equivalents rather than skipping the concept — Windows LAPS for CPM's password rotation, PowerShell JEA 
for PSM's restricted sessions. Wherever CyberArk *does* publish a free product, I used the real thing: Conjur 
Open Source runs unmodified. Every substitution is disclosed explicitly rather than implied away.

**Roadmap**
- [ ] Integrate JEA transcript logs with a lightweight SIEM (e.g. Wazuh)
- [ ] Explore Conjur's dynamic secrets and rotation features
- [ ] Connect a real application to Conjur to fetch its DB credential at runtime
- [ ] Extend to a second domain to simulate a trust relationship
## 📚 Documentation

| Document | Description |
|---|---|
| [ARCHITECTURE.md](ARCHITECTURE.md) | Full architecture, network design, and sequence diagrams |
| [INSTALLATION.md](INSTALLATION.md) | Step-by-step guide to rebuild the lab from scratch |
| [SECURITY.md](SECURITY.md) | Threat model, hardening notes, and responsible use |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to propose changes or extensions |
| [Project Report (PDF)](docs/SecureVault-Campus-Project-Report.pdf) | Full written report |

---

## 👨‍💻 Author

**Shyam Kumar D**
*Aspiring Cloud Infrastructure & CyberArk PAM Engineer*

[![LinkedIn](https://img.shields.io/badge/LinkedIn-shyam--kumar--d-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://linkedin.com/in/shyam-kumar-d)
[![GitHub](https://img.shields.io/badge/GitHub-ShyamD2-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/ShyamD2)

---

<div align="center">

⭐ **If this project helped you understand PAM concepts, consider giving it a star.**

</div>
