# 💼 PowerShell Helpdesk Scripts

<div align="center">

![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)
![Platform](https://img.shields.io/badge/platform-Windows-0078D4.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Active Directory](https://img.shields.io/badge/Active%20Directory-compatible-success.svg)
![Contributions](https://img.shields.io/badge/contributions-welcome-orange.svg)

**Enterprise-grade PowerShell automation scripts for IT helpdesk and support teams**

[Features](#-features) • [Quick Start](#-quick-start) • [Scripts](#-scripts) • [Usage Examples](#-usage-examples) • [Contributing](#-contributing)

</div>

---

## 📋 Overview

PowerShell Helpdesk Scripts is a professional collection of battle-tested automation tools designed specifically for IT helpdesk professionals and system administrators. These scripts automate repetitive support tasks, reduce ticket resolution times, and ensure consistent execution of common administrative operations in Active Directory environments.

## ✨ Features

### 👤 User Account Management
- Create new Active Directory users with standardized configurations
- Reset passwords with policy enforcement
- Bulk user operations support
- Automated email notifications

### 🖥️ System Diagnostics
- Comprehensive system information gathering
- Hardware and software inventory
- Real-time performance metrics
- Automated report generation

### 🌐 Network Troubleshooting
- Advanced connectivity testing
- DNS resolution diagnostics
- Latency and packet loss analysis
- Network path tracing

## 🚀 Quick Start

### Prerequisites

- **Windows OS**: Windows 10/11 or Windows Server 2016+
- **PowerShell**: Version 5.1 or higher
- **RSAT Tools**: Remote Server Administration Tools (for AD scripts)
- **Permissions**: Domain admin or delegated AD permissions

### Installation

```powershell
# Clone the repository
git clone https://github.com/x0VIER/PowerShell-Helpdesk-Scripts.git

# Navigate to the directory
cd PowerShell-Helpdesk-Scripts

# Set execution policy (if needed)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Verify Installation

```powershell
# Check PowerShell version
$PSVersionTable.PSVersion

# Verify Active Directory module
Get-Module -ListAvailable ActiveDirectory
```

## 📜 Scripts

### 1. New-ADUser.ps1

Create new Active Directory user accounts with standardized configurations and organizational unit placement.

**Features:**
- Automated username generation
- Password policy compliance
- Group membership assignment
- Home directory creation
- Email address configuration

**Parameters:**
```powershell
-FirstName       # User's first name (required)
-LastName        # User's last name (required)
-Department      # Department name (optional)
-Title           # Job title (optional)
-Manager         # Manager's username (optional)
-OU              # Organizational Unit path (optional)
```

**Example:**
```powershell
.\New-ADUser.ps1 -FirstName "John" -LastName "Doe" -Department "IT" -Title "Systems Administrator"
```

---

### 2. Reset-ADUserPassword.ps1

Reset Active Directory user passwords with automatic policy enforcement and notification options.

**Features:**
- Secure password generation
- Force password change at next logon
- Account unlock capability
- Audit logging
- Optional email notification

**Parameters:**
```powershell
-SamAccountName  # Username (required)
-NewPassword     # New password (optional, generates if not provided)
-UnlockAccount   # Unlock the account (switch)
-SendEmail       # Send notification email (switch)
```

**Example:**
```powershell
.\Reset-ADUserPassword.ps1 -SamAccountName "jdoe" -UnlockAccount -SendEmail
```

---

### 3. Get-SystemInfo.ps1

Gather comprehensive system information for troubleshooting and inventory purposes.

**Features:**
- Operating system details
- Hardware specifications (CPU, RAM, Disk)
- Network configuration
- Installed software inventory
- Running processes and services
- Event log summary
- Export to HTML/CSV

**Parameters:**
```powershell
-ComputerName    # Target computer (default: local)
-ExportPath      # Export report location (optional)
-Format          # Export format: HTML, CSV, JSON (default: HTML)
```

**Example:**
```powershell
.\Get-SystemInfo.ps1 -ComputerName "DESKTOP-01" -ExportPath "C:\Reports" -Format HTML
```

---

### 4. Test-NetworkConnectivity.ps1

Perform advanced network diagnostics and connectivity testing for troubleshooting network issues.

**Features:**
- ICMP ping testing
- TCP port connectivity
- DNS resolution verification
- Traceroute analysis
- Bandwidth testing
- Detailed reporting

**Parameters:**
```powershell
-TargetHost      # Hostname or IP address (required)
-Port            # TCP port to test (optional)
-Count           # Number of ping attempts (default: 4)
-Detailed        # Show detailed output (switch)
```

**Example:**
```powershell
.\Test-NetworkConnectivity.ps1 -TargetHost "google.com" -Port 443 -Detailed
```

## 💡 Usage Examples

### Common Helpdesk Scenarios

#### Scenario 1: New Employee Onboarding
```powershell
# Create new user account
.\New-ADUser.ps1 -FirstName "Jane" -LastName "Smith" `
                 -Department "Sales" -Title "Account Executive" `
                 -Manager "jdoe" -OU "OU=Sales,OU=Users,DC=company,DC=com"
```

#### Scenario 2: Password Reset Request
```powershell
# Reset password and unlock account
.\Reset-ADUserPassword.ps1 -SamAccountName "jsmith" -UnlockAccount -SendEmail
```

#### Scenario 3: Computer Not Responding
```powershell
# Gather system information remotely
.\Get-SystemInfo.ps1 -ComputerName "SALES-PC-05" -ExportPath "C:\Tickets\12345"
```

#### Scenario 4: "Can't Access Website"
```powershell
# Test network connectivity
.\Test-NetworkConnectivity.ps1 -TargetHost "intranet.company.com" -Port 80 -Detailed
```

## 📚 Best Practices

### Security
- Always run scripts with minimum required privileges
- Use secure password generation methods
- Enable audit logging for all administrative actions
- Review scripts before execution in production

### Error Handling
- All scripts include comprehensive error handling
- Failed operations are logged with detailed error messages
- Rollback capabilities for critical operations

### Documentation
- Each script includes inline comments
- Help documentation available via `Get-Help`
- Examples provided for common use cases

## 🔧 Advanced Configuration

### Custom Parameters
Create a configuration file for default values:

```powershell
# config.ps1
$DefaultOU = "OU=Users,DC=company,DC=com"
$DefaultDomain = "company.com"
$SMTPServer = "smtp.company.com"
$ReportPath = "C:\Reports"
```

### Scheduled Tasks
Automate script execution with Windows Task Scheduler:

```powershell
# Create scheduled task for daily system reports
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" `
    -Argument "-File C:\Scripts\Get-SystemInfo.ps1"
$Trigger = New-ScheduledTaskTrigger -Daily -At 9am
Register-ScheduledTask -TaskName "Daily System Report" -Action $Action -Trigger $Trigger
```

## 🛠️ Requirements

| Component | Version | Purpose |
|-----------|---------|---------|
| Windows OS | 10/11 or Server 2016+ | Host operating system |
| PowerShell | 5.1+ | Script execution engine |
| RSAT Tools | Latest | Active Directory management |
| .NET Framework | 4.7.2+ | Required for some cmdlets |

### Installing RSAT Tools

```powershell
# Windows 10/11
Add-WindowsCapability -Online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0

# Windows Server
Install-WindowsFeature RSAT-AD-PowerShell
```

## 🤝 Contributing

Contributions are highly encouraged! Here's how you can help:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/NewScript`)
3. **Test** thoroughly in a lab environment
4. **Commit** with clear messages (`git commit -m 'Add password expiration checker'`)
5. **Push** to your branch (`git push origin feature/NewScript`)
6. **Open** a Pull Request

### Script Contribution Guidelines

- Follow PowerShell best practices and style guide
- Include parameter validation and error handling
- Add comprehensive help documentation
- Provide usage examples
- Test in multiple environments

## 📝 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## 🙏 Acknowledgments

- Built by helpdesk professionals for helpdesk professionals
- Inspired by real-world support scenarios
- Community-tested and production-ready

## 📧 Support & Feedback

- **Issues**: Report bugs or request features via GitHub Issues
- **Discussions**: Share ideas and ask questions in GitHub Discussions
- **Pull Requests**: Contribute improvements and new scripts

## 📖 Additional Resources

- [Microsoft PowerShell Documentation](https://docs.microsoft.com/powershell/)
- [Active Directory PowerShell Module](https://docs.microsoft.com/powershell/module/activedirectory/)
- [PowerShell Best Practices](https://docs.microsoft.com/powershell/scripting/developer/cmdlet/cmdlet-development-guidelines)

---

<div align="center">

**Empowering IT helpdesk teams with automation**

⭐ Star this repository if it helps your support operations!

</div>
