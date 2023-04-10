RCOMP 2022-2023 Project - Sprint 2 - Member 1210954 folder
==========================================================

# VLANs

- VTP Domain name: **rc23ddg1**.
- VLAN ID range:
    + Building A: **416-420** (inclusive)
    + Campus Backbone: **415**

## Distribution

| VLAN ID   | VLAN Name     | No. nodes | Description               |
|:---------:|:-------------:|:---------:|:-------------------------:|
| 415       | backbone      | 100       | Campus backbone           |
| 416       | buildA_f1     | 70        | Floor 1 network outlets   |
| 417       | buildA_wifi   | 100       | Wi-Fi network             |
| 418       | buildA_dmz    | 90        | DMZ VLAN                  |
| 419       | buildA_f0     | 40        | Floor 0 network outlets   |
| 420       | buildA_voip   | 35        | VoIP network              |


# IPv4 addressing

In accordance with the [sprint planning](../planning.md) the IPv4 addresses assigned
to building A and the backbone are as follows:

Address space:
- Building A: **10.168.160.0/23**
- Campus Backbone: **10.168.167.0/25**

## Distribution

### Campus Backbone
As there is no need to subdivide the backbone's network, the entire **10.168.167.0/25** range
will be used.

### Building A
Building A will have 5 VLANs, meaning we need to assign a subnetwork of the 10.168.160.0/23
block to each.

The assignment of the subnetworks was done according to the following procedure:

1. Add two to the total number of nodes of each VLAN; this is to account for the
network and broadcast addresses.
2. Round each of the results to the next power of two. (We will call this value **N**)
3. Sort the VLANs in decreasing order of **N** (VLANs with the same N are considered equivalent).
This thus establishes an ordering within the VLANs.
4. Each VLAN will end at `last_addr := initial_addr + N - 1` and will have a subnet mask
of **/X**, where `X = 32 - log_2(N)`
5. The first VLAN will start at **10.168.160.0** (beginning of the addresses chunk).
6. Every other VLAN will start at `initial_addr := last_addr_of_previous + 1`


#### Summary

| VLAN ID   | Network Address   | Subnet Mask           | Router Subinterface   |
|:----------:|:----------------:|:---------------------:|:---------------------:|
| 415       | 10.168.167.0      | 255.255.255.128 (/25) | ¯\_(ツ)_/¯            |
| 416       | 10.168.160.0      | 255.255.255.128 (/25) | FastEthernet0/0.1     |
| 417       | 10.168.160.0      | 255.255.255.128 (/25) | FastEthernet0/0.2     |
| 418       | 10.168.161.0      | 255.255.255.128 (/25) | FastEthernet0/0.3     |
| 419       | 10.168.161.0      | 255.255.255.192 (/26) | FastEthernet0/0.4     |
| 420       | 10.168.161.0      | 255.255.255.192 (/26) | FastEthernet0/0.5     |
