# RCOMP 2022-2023 Project - Sprint 2 - Member 1210951 folder

## Building B

## 1.OSPF

    router ospf 2
    network 10.80.164.0 0.0.0.255 area 2 - building
    network 10.80.167.0 255.255.255.128 area 0 - backbone

## 2.HTTP
Server - B_SV_0_2_HTTP:
- IP: 10.80.164.243 /28
- DG: 10.80.164.241 /28

## 3.DHCP

### Requirements:

    ip dhcp pool wifi
    network 10.80.164.0 255.255.255.128
    default-router 10.80.164.1
    dns-server 10.80.164.242
    domain-name building-b.rcomp-22-23-dd-g09

    ip dhcp pool f1
    network 10.80.164.128 255.255.255.192
    default-router 10.80.164.129
    dns-server 10.80.164.242
    domain-name building-b.rcomp-22-23-dd-g09

    ip dhcp pool f0
    network 10.80.164.192 255.255.255.224
    default-router 10.80.164.193
    dns-server 10.80.164.242
    domain-name building-b.rcomp-22-23-dd-g09

    ip dhcp pool voip
    network 10.80.164.224 255.255.255.240
    default-router 10.80.164.225
    option 150 ip 10.80.164.225

- exclude dmz 
- use option  105 to VOIP  


## 4. VoIP service

### Campus connections:

    dial-peer voice 1 voip
    destination-pattern 1...
    session target ipv4:10.80.167.2
    !
    dial-peer voice 2 voip
    destination-pattern 2...
    session target ipv4:10.80.167.3
    !
    dial-peer voice 3 voip
    destination-pattern 3...
    session target ipv4:10.80.167.4
    !
    dial-peer voice 4 voip
    destination-pattern 1...
    session target ipv4:10.80.167.5
    !

    dial-peer voice 5 voip
    destination-pattern 5...
    session target ipv4:10.80.167.6


### Building VOIP configure:
    telephony-service
    max-ephones 2
    max-dn 2
    ip source-address 10.80.164.225 port 2000
    auto assign 1 to 2

    ephone-dn 1
    number 2001
    !
    ephone-dn 2
    number 2002
    !


## 5. DNS

Server - B_SV_0_1_DNS:
- IP: 10.80.164.242 /28
- DG: 10.80.164.241 /28



## 6. NAT

interface FastEthernet1/0<br>
ip address 10.80.167.3 255.255.255.128<br>
ip nat outside


NOTE: NAT it is only used to translate packets related to dns and http(dmz devices) so **only the subinterface related to dmz** needs to have the nat side configured

interface FastEthernet0/0.5<br>
 encapsulation dot1Q 424<br>
 ip address 10.80.164.241 255.255.255.240<br>
 ip nat inside<br>

    ip nat inside source static tcp 10.80.164.243 80 10.80.167.3 80 
    ip nat inside source static tcp 10.80.164.243 443 10.80.167.3 443
    ip nat inside source static tcp 10.80.164.242 53 10.80.167.3 53 
    ip nat inside source static udp 10.80.164.242 53 10.80.167.3 53 

## 7. Static Firewall (ACL)

1. Interface Fa 0/0    (INTRANET)

Allow internal nodes to reach any ip (all newtowrk)
- access-list 120 permit ip 10.80.164.0 0.0.0.127 any
- access-list 120 permit ip 10.80.164.128 0.0.0.63 any
- access-list 120 permit ip 10.80.164.192 0.0.0.31 any
- access-list 120 permit ip 10.80.164.224 0.0.0.15 any
- access-list 120 permit ip 10.80.164.240 0.0.0.15 any

**2**
Allow internal nodes to request and answer icmp requests
- access-list 120 permit icmp 10.80.164.0 0.0.0.255 any echo
- access-list 120 permit icmp 10.80.164.0 0.0.0.255 any echo-reply

**3**
Allow HTTP server to be reached by any tcp packet using HTTP(80) AND HTTP(443)
- access-list 120 permit tcp any host 10.80.164.243 eq www
- access-list 120 permit tcp any host 10.80.164.243 eq 443

Allow DNS server to be reached by any packet using udp on port domain(52)
- access-list 120 permit udp any host 10.80.164.242 eq domain
        - access-list 120 permit tcp any host 10.80.164.242 eq domain

Deny all the other traffic that comes to the dmz server
- access-list 120 deny ip any 10.80.146.240 0.0.0.15


?????????
- access-list 120 deny ip any host 10.80.164.0

2. Inteface Fa1/0  (INTERNET)


**1** Block external spoofing:
- access-list 121 deny ip 10.80.164.0 0.0.0.255 any

**2**Allow all icmp requests/replies
- access-list 121 permit icmp any any echo
- access-list 121 permit icmp any any echo-reply

**3**Allow HTTP(80)/HTTPS(443) access to 10.80.164.243(B_SV_0_2_HTTP)
- access-list 121 permit tcp any host 10.80.164.243 eq www
- access-list 121 permit tcp any host 10.80.164.243 eq 443

Allow DNS server to be reached by any packet using udp on port domain(52)
- access-list 121 permit udp any host 10.80.164.242 eq domain
        - access-list 121 permit tcp any host 10.80.164.242 eq domain

# **Allow ospf to be used ??**
- access-list 121 permit ospf any any**


Allow any dmz requests?
- access-list 121 permit ip any 10.80.164.224 0.0.0.15


Allow any host to acces router's backbone interface
- access-list 121 permit ip any host 10.80.167.3
