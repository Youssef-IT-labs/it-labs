# ICMP Connectivity Issue – GPO Firewall Solution

## Objective

Resolve a network connectivity issue between a Domain Controller and a client using Group Policy.

## Environment

* Domain: corp.local
* Domain Controller: DC01
* Client: CL01
* Network: 192.168.10.0/24

## Problem

Ping from the client to the Domain Controller worked, but ping from the Domain Controller to the client failed.

## Analysis

* Network configuration was correct
* Both systems were reachable
* Issue was directional (inbound traffic)

## Root Cause

Inbound ICMP (ping) traffic was blocked by the Windows Firewall on the client machine.

## Solution

### 1. OU Structure

Created an Organizational Unit:

Workstations

Moved the client machine (CL01) into this OU.

---

### 2. GPO Configuration

Created a GPO:

Allow ICMP

Linked to:

Workstations OU

Configured under:

Computer Configuration → Windows Settings → Security Settings → Windows Defender Firewall → Inbound Rules

Rule:

* Protocol: ICMPv4
* Type: Echo Request
* Action: Allow
* Profile: Domain

---

### 3. Apply Policy

On the client:

gpupdate /force

---

## Result

Ping from DC01 to CL01 was successful after applying the Group Policy.

---

## Key Takeaways

* Firewall rules can block inbound traffic even if network is correct
* GPO is the correct way to manage firewall rules centrally
* OU design is important for targeted policy application

---

## Screenshots

### Ping Failure

![Ping Failure](screenshots/ping-failure.png)

### GPO Configuration

![GPO](screenshots/gpo-config.png)

### Ping Success

![Ping Success](screenshots/ping-success.png)
