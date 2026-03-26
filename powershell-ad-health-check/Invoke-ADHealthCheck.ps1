#Requires -Version 5.1

Write-Host "=== AD Health Check ===" -ForegroundColor Cyan
Write-Host ""

$ComputerName = $env:COMPUTERNAME
$UserDomain = $env:USERDOMAIN

Write-Host "Starting health check on $ComputerName" -ForegroundColor Cyan
Write-Host ""

Write-Host "Computer Name: $ComputerName"
Write-Host "User Domain: $UserDomain"
Write-Host ""

Write-Host "=== System Information ===" -ForegroundColor Yellow

$OS = Get-CimInstance -ClassName Win32_OperatingSystem

Write-Host "OS Name: $($OS.Caption)"
Write-Host "Last Boot Time: $($OS.LastBootUpTime)"
Write-Host ""

Write-Host "=== Network Information ===" -ForegroundColor Yellow

$IPAddresses = Get-NetIPAddress -AddressFamily IPv4 |
    Where-Object {
        $_.IPAddress -notlike '127.*' -and
        $_.IPAddress -notlike '169.254.*'
    }

foreach ($IP in $IPAddresses) {
    Write-Host "Interface: $($IP.InterfaceAlias) | IPv4: $($IP.IPAddress)"
}

Write-Host ""

$DnsServers = Get-DnsClientServerAddress -AddressFamily IPv4 |
    Where-Object { $_.ServerAddresses.Count -gt 0 }

Write-Host "DNS Client Servers:" -ForegroundColor Yellow

foreach ($Dns in $DnsServers) {
    Write-Host "Interface: $($Dns.InterfaceAlias) | DNS Servers: $($Dns.ServerAddresses -join ', ')"
}

Write-Host ""

Write-Host "=== Service Health Check ===" -ForegroundColor Yellow

$Services = "DNS", "NTDS", "Netlogon"

foreach ($Service in $Services) {
    $ServiceStatus = Get-Service -Name $Service -ErrorAction SilentlyContinue

    if ($null -eq $ServiceStatus) {
        Write-Host "$Service : NOT FOUND" -ForegroundColor Red
    }
    elseif ($ServiceStatus.Status -eq "Running") {
        Write-Host "$Service : RUNNING" -ForegroundColor Green
    }
    else {
        Write-Host "$Service : $($ServiceStatus.Status)" -ForegroundColor Red
    }
}

Write-Host ""

Import-Module ActiveDirectory

Write-Host "=== Active Directory User Check ===" -ForegroundColor Yellow

$UsersToCheck = "jdoe", "admin.user"

foreach ($User in $UsersToCheck) {
    $ADUser = Get-ADUser -Identity $User -ErrorAction SilentlyContinue

    if ($ADUser) {
        Write-Host "$User : FOUND" -ForegroundColor Green
    }
    else {
        Write-Host "$User : NOT FOUND" -ForegroundColor Red
    }
}

Write-Host "=== Active Directory Group Check ===" -ForegroundColor Yellow

$GroupsToCheck = "HR-Users", "IT-Admins"

foreach ($Group in $GroupsToCheck) {
    $ADGroup = Get-ADGroup -Identity $Group -ErrorAction SilentlyContinue

    if ($ADGroup) {
        Write-Host "$Group : FOUND" -ForegroundColor Green
    }
    else {
        Write-Host "$Group : NOT FOUND" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "=== SMB Share Check ===" -ForegroundColor Yellow

$SharesToCheck = "HR", "IT"

foreach ($Share in $SharesToCheck) {
    $ShareResult = Get-SmbShare -Name $Share -ErrorAction SilentlyContinue

    if ($ShareResult) {
        Write-Host "$Share : FOUND" -ForegroundColor Green
    }
    else {
        Write-Host "$Share : NOT FOUND" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "AD health check completed." -ForegroundColor Cyan
