RCOMP 2022-2023 Project - Sprint 2 - Member 1181478 folder
===========================================
(This folder is to be created/edited by the team member 1181478 only)

## Building E

* The VTP Domain name to be used is **rc23ddg1**.

* The VLANID range to be used is **415 - 445**.

* IPv4 address space to be used **10.80.160.0/21**.

## VLANIDs, VLAN Names and Description

| **VLANIDs** | **VLAN Names** | **Necessary IPv4 Nodes** |                                              **Description**                                               |
|:-----------:|:--------------:|:------------------------:|:----------------------------------------------------------------------------------------------------------:|
|     436     |       X        |            45            |                             VLAN for all end-user outlets at the ground floor.                             |
|     437     |       x        |            60            |                               A VLAN for all end-user outlets at floor one.                                |
|     438     |       x        |            70            |              VLAN for the Wi-Fi network (for all access-points’ outlets within the building).              |
|     439     |       x        |            20            |  VLAN for the building DMZ(for servers, administration workstations, and infrastructure network devices).  |
|     440     |       x        |            25            |                           VLAN for VoIP (for all IP-phones within the building).                           |

## IPv4 Addressing

In this section, the IPv4 Networking will be described

### Provided Address Block: 10.80.162.0 / 23 ###

To determine the IPv4 Networks necessary for each individual VLAN, IPv4 subnetting had to be made to support 70, 60, 45, 25, and 20 nodes, we can follow these steps using the "bigger blocks first" rule:

- Step 1: Find the subnet mask for the /23 network

  The /23 network has a subnet mask of 255.255.254.0. This means that the network has 512 addresses (2^9),
  with the range of addresses from 10.80.162.0 to 10.80.163.255.


- Step 2: Determine the required number of subnets for each requirement

  To support 70 nodes, we need at least 2^7 - 2 = 126 addresses (2^7 = 128, and we subtract 2 for the network address and broadcast address).
  This means we need at least one subnet with a subnet mask of /25.

  To support 60 nodes, we need at least 2^6 - 2 = 62 addresses (2^6 = 64, and we subtract 2 for the network address and broadcast address).
  This means we need at least one subnet with a subnet mask of /26.

  To support 45 nodes, we need at least 2^6 - 2 = 62 addresses (2^6 = 64, and we subtract 2 for the network address and broadcast address).
  This means we need at least one subnet with a subnet mask of /26.

  To support 25 nodes, we need at least 2^5 - 2 = 30 addresses (2^5 = 32, and we subtract 2 for the network address and broadcast address).
  This means we need at least one subnet with a subnet mask of /27.

  To support 20 nodes, we need at least 2^4 - 2 = 14 addresses (2^4 = 16, and we subtract 2 for the network address and broadcast address).
  This means we need at least one subnet with a subnet mask of /27.

- The Network Prefix for each subnetwork was determined. This was done by analysing the node necessity of each VLAN, and then choosing the appropriate prefix, according to the number of required nodes.
  This originated the following result:


| **VLANIDs** | **VLAN Names** | **Necessary IPv4 Nodes** | **Network Prefix** |
|:-----------:|:--------------:|:------------------------:|:------------------:|
|     436     |       X        |            45            |      **/26**       |
|     437     |       x        |            60            |      **/26**       |
|     438     |       x        |            70            |      **/25**       |
|     439     |       x        |            20            |      **/27**       |
|     440     |       x        |            25            |      **/27**       |


|                           |  Subnet Mask  | Network Address  |   Network Mask   |  First Node Address  |  Broadcast Address  |  Usable Addresses  |  Required Addresses  |
|:-------------------------:|:-------------:|:----------------:|:----------------:|:--------------------:|:-------------------:|:------------------:|:--------------------:|
|       Wi-Fi Network       |      /25      |   10.80.162.0    | 255.255.255.128  |     10.80.162.1      |    10.80.162.127    |        126         |          70          |
|  1st Floor User Outlets   |      /26      |  10.80.162.128   | 255.255.255.192  |    10.80.162.129     |    10.80.162.191    |         62         |          60          |
| Ground Floor User Outlets |      /26      |  10.80.162.192   | 255.255.255.192  |    10.80.162.193     |    10.80.162.255    |         62         |          45          |
|           VoIP            |      /27      |   10.80.163.0    | 255.255.255.224  |     10.80.163.1      |    10.80.163.31     |         30         |          25          |
|       Building DMZ        |      /27      |   10.80.163.32   | 255.255.255.224  |     10.80.163.33     |    10.80.163.63     |         30         |          20          |
