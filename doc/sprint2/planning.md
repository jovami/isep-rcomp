RCOMP 2022-2023 Project - Sprint 2 planning
===========================================

### Sprint master: 1210957 ###
(This file is to be created/edited by the sprint master only)

# 1. Sprint's backlog #

> T.2.1 Development of a layer two and layer three Packet Tracer simulation for building A, encompassing the campus backbone.
        Integration of every member’s Packet Tracer simulation into a single simulation.

> T.2.2 Development of a layer two and layer three Packet Tracer simulation for building B, encompassing the campus backbone.

> T.2.3 Development of a layer two and layer three Packet Tracer simulation for building C, encompassing the campus backbone.

> T.2.4 Development of a layer two and layer three Packet Tracer simulation for building D, encompassing the campus backbone.

> T.2.5 Development of a layer two and layer three Packet Tracer simulation for building E, encompassing the campus backbone.

# 2. Technical decisions and coordination #

* Packet Tracer version: 8.2.0.
* SWITCH : 2960 or PT-switch.
* Cable types: copper or fiber.
* Redundancy: link aggregation between cross-connects according to previous sprint.
* End devices: 

          - A workstation (PC) connected to the VLAN for end-user outlets on the ground floor.

          - A workstation (PC) connected to the VLAN for end-user outlets on the floor one.

          - A Wireless laptop, associated with a wireless access-point (not a wireless router) connected to
            the VLAN of the Wi-Fi network of the building(access point).

          - A server connected to the DMZ VLAN of the building.

          - A VoIP phone connected to the VoIP VLAN of the building(model 7960).

* Static Routing: 2811 router model.

## 2.1. VLANs and VTP

* The VTP Domain name to be used is rc23ddg1.

* The VLANID range to be used(415 - 445) :

| **VLANIDs** | **VLAN Names** | **Necessary IPv4 Nodes** |
|:-----------:|:--------------:|:------------------------:|
|     415     |    backbone    |           100            |
|     416     |      A_f1      |            70            |
|     417     |     A_wifi     |           100            |
|     418     |     A_dmz      |            90            |
|     419     |      A_f0      |            40            |
|     420     |     A_voip     |            35            |
|     421     |     B_wifi     |           110            |
|     422     |      B_f1      |            60            |
|     423     |      B_f0      |            25            |
|     424     |     B_dmz      |            10            |
|     425     |     B_voip     |            13            |
|     426     |      C_f0      |            40            |
|     427     |      C_f1      |            50            |
|     428     |     C_wifi     |            55            |
|     429     |     C_dmz      |            20            |
|     430     |     C_voip     |            25            |
|     431     |     D_wifi     |            80            |
|     432     |      D_f1      |            60            |
|     433     |      D_f0      |            25            |
|     434     |     D_dmz      |            10            |
|     435     |     D_voip     |            13            |
|     436     |      E_f0      |            45            |
|     437     |      E_f1      |            60            |
|     438     |     E_wifi     |            70            |
|     439     |     E_dmz      |            20            |
|     440     |     E_voip     |            25            |

* VLANIDs 441 - 445 unused.

## 2.2. WIFI channels

| **Building** | **WIFI Names** |
|:------------:|:--------------:|
|      A       |   A_NETWORK    |
|      B       |   B_NETWORK    |
|      C       |   C_NETWORK    |
|      D       |   D_NETWORK    |
|      E       |   E_NETWORK    |

## 2.3. Devices naming(naming rules)

* Whenever we add a new device, the following rules were used:
      
      1º-Letter for the building (A,B,C,D,E).
      2º-Device type (SW, RT, PC(computers), LP(laptops)).
      3º-Function (CP, MC, IC, HC).
      4º-Floor (0,1).
      5º-Number.

  Example: E_SW_IC_0_1

## 3. IPV4 block addresses distribution

### 3.1 Required block address sizes for each building

  *Formula: (number of nodes + 2) rounded up to the next power of 2.*

* Inside each tuple the notation X -> Y represent :
    * X - nodes used.
    * Y - block address size.

| Location  |  0 floor  |  1 floor   |    WI-FI    |    DMZ     |   VOIP    |                 Required                 |                      Provided                       |
|:---------:|:---------:|:----------:|:-----------:|:----------:|:---------:|:----------------------------------------:|:---------------------------------------------------:|
|     A     | 40 -> 64  | 70 -> 128  | 100 -> 128  | 90 -> 128  | 35 -> 64  | Total: 640<br> A: 512 <br> BACKBONE: 128 | Total: 1024 /22<br>A: 1024 /23<br>BACKBONE: 128 /25 |
|     B     | 25 -> 32  |  60 -> 64  | 110 -> 128  |  10 -> 16  | 35 -> 16  |                   256                    |                       256 /24                       |
|     C     | 40 -> 64  |  50 -> 64  |  55 -> 64   |  20 -> 32  | 25 -> 32  |                   256                    |                       256 /24                       |
|     D     | 25 -> 32  |  60 -> 64  |  80 -> 128  |  10 -> 16  | 13 -> 16  |                   256                    |                       256 /24                       |
|     E     | 45 -> 64  |  60 -> 64  |  70 -> 128  |  20 -> 32  | 25 -> 32  |                   320                    |                       512 /23                       |



### 3.2 IPV4 block addresses
      Provided Address Block: 10.80.160.0/21

|   Network   |               Range                |
|:-----------:|:----------------------------------:|
|      A      | 10.80.160.0/23 - 10.80.161.255/23  |
|      E      | 10.80.162.0/23 - 10.80.163.255/23  |
|      B      | 10.80.164.0/24 - 10.80.164.255/24  |
|      C      | 10.80.165.0/24 - 10.80.165.255/24  |
|      D      | 10.80.166.0/24 - 10.80.166.255/24  |
|  Backbone   | 10.80.167.0/25 - 10.80.167.127/25  |


**The following diagram represents the network adresses layout between buildings:**

          23-160(A)
          |
      22-160
      |   |
      |  23-162(E)
    21-160
      |       24-164(B)
      |       |
      |   23-164
      |   |   |
      |   |   24-165(C)
      22-164 
          |   24-166(D)
          |   | 
          23-166
              |   25- 167.0
              |   |
              24-167
                  | 
                  25- 167.127


## 4. Routing tables

| Network | Destination address | subnet-mask |  next-hop   |
|:-------:|:-------------------:|:-----------:|:-----------:|
|    A    |       0.0.0.0       |   0.0.0.0   | 10.80.167.1 |
|    B    |       0.0.0.0       |   0.0.0.0   | 10.80.167.1 |
|    C    |       0.0.0.0       |   0.0.0.0   | 10.80.167.1 |
|    D    |       0.0.0.0       |   0.0.0.0   | 10.80.167.1 |
|    E    |       0.0.0.0       |   0.0.0.0   | 10.80.167.1 |


| Network  |   Destination address    |       subnet-mask       |        next-hop        |
|:--------:|:------------------------:|:-----------------------:|:----------------------:|
|    A     |       10.80.160.0        |      255.255.254.0      |      10.80.167.2       |
|    E     |       10.80.162.0        |      255.255.254.0      |      10.80.167.6       |
|    B     |       10.80.164.0        |      255.255.255.0      |      10.80.167.3       |
|    C     |       10.80.165.0        |      255.255.255.0      |      10.80.167.4       |
|    D     |       10.80.166.0        |      255.255.255.0      |      10.80.167.5       |
| FALLBACK |         0.0.0.0          |         0.0.0.0         |     121.60.202.74      |


