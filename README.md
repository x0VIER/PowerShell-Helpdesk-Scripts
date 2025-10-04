# PowerShell Helpdesk Scripts

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg) ![License](https://img.shields.io/badge/License-MIT-green.svg) ![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-brightgreen.svg)

## Overview

This repository contains a collection of essential PowerShell scripts designed to assist IT helpdesk professionals in their daily tasks. These scripts aim to automate common support requests, streamline user management, and facilitate basic troubleshooting, thereby improving efficiency and reducing resolution times.

## Features

-   **User Account Management:** Create new Active Directory users, reset passwords, and manage user properties.
-   **System Information:** Quickly gather critical system details for diagnosis.
-   **Network Troubleshooting:** Test network connectivity and diagnose common network issues.

## Scripts Included

| Script                      | Description                                                                              |
| --------------------------- | ---------------------------------------------------------------------------------------- |
| `New-ADUser.ps1`            | Creates a new Active Directory user with specified attributes.                           |
| `Reset-ADUserPassword.ps1`  | Resets an Active Directory user's password and sets 'change password at next logon'.     |
| `Get-SystemInfo.ps1`        | Gathers and displays comprehensive system, network, disk, and process information.       |
| `Test-NetworkConnectivity.ps1`| Tests network reachability to a target host using ping and detailed network diagnostics. |

## Usage

Each script is designed to be run independently. Open PowerShell as an administrator and navigate to the script's directory. Execute the script, providing any required parameters.

### Example: Resetting a user's password

```powershell
./Reset-ADUserPassword.ps1 -SamAccountName "jdoe" -NewPassword "SecureP@ssw0rd123"
```

## Requirements

-   Windows operating system with PowerShell 5.1 or newer.
-   Active Directory module for PowerShell (for AD-related scripts). This is typically installed with RSAT (Remote Server Administration Tools).
-   Appropriate permissions to perform actions in Active Directory or on target systems.

## Contribution

Feel free to fork this repository, submit pull requests, or open issues for suggestions and improvements. Your contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

