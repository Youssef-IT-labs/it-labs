# Linux Server Lab

## Objective

The goal of this lab was to install and configure an Ubuntu Server and enable remote access using SSH.

## Environment

* VMware Workstation
* Ubuntu Server 24.04 LTS

## Steps

### 1. Virtual Machine Setup

* 4GB RAM
* 20GB disk
* Bridged network

### 2. Ubuntu Server Installation

The Ubuntu Server operating system was installed using the official ISO.

### 3. SSH Configuration
During the installation, I selected the option "Install OpenSSH server", which automatically installed SSH.

After installation, I verified that the SSH service was running:

```bash
sudo systemctl status ssh
```
If the service was not running, it can be started and enabled with:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

### 4. IP Address Configuration

To find the server's IP address, I used:

```bash
ip a
```

### 5. SSH Connection Test

I successfully connected to the server remotely from my host machine using:

```bash
ssh student@192.168.129.36
```

## Result

A fully functional Linux server with remote SSH access.

## What I Learned

* Installing a Linux server
* Configuring SSH access
* Basic networking concepts (DHCP & IP addressing)
* Troubleshooting services

## Troubleshooting

### Password Reset Issue

During the setup, I encountered an issue where I could not log in due to an incorrect password.

To resolve this, I used recovery mode and performed the following steps:

1. Booted into **GRUB menu**
2. Selected **Advanced options for Ubuntu**
3. Chose **recovery mode**
4. Opened a root shell

Then I remounted the filesystem as writable:

```bash
mount -o remount,rw /
```

After that, I reset the password:

```bash
passwd student
```

Finally, I rebooted the system:

```bash
reboot
```

This allowed me to regain access to the server.

## Lessons Learned

* How to use recovery mode in Linux
* How to remount the filesystem
* How to reset a user password
* Importance of correct keyboard layout (AZERTY vs QWERTY)


## Screenshots

![Install](../screenshots/install.png)
![Network](../screenshots/network.png)
![IP](../screenshots/ip.png)
![SSH Status](../screenshots/ssh-status.png)
![SSH Connection](../screenshots/ssh.png)

