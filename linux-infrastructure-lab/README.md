# Linux Infrastructure Lab

## Objective
This project demonstrates the setup of a Linux-based infrastructure including web services, DNS, DHCP, and secure remote access in a controlled lab environment.

## Environment
- Ubuntu Server
- VMware Workstation
- NAT + Host-only networking
- Nginx
- BIND9
- ISC DHCP Server

## Network Configuration
- Adapter 1: NAT
- Adapter 2: Host-only (VMnet1)
- Server IP: 192.168.10.10
- SSH access: ssh student@192.168.10.10

## Modules
- Server (installation, SSH access, troubleshooting)
- Web Server (Nginx, multiple sites, HTTPS)
- DNS (BIND9 configuration and name resolution)
- DHCP (IP assignment for internal clients)

## Key Features
- Static IP configuration on Ubuntu
- Secure remote access via SSH
- Web hosting with Nginx and HTTPS
- Internal DNS resolution with custom domain (lab.local)
- DHCP server configuration for internal network

## Result
A fully functional Linux infrastructure lab where all services are integrated and tested within a virtualized network.

## What I Learned
- Linux server setup and troubleshooting
- Network configuration and debugging
- Service deployment and validation
- Understanding how infrastructure components interact
