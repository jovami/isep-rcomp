# RCOMP 2022-2023 Project - Sprint 2 - Member 1210957 folder

## Building D

- The VTP Domain name to be used is **rc23ddg1**.

- The VLANID range to be used is **431 - 435**.

- IPv4 address space to be used **10.80.166.0/24**.

## VLANIDs, VLAN Names and Description

| **VLANIDs** | **VLAN Names** | **Nodes** |                  **Description**                   |
| :---------: | :------------: | :-------: | :------------------------------------------------: |
|     431     |     D_wifi     |    80     |           VLAN for the Wireless Network.           |
|     432     |      D_f1      |    60     |   A VLAN for all end-user outlets at floor one.    |
|     433     |      D_f0      |    25     | VLAN for all end-user outlets at the ground floor. |
|     434     |     D_dmz      |    10     |             VLAN for the building DMZ.             |
|     435     |     D_voip     |    13     |                   VLAN for VoIP.                   |

## IPv4 Addressing

In this section, the IPv4 Networking will be described

### Provided Address Block: 10.80.162.0 / 23

To determine the IPv4 Networks necessary for each individual VLAN, IPv4 subnetting had to be made to support 80, 60, 25, 10, and 13 nodes, we can follow these steps using the "bigger blocks first" rule:

- Step 1: Find the subnet mask for the /24 network

  The /24 network has a subnet mask of 255.255.255.0. This means that the network has 256 addresses (2^8),
  with the range of addresses from 10.80.166.0 to 10.80.166.255.

- Step 2: Determine the required number of subnets for each requirement

  for every topic it will be demostrated using the following example:
  (2^x = needed nodes, and we subtract 2 for the network and broadcast addresses).

  To support 80 nodes, we need at least 2^7 - 2 = 126 addresses.

  To support 60 nodes, we need at least 2^6 - 2 = 62 addresses.

  To support 25 nodes, we need at least 2^5 - 2 = 30 addresses.

  To support 10 nodes, we need at least 2^4 - 2 = 14 addresses.

  To support 13 nodes, we need at least 2^4 - 2 = 14 addresses.

- The Network Prefix for each subnetwork was determined. This was done by analysing the node necessity of each VLAN, and then choosing the appropriate prefix, according to the number of required nodes.
  This originated the following result:

| **VLANIDs** | **VLAN Names** | **Nodes** | **Network Prefix** |
| :---------: | :------------: | :-------: | :----------------: |
|     431     |     D_wifi     |    80     |      **/25**       |
|     432     |      D_f1      |    60     |      **/26**       |
|     433     |      D_f0      |    25     |      **/27**       |
|     434     |     D_dmz      |    10     |      **/28**       |
|     435     |     D_voip     |    13     |      **/28**       |

|                  | Router Sub-interface Addresses/Config | Subnet Mask | Network Address |   Subnet Mask   | End Node Device IPV4 | Broadcast Address | Usable Addresses | Required Addresses |
| :--------------: | :-----------------------------------: | :---------: | :-------------: | :-------------: | :------------------: | :---------------: | :--------------: | :----------------: |
| Wireless Network |          FastEthernet0/0.431          |     /25     |   10.80.166.0   | 255.255.255.128 |     10.80.166.4      |   10.80.166.127   |       126        |         80         |
|    Outlets F1    |          FastEthernet0/0.432          |     /26     |  10.80.166.128  | 255.255.255.192 |    10.80.166.130     |   10.80.166.191   |        62        |         60         |
|    Outlets F0    |          FastEthernet0/0.433          |     /27     |  10.80.166.192  | 255.255.255.224 |    10.80.166.194     |   10.80.166.223   |        30        |         25         |
|       DMZ        |          FastEthernet0/0.434          |     /28     |  10.80.166.224  | 255.255.255.240 |    10.80.166.226     |   10.80.166.239   |        14        |         10         |
|       VoIP       |          FastEthernet0/0.435          |     /28     |  10.80.166.240  | 255.255.255.240 |     ------------     |   10.80.166.255   |        14        |         13         |
