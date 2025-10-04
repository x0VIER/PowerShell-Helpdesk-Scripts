# Test-NetworkConnectivity.ps1
# Description: Tests network connectivity to a specified host.
# Usage: Run the script with a hostname or IP address.

param(
    [Parameter(Mandatory=$true)]
    [string]$TargetHost
)

Write-Host "Testing connectivity to $TargetHost..."

# Test-Connection (Ping)
try {
    $pingResult = Test-Connection -ComputerName $TargetHost -Count 4 -ErrorAction Stop
    Write-Host "Ping successful to $TargetHost."
    $pingResult | Select-Object Address, IPv4Address, ResponseTime, StatusCode | Format-Table
} catch {
    Write-Warning "Ping to $TargetHost failed: $($_.Exception.Message)"
}

# Test-NetConnection (More detailed network diagnostics)
Write-Host "
Performing detailed network connection test..."
try {
    Test-NetConnection -ComputerName $TargetHost -InformationLevel Detailed
} catch {
    Write-Warning "Detailed network connection test to $TargetHost failed: $($_.Exception.Message)"
}
