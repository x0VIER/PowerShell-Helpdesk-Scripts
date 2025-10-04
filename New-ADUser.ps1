# New-ADUser.ps1
# Description: Creates a new Active Directory user.
# Usage: Run the script and provide the required parameters.

param(
    [Parameter(Mandatory=$true)]
    [string]$SamAccountName,

    [Parameter(Mandatory=$true)]
    [string]$GivenName,

    [Parameter(Mandatory=$true)]
    [string]$Surname,

    [Parameter(Mandatory=$true)]
    [string]$DisplayName,

    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName,

    [Parameter(Mandatory=$true)]
    [string]$Path,

    [Parameter(Mandatory=$true)]
    [string]$Password
)

Import-Module ActiveDirectory

try {
    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
    New-ADUser -SamAccountName $SamAccountName `
               -GivenName $GivenName `
               -Surname $Surname `
               -DisplayName $DisplayName `
               -UserPrincipalName $UserPrincipalName `
               -Path $Path `
               -AccountPassword $SecurePassword `
               -Enabled $true `
               -ChangePasswordAtLogon $true

    Write-Host "User '$DisplayName' created successfully."
} catch {
    Write-Error "Failed to create user: $($_.Exception.Message)"
}
