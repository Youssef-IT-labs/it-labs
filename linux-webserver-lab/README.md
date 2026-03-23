# Linux Web Server Lab

## Objective
The goal of this lab is to install and configure Nginx on Ubuntu Server and verify web access from a client machine.

## Environment
- VMware Workstation
- Ubuntu Server 24.04 LTS
- SSH access already configured

## Steps

### 1. Update package list
```bash
sudo apt update
```

### 2. Install Nginx
```bash
sudo apt install nginx -y
```

### 3. Verify Nginx service
```bash
sudo systemctl status nginx
```

### 4. Test web access
Open a browser on the host machine and browse to:

```bash
http://SERVER-IP
```

## Expected Result
The default Nginx welcome page should be visible from the client machine.

## What I Learned
- How to install Nginx on Ubuntu Server
- How to verify and manage Linux services
- Basic web server deployment
- Testing network connectivity from a client
