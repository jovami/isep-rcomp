# RCOMP 2022-2023 Project - Sprint 2 - Member 1210951 folder

## Building B

## 1.OSPF

    router ospf 2
    network 10.80.164.0 0.0.0.255 area 2 - building
    network 10.80.167.0 255.255.255.128 area 0 - backbone

## 2.HTTP
Server - B_SV_0_1_HTTP:
- IP: 10.80.164.243 /28
- DG: 10.80.164.241 /27

## 3.DHCP

### Requirements:
- exclude dmz
- backbone(?) 
- use option  105 to VOIP  

**definir dns domain ???**

"show run":

    ip dhcp pool wifi
    network 10.80.164.0 255.255.255.128
    default-router 10.80.164.1

    ip dhcp pool f1
    network 10.80.164.128 255.255.255.192
    default-router 10.80.164.129

    ip dhcp pool f0
    network 10.80.164.192 255.255.255.224
    default-router 10.80.164.193

    ip dhcp pool voip
    network 10.80.164.240 255.255.255.240
    default-router 10.80.164.241
    option 150 ip 10.80.164.241

## 4. VoIP service

## 5. DNS


## 6. NAT

interface FastEthernet1/0
ip address 10.80.167.3 255.255.255.128
ip nat outside

interface FastEthernet0/0
no ip address
ip nat inside
duplex auto
speed auto

ip nat inside source static tcp 10.80.164.243 80 10.80.167.3 80 
ip nat inside source static tcp 10.80.164.243 443 10.80.167.3 443
ip nat inside source static tcp 10.80.164.242 53 10.80.167.3 53 
ip nat inside source static udp 10.80.164.242 53 10.80.167.3 53 



## 7. Static Firewall(ACL)
access-list 105 deny ip 10.80.164.0 0.0.0.255 any


## IPv4 Addressing

- IPv4 address block for building B network: **10.80.164.0/24**.

|       Network    | Router Sub-interface Addresses/Config | Network Address | Default Gateway|End Node Device IPV4 | Broadcast Address | Usable Addresses |
| :--------------: | :-----------------------------------: | :-------------:  | :---------------: | :---------------: | :--------------:|:--------------:|
| Wireless Network |          FastEthernet0/0.1          | 10.80.164.0 /25    |  10.80.164.1    |    10.80.164.2      |   10.80.164.127   |       126        |
|    Outlets F1    |          FastEthernet0/0.2          | 10.80.164.128 /26  |  10.80.164.129    |   10.80.164.130     |   10.80.164.191   |        62        |
|    Outlets F0    |          FastEthernet0/0.3          | 10.80.164.192 /27  |  10.80.164.193    |   10.80.164.194     |   10.80.164.223   |        30        |
|       VoIP       |          FastEthernet0/0.5          | 10.80.164.240 /28  |  10.80.164.241    |    ------------     |   10.80.164.255   |        14        |
|       DMZ        |          FastEthernet0/0.4          | 10.80.164.224 /28  |  10.80.164.225    |   10.80.164.226     |   10.80.164.239   |        14        |



## VTP DOMAIN

- The VTP Domain name to be used is **rc23ddg1**.

## VLANIDs

- The VLANID range to be used is **421 - 425**.

| **VLANIDs** | **VLAN Names** | **Nodes** |                  **Description**                   |
| :---------: | :------------: | :-------: | :------------------------------------------------: |
|     421     |     B_f0       |    25     |VLAN for all end-user outlets at the ground floor.  |
|     422     |      B_f1      |    60     |   A VLAN for all end-user outlets at floor one.    |
|     423     |      B_wifi    |    110    |VLAN for the Wireless Network.                      |
|     424     |     B_dmz      |    10     |             VLAN for the building DMZ.             |
|     425     |     B_voip     |    13     |                   VLAN for VoIP.                   |
