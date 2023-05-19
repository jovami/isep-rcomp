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

### Its between buildings:

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

### Exclude default gateway for each network
    ip dhcp excluded-address 10.80.164.1
    ip dhcp excluded-address 10.80.164.129
    ip dhcp excluded-address 10.80.164.193
    ip dhcp excluded-address 10.80.164.225
    ip dhcp excluded-address 10.80.164.241


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
    max-ephones 13
    max-dn 13
    ip source-address 10.80.164.225 port 2000
    auto assign 1 to 13

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

# INSIDE TO OUTSIDE
**IMPLICIT SPOOFING, ONLY INTERIOR IP'S ARE ALLOWED**

    access-list 120 permit ip 10.80.164.0 0.0.0.255 any

**ICMP ECHO AND REPLIES IN BOTH DIRECTIONS**

    access-list 120 permit icmp 10.80.164.0 0.0.0.255 any echo-reply
    access-list 120 permit icmp 10.80.164.0 0.0.0.255 any echo

**DMZ RESPONSES**

    access-list 120 permit tcp host 10.80.164.243 eq www any established
    access-list 120 permit tcp host 10.80.164.243 eq 443 any established
    access-list 120 permit udp host 10.80.164.242 eq domain any 
    access-list 120 permit tcp host 10.80.164.242 eq 53 any established

**ALLOW TFTP SERVICE**

    access-list 120 permit udp 10.80.164.224 0.0.0.15 eq tftp any eq tftp



# OUTSIDE TO INSIDE
**bLOC EXTERNAL SPOOFING**

    access-list 121 deny ip 10.80.164.0 0.0.0.255 any

**ICMP ECHO AND REPLIES IN BOTH DIRECTIONS**

    access-list 121 permit icmp any 10.80.164.0 0.0.0.255 echo
    access-list 121 permit icmp any 10.80.164.0 0.0.0.255 echo-reply

**DMZ TRAFFIC TROUGHT NAT ON ROUTER**

    access-list 121 permit tcp any host 10.80.167.3 eq www
    access-list 121 permit tcp any host 10.80.167.3 eq 443
    access-list 121 permit tcp any host 10.80.167.3 eq 53
    access-list 121 permit udp any host 10.80.167.3 eq domain

**PERMIT OSPF REQUESTS TO ROUTER**

    access-list 121 permit ospf any any 

**DENY ALL THE REQUESTS SENT DIRECTLY TO THE DMZ**

Except for icmp packets, since this this policy is overwritten by the 2 policy that allows all icmp traffic:  

    access-list 121 deny ip any 10.80.164.240 0.0.0.15

**ALLOW 1STDHCP REQUEST**

(DHCP service uses port 67 and 68) but this information was not mentioned on the sprint specifications <br>
In that case we should use : access-list 121 permit ip host 0.0.0.0 eq 67 host 255.255.255.255 eq 68

    access-list 121 permit ip host 0.0.0.0 host 255.255.255.255

**ALLOW TFTP SERVICE**

    access-list 121 permit udp any eq tftp 10.80.167. eq tftp
    
**ALLOW ITS SERVICE**

    access-list 121 permit tcp any host 10.80.167.3 eq 1720
    access-list 121 permit tcp any host 10.80.167.3 established

**BLOCK ALL THE OTHER ACCES DIRECTKY TO THE ROUTER**

    access-list 121 deny ip any host 10.80.167.3

**ALL THE OTHER TRAFFIC MUST BE ALLOWED**

    access-list 121 permit ip any any
