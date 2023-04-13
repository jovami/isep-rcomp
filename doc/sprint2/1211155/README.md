# RCOMP 2024-2023 Project - Sprint 2 - Member 1211155 folder

============================================================

# Introduction

The objective of this assignment is to develop a network simulation for the structured
cabling project of Building C, emphasizing layer two infrastructure and layer three fundamentals.

# VLANs

- The VTP domain name for this project is **rc23ddg1**.
- The VLAN ID range to be used is **426-430**, (inclusive).

## VLAN Distribution

| VLAN ID | VLAN Name | No. nodes |         Description         |
| :-----: | :-------: | :-------: | :-------------------------: |
|   426   |   C_f0    |    40     | Network outlets for Floor 0 |
|   427   |   C_f1    |    50     | Network outlets for Floor 1 |
|   428   |  C_wifi   |    55     |        Wi-Fi Network        |
|   429   |   C_dmz   |    20     |          DMZ VLAN           |
|   430   |  C_voip   |    25     |        VoIP network         |

# IPv4 addressing

As determined in the [sprint planning](../planning.md), the IPv4 address assigned to building C
is **10.80.165.0/24**

## IPv4 Distribution

To determine the necessary IPv4 networks for each VLAN in Building C, we need to perform IPv4 subnetting.
We have 5 VLANs, each with different numbers of nodes:

- VLAN C_f0 with 40 nodes
- VLAN C_f1 with 50 nodes
- VLAN C_wifi with 55 nodes
- VLAN C_dmz with 20 nodes
- VLAN C_voip with 25 nodes

Using the **"bigger blocks first"** rule, we can follow these steps:

- Step 2: Find the subnet mask for the /24 network

The /25 network has a subnet mask of 255.255.255.0, which gives us 256 addresses (2^8), with the
range of addresses from 10.80.165.0 to 10.80.165.255.

- Step 3: Determine the required number of subnets for each VLAN

To support 40 nodes, we need at least 2^6 - 2 = 62 addresses.

To support 50 nodes, we need at least 2^6 - 2 = 62 addresses.

To support 55 nodes, we need at least 2^6 - 2 = 62 addresses.

To support 20 nodes, we need at least 2^5 - 2 = 30 addresses.

To support 25 nodes, we need at least 2^5 - 2 = 30 addresses.

Step 4: Determine the network prefix for each subnetwork

We can now determine the network prefix for each subnetwork using the formula X = 32 - log2(N),
where N is the number of required addresses rounded up to the next power of two.
Here are the network prefixes for each subnetwork:

- VLAN C_f0: 10.80.165.0/26
- VLAN C_f1: 10.80.165.64/26
- VLAN C_wifi: 10.80.165.128/26
- VLAN C_dmz: 10.80.165.192/27
- VLAN C_voip: 10.80.165.224/27

These network prefixes can be used to configure the routers and switches for each VLAN in Building C.

### IPv4 Summary

| VLAN ID | VLAN Name | Network Address | Subnet Mask           | Router Subinterface |
| ------- | --------- | --------------- | --------------------- | ------------------- |
| 426     | C_f0      | 10.80.165.0     | 255.255.255.192 (/26) | FastEthernet0/0.1   |
| 427     | C_f1      | 10.80.165.64    | 255.255.255.192 (/26) | FastEthernet0/0.2   |
| 428     | C_wifi    | 10.80.165.128   | 255.255.255.192 (/26) | FastEthernet0/0.3   |
| 429     | C_dmz     | 10.80.165.192   | 255.255.255.224 (/27) | FastEthernet0/0.4   |
| 430     | C_voip    | 10.80.165.224   | 255.255.255.224 (/27) | FastEthernet0/0.5   |
