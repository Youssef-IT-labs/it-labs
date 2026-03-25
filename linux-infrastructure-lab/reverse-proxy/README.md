# Reverse Proxy Lab

## Objective
This lab demonstrates how to configure Nginx as a reverse proxy to route traffic to multiple backend services running on different ports.

## Scenario
A single server hosts multiple backend applications.  
Nginx is used as a reverse proxy to route incoming requests based on the requested domain.

## Architecture
- Reverse Proxy: Nginx
- Backend 1: localhost:8081
- Backend 2: localhost:8082

## Domains
- app1.lab.local → backend on port 8081
- app2.lab.local → backend on port 8082
