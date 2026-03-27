Import-Module ActiveDirectory

$FirstName = Read-Host "Enter first name"
$LastName = Read-Host "Enter last name"
$Username = Read-Host "Enter username"
$Password = Read-Host "Enter password" -AsSecureString
$GroupName = Read-Host "Enter AD group name"
