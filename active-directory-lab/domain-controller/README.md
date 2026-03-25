# Domain Controller

## Objective
Set up a Windows Server as an Active Directory Domain Controller for the `corp.local` domain.

## What I configured
- Set a static IP address on the server
- Configured the server to use its own IP address as DNS
- Renamed the server to `DC01`
- Installed the Active Directory Domain Services role
- Promoted the server to a Domain Controller
- Created the `corp.local` domain

## Result
The server was successfully promoted to a Domain Controller and the `corp.local` domain was created successfully.

## Screenshots
- `domain-created.png`
- `ipconfig-clean.png`

## Notes
This server was configured with a single host-only network adapter and no NAT, which is a better practice for an isolated Active Directory lab.
