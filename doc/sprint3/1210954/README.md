RCOMP 2022-2023 Project - Sprint 3 - Member 1210954 folder
==========================================================

# OSPF

All static routes (except the backbone default) were removed:
```bash
# Backbone router
no ip route 10.80.162.0 255.255.254.0 10.80.167.6
no ip route 10.80.164.0 255.255.255.0 10.80.167.3
no ip route 10.80.165.0 255.255.255.0 10.80.167.4
no ip route 10.80.166.0 255.255.255.0 10.80.167.5
no ip route 10.80.160.0 255.255.254.0 10.80.167.2

# Building A router
no ip route 0.0.0.0 0.0.0.0 10.80.167.1
```

## Backbone OSPF

```bash
router ospf 1
    network 10.80.167.0 0.0.0.127 area 0 # Backbone
    network 10.80.160.0 0.0.1.255 area 1 # Building A
    network 10.80.162.0 0.0.1.255 area 5 # Building E
    network 10.80.164.0 0.0.0.255 area 2 # Building B
    network 10.80.165.0 0.0.0.255 area 3 # Building C
    network 10.80.166.0 0.0.0.255 area 4 # Building D
    default-information originate
```

## Building A OSPF
```bash
router ospf 1
    network 10.80.160.0 0.0.1.255 area 1 # Building A
    network 10.80.167.0 0.0.0.127 area 0 # Backbone
```

# HTTP Server
**IP Address:** 10.80.161.3/25

## Home Page
![home_page_preview](./homepage.png)

# DHCP

## Requirements

1. Provide DHCP to all local networks within the building
2. DMZ has static addresses
3. Backbone has static addresses
4. Configuration for the VoIP VLAN must include **option 150**

## Configuration
### Excluded Addresses
```bash
# Default gateways for each VLAN
ip dhcp excluded-address 10.80.160.1
ip dhcp excluded-address 10.80.160.129
ip dhcp excluded-address 10.80.161.1
ip dhcp excluded-address 10.80.161.129
ip dhcp excluded-address 10.80.161.193

# DMZ (including its default gateway)
ip dhcp excluded-address 10.80.161.1 10.80.161.127
```

### DHCP Pools

```bash
# Floor 1
ip dhcp pool f1
    network 10.80.160.0 255.255.255.128
    default-router 10.80.160.1
    dns-server 10.80.161.2
    domain-name rcomp-22-23-dd-g9

# WiFi
ip dhcp pool wifi
    network 10.80.160.128 255.255.255.128
    default-router 10.80.160.129
    dns-server 10.80.161.2
    domain-name rcomp-22-23-dd-g9

# Floor 0
ip dhcp pool f0
    network 10.80.161.128 255.255.255.192
    default-router 10.80.161.129
    dns-server 10.80.161.2
    domain-name rcomp-22-23-dd-g9

# VoIP
ip dhcp pool voip
    network 10.80.161.192 255.255.255.192
    default-router 10.80.161.193
    dns-server 10.80.161.2
    domain-name rcomp-22-23-dd-g9
    option 150 ip 10.80.161.193 # IP address of the TFTP server
```

# VoIP Service

**Phone prefix:** `1...`.

## Telephony service

```bash
telephony-service
    auto-reg-ephone
    max-ephones 35
    max-dn 35
    ip source-address 10.80.161.193 port 2000
    auto assign 1 to 35

ephone-dn 1
    number 1000

ephone-dn 2
    number 1001
```
## Call Forwarding
```bash
dial-peer voice 2 voip
    destination-pattern 2...
    session target ipv4:10.80.167.3

dial-peer voice 3 voip
    destination-pattern 3...
    session target ipv4:10.80.167.4

dial-peer voice 4 voip
    destination-pattern 4...
    session target ipv4:10.80.167.5

dial-peer voice 5 voip
    destination-pattern 5...
    session target ipv4:10.80.167.6
```

# DNS service

**DNS Domain Name:** `rcomp-22-23-dd-g9`

DNS records:

![dns_records](./dnsconfig.png)

# Network Address Translation (NAT)
## Interface configuration
```bash
# Building-A-facing (sub)interfaces
interface FastEthernet0/0.416
    ip nat inside
interface FastEthernet0/0.417
    ip nat inside
interface FastEthernet0/0.418
    ip nat inside
interface FastEthernet0/0.419
    ip nat inside
interface FastEthernet0/0.420
    ip nat inside

# Backbone-facing interface
interface FastEthernet1/0
    ip nat outside
```
## Redirection
```bash
# Redirect HTTP/HTTPS requests to our internal HTTPS server
ip nat inside source static tcp 10.80.161.3 80 10.80.167.2 80
ip nat inside source static tcp 10.80.161.3 443 10.80.167.2 443

# Redirect DNS requests to our internal DNS server
ip nat inside source static tcp 10.80.161.2 53 10.80.167.2 53
ip nat inside source static udp 10.80.161.2 53 10.80.167.2 53
```
# Static firewall (ACLs)

## Backbone router
```bash
# internal spoofing
access-list 100 permit ip 10.80.160.0 0.0.7.255 any

# external spoofing
access-list 101 deny   ip 10.80.160.0 0.0.7.255 any
# allow all but the ones from external spoofing
access-list 101 permit ip any any
```

## Building A router

### Fa 0/0's sub-interfaces (inwards-facing)
```bash
# internal spoofing
access-list 110 permit ip 10.80.160.0 0.0.1.255 any

# allow outgoing ICMP echo requests/replies
access-list 110 permit icmp 10.80.160.0 0.0.1.255 any echo-reply
access-list 110 permit icmp 10.80.160.0 0.0.1.255 any echo

# permit outgoing traffic from DMZ if from DNS or HTTP/HTTPS services
access-list 110 permit tcp host 10.80.161.3 eq www      any established
access-list 110 permit tcp host 10.80.161.3 eq 443      any established
access-list 110 permit udp host 10.80.161.2 eq domain   any
access-list 110 permit tcp host 10.80.161.2 eq 53       any established

# TFTP traffic for VoIP phones
access-list 110 permit udp 10.80.161.192 0.0.0.63 eq tftp any eq tftp
```
### Interface Fa 1/0 (outwards-facing)
```bash
# external spoofing
access-list 111 deny ip 10.80.160.0 0.0.1.255 any

# permit incoming ICMP echo requests/replies
access-list 111 permit icmp any 10.80.160.0 0.0.1.255 echo
access-list 111 permit icmp any 10.80.160.0 0.0.1.255 echo-reply

# Allow traffic to DNS/HTTP services (via NAT)
access-list 111 permit tcp any host 10.80.167.2 eq www
access-list 111 permit tcp any host 10.80.167.2 eq 443
access-list 111 permit tcp any host 10.80.167.2 eq 53
access-list 111 permit udp any host 10.80.167.2 eq domain

# Block all traffic to the DMZ
access-list 111 deny ip any 10.80.161.0 0.0.0.127

# TFTP and dial-peer
access-list 111 permit udp any eq tftp host 10.80.167.2 eq tftp
access-list 111 permit tcp any host 10.80.167.2 eq 1720
access-list 111 permit tcp any host 10.80.167.2 established

# OSPF traffic
access-list 111 permit ospf any any

# Deny all other traffic directed to the router
access-list 111 deny ip any host 10.80.167.2

# DHCP traffic
access-list 111 permit ip host 0.0.0.0 host 255.255.255.255

# Remaining traffic should be allowed
access-list 111 permit ip any any
```
