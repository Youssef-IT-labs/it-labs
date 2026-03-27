Import-Module ActiveDirectory

# Input
$FirstName = Read-Host "Enter first name"
$LastName = Read-Host "Enter last name"
$Username = Read-Host "Enter username"
$Password = Read-Host "Enter password" -AsSecureString
$GroupName = Read-Host "Enter AD group name"

# Check if user exists
$ExistingUser = Get-ADUser -Filter "SamAccountName -eq '$Username'"

if ($ExistingUser) {
    Write-Host ""
    Write-Host "User $Username already exists." -ForegroundColor Yellow
}
else {
    # Create user
    New-ADUser `
        -Name "$FirstName $LastName" `
        -GivenName $FirstName `
        -Surname $LastName `
        -SamAccountName $Username `
        -UserPrincipalName "$Username@corp.local" `
        -AccountPassword $Password `
        -ChangePasswordAtLogon $true `
        -Enabled $true `
        -Path "OU=CorpUsers,DC=corp,DC=local"

    # Check if group exists
    $ExistingGroup = Get-ADGroup -Filter "Name -eq '$GroupName'"

    if ($ExistingGroup) {
        Add-ADGroupMember -Identity $GroupName -Members $Username

        Write-Host ""
        Write-Host "User $Username successfully created and added to $GroupName." -ForegroundColor Green
    }
    else {
        Write-Host ""
        Write-Host "User $Username was created, but group $GroupName was not found." -ForegroundColor Yellow
    }
}
