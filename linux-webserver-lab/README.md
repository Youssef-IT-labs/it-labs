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

  ## Screenshots

![Nginx Status](../screenshots/nginx-status.png)
![Nginx Browser](../screenshots/nginx-browser.png)

## Custom Website

After installing Nginx, I replaced the default page with a custom HTML page hosted from `/var/www/html`.

### Commands used

```bash
sudo cp /var/www/html/index.nginx-debian.html /var/www/html/index.nginx-debian.html.bak
sudo nano /var/www/html/index.html
sudo rm /var/www/html/index.nginx-debian.html
sudo systemctl reload nginx
```

## Additional Screenshots

### Web Root Files
![Web Root Files](../screenshots/web-root-files.png)

### Custom Website
![Custom Website](../screenshots/custom-site-browser.png)

## Firewall Configuration (UFW)

To secure the server, I configured UFW (Uncomplicated Firewall).

### Commands used

```bash
sudo apt install ufw -y
sudo ufw allow ssh
sudo ufw allow 80
sudo ufw enable
sudo ufw status
```

### Screenshot

![UFW Status](../screenshots/ufw-status.png)

## Multiple Websites (Virtual Hosts)

I configured Nginx to host multiple websites on the same server using different ports.

### Second Website Setup

```bash
sudo mkdir -p /var/www/site2
sudo nano /var/www/site2/index.html
sudo chown -R www-data:www-data /var/www/site2
```

### Nginx Configuration

```bash
sudo nano /etc/nginx/sites-available/site2
sudo ln -s /etc/nginx/sites-available/site2 /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

### Firewall

```bash
sudo ufw allow 8080
```

### Screenshots

![Second Site](../screenshots/site2-browser.png)

## HTTPS Configuration (SSL)

To secure the web server, I configured HTTPS using a self-signed SSL certificate.

A self-signed certificate encrypts the connection, but it is not trusted by browsers, which results in a warning message.

### Commands used

```bash
sudo apt install openssl -y
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt
```

### Nginx SSL Configuration

```bash
sudo nano /etc/nginx/sites-available/default
sudo nginx -t
sudo systemctl reload nginx
```

### Firewall

```bash
sudo ufw allow 443
```

### Screenshots

#### HTTPS Warning

![HTTPS Warning](../screenshots/https-warning.png)

#### HTTPS Website

![HTTPS Website](../screenshots/https-browser.png)

#### Firewall with HTTPS

![UFW 443](../screenshots/ufw-443.png)

#### SSL Certificate Details

![SSL Certificate](../screenshots/ssl-certificate-details.png)

## Real SSL Attempt with Let's Encrypt

I tested whether I could configure a publicly trusted SSL certificate for the lab environment.

### Result

This was not possible in the current setup because the server is running on a private local IP address (`192.168.129.36`) inside a virtual lab environment.

Let's Encrypt requires the domain and validation endpoint to be publicly reachable, or to use DNS-based validation with a real domain.  
Because this lab server is only accessible on the local network, a publicly trusted certificate could not be issued.

### What I learned

- The difference between a self-signed certificate and a publicly trusted certificate
- Why Let's Encrypt does not work directly with private local IP addresses
- That public SSL usually requires either:
  - a public domain name and public HTTP validation
  - or DNS-01 validation with control over DNS records

### Conclusion

For this lab, a self-signed certificate was the correct solution for testing HTTPS locally.

