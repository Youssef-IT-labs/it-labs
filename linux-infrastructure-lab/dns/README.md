# Linux DNS Lab

## Objective

The goal of this lab is to configure a local DNS server using BIND9 and resolve domain names to IP addresses within a local network.

---

## Environment

* Ubuntu Server
* BIND9 DNS Server
* VMware (Host-only network)

---

## Goal

Resolve a custom domain name:

**webserver.lab.local → 192.168.10.10**

---

## DNS Configuration

A local DNS server was configured using BIND9.

### Zone Configuration

The following zone was created:

```bash
sudo nano /etc/bind/named.conf.local
```

A custom zone file was configured:

```bash
sudo nano /etc/bind/db.lab.local
```

---

## Commands Used

```bash
sudo apt install bind9 -y
sudo systemctl restart bind9
```

---

## Resolver Configuration

The server was configured to use its own DNS service:

```bash
sudo resolvectl dns ens37 127.0.0.1
sudo resolvectl domain ens37 lab.local
sudo resolvectl flush-caches
```

---

## Testing

DNS resolution was tested using:

```bash
nslookup webserver.lab.local 127.0.0.1
```

The domain successfully resolves to:

```
192.168.10.10
```

---

## Result

A working local DNS server capable of resolving internal domain names within the lab network.

---

## What I Learned

* How DNS works in a local network
* Configuring BIND9 zones
* Using a local resolver (127.0.0.1)
* Troubleshooting DNS resolution

---

## Screenshots

![DNS Test](../screenshots/dns-nslookup-test.png)

![BIND Status](../screenshots/bind-status.png)

![DNS Config](../screenshots/dns-config.png)




