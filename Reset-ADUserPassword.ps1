# Reset-ADUserPassword.ps1
# Description: Resets the password for an Active Directory user.
# Usage: Run the script and provide the SamAccountName and new password.

param(
    [Parameter(Mandatory=$true)]
    [string]$SamAccountName,

    [Parameter(Mandatory=$true)]
    [string]$NewPassword
)

Import-Module ActiveDirectory

try {
    $User = Get-ADUser -Identity $SamAccountName -ErrorAction Stop
    $SecurePassword = ConvertTo-SecureString $NewPassword -AsPlainText -Force
    $User | Set-ADAccountPassword -NewPassword $SecurePassword
    $User | Enable-ADAccount
    $User | Set-ADUser -ChangePasswordAtLogon $true

    Write-Host "Password for user '$SamAccountName' reset successfully. User will be prompted to change password at next logon."
} catch {
    Write-Error "Failed to reset password for user '$SamAccountName': $($_.Exception.Message)"
}
