# RCOMP 2022-2023 Project - Sprint 2 - Member 1210951 folder

## Building B

## VLAN

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

## IPv4 Addressing

- IPv4 address block for building B network: **10.80.164.0/24**.

Each vlan has its own network, so the network provided needs to have apllied some subnetting in order to have multiple networks for each one of the vlans
At least 5 networks are needed with the following capacities: 110,60,25,10 and 13 adresses, after this process we ended up with the following layout:

|       Network    | Router Sub-interface Addresses/Config | Network Address | Default Gateway|End Node Device IPV4 | Broadcast Address | Usable Addresses |
| :--------------: | :-----------------------------------: | :-------------:  | :---------------: | :---------------: | :--------------:|:--------------:|
| Wireless Network |          FastEthernet0/0.1          | 10.80.164.0 /25    |  10.80.164.1    |    10.80.164.2      |   10.80.164.127   |       126        |
|    Outlets F1    |          FastEthernet0/0.2          | 10.80.164.128 /26  |  10.80.164.129    |   10.80.164.130     |   10.80.164.191   |        62        |
|    Outlets F0    |          FastEthernet0/0.3          | 10.80.164.192 /27  |  10.80.164.193    |   10.80.164.194     |   10.80.164.223   |        30        |
|       VoIP       |          FastEthernet0/0.5          | 10.80.164.240 /28  |  10.80.164.240    |    ------------     |   10.80.164.255   |        14        |
|       DMZ        |          FastEthernet0/0.4          | 10.80.164.224 /28  |  10.80.164.225    |   10.80.164.226     |   10.80.164.239   |        14        |
