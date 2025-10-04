# Get-SystemInfo.ps1
# Description: Gathers basic system information.
# Usage: Run the script without parameters.

Write-Host "--- System Information ---"
Get-ComputerInfo | Select-Object OsName, OsVersion, OsHardwareAbstractionLayer, WindowsProductName, WindowsInstallationDate, CsManufacturer, CsModel, CsSystemType, CsTotalPhysicalMemory | Format-List

Write-Host "
--- Network Information ---"
Get-NetAdapter | Select-Object Name, Status, LinkSpeed, MacAddress | Format-List
Get-NetIPAddress | Select-Object InterfaceAlias, IPAddress, PrefixLength, Gateway | Format-List

Write-Host "
--- Disk Information ---"
Get-Volume | Select-Object DriveLetter, FileSystemLabel, FileSystem, Size, SizeRemaining | Format-List

Write-Host "
--- Running Processes (Top 10 by CPU) ---"
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 ProcessName, Id, CPU, WorkingSet | Format-Table

Write-Host "
--- Running Services (Top 10 by Name) ---"
Get-Service | Where-Object {$_.Status -eq 'Running'} | Select-Object -First 10 Name, DisplayName, Status | Format-Table

