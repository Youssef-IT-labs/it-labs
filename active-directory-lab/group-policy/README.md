# Group Policy

## Objective
Configure and apply a Group Policy Object (GPO) to enforce a desktop wallpaper for domain users.

## What I configured
- Created a shared folder on the Domain Controller (`\\DC01\wallpaper`)
- Stored a wallpaper image (`corp.jpg`) in the shared folder
- Configured sharing permissions (read access)
- Created a Group Policy Object linked to the `CorpUsers` OU
- Configured the Desktop Wallpaper policy using a UNC path

## Validation
- Forced policy update using `gpupdate /force`
- Logged in as a domain user (`CORP\jdoe`)
- Verified that the wallpaper was applied successfully

## Result
The Group Policy was successfully applied, and the desktop wallpaper is enforced for domain users.

## Screenshots

### GPO Configuration
![GPO](screenshots/gpo-config.png)

### Wallpaper Applied
![Wallpaper](screenshots/gpo-wallpaper-applied.png)
