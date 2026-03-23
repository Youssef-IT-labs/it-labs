# Linux Server Lab

## Doel

Het opzetten van een Ubuntu Server en configureren van SSH toegang.

## Omgeving

* VMware Workstation
* Ubuntu Server 24.04 LTS

## Stappen

### 1. VM aangemaakt

* 4GB RAM
* 20GB disk
* Bridged network

### 2. Ubuntu Server geïnstalleerd

### 3. SSH geïnstalleerd en gestart

```bash
sudo apt update
sudo apt install openssh-server -y
sudo systemctl start ssh
sudo systemctl enable ssh
```

### 4. IP-adres opgehaald

```bash
ip a
```

### 5. SSH getest

```bash
ssh student@192.168.129.36
```

## Resultaat

Werkende Linux server met remote SSH toegang.

## Wat ik geleerd heb

* Linux server setup
* SSH configuratie
* Netwerk basics
* Troubleshooting
* 
## Screenshots

Zie de screenshots in de map `screenshots/`.
