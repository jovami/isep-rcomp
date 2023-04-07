RCOMP 2022-2023 Project - Sprint 2 planning
===========================================

### Sprint master: 2222222 ###
(This file is to be created/edited by the sprint master only)

# 1. Sprint's backlog #
(Copy here a summary of the provided sprint's backlog)


# 2. Technical decisions and coordination #
In this section, all technical decisions taken in the planning meeting should be mentioned. 		Most importantly, all technical decisions impacting on the subtasks implementation must be settled on this 		meeting and specified here.


#### Examples: ####
  * Backbone cable types to be used
  * VLAN IDs to be used
  * VTP domains
  * WiFi channels
  * IPv4 networks' addresses and routers' addresses
  * Routing protocols
  * Application protocols outlining (further coordination may be required between members)


# 3. Subtasks assignment #
(For each team member (sprint master included), the description of the assigned subtask in sprint 2)


## 4. IPV4 block addresses distribution

### Required block address sizes for each building

  **Formula : (nºnodes +2 ) arredondado a próxima potência de base 2**

- A
  0 floor : 40 -> 64
  1 floor : 70 -> 128
  WI-FI   : 100 -> 128
  DMZ     : 90 -> 128
  VOIP    : 35 -> 64  

  **Required: 640**
  **Provided: 1024 /22**

  Required: 512 
  Provided: 1024 /23

  **backbone:100 ->128**  
  Required: 128
  Provided: 128 /25

- B 

  0 floor : 25 -> 32
  1 floor : 60 -> 64
  WI-FI   : 110 -> 128
  DMZ     : 10 -> 16
  VOIP    : 35 -> 16

  Required: 256
  Provided: 256 /24


- C 

  0 floor : 40 -> 64
  1 floor : 50 -> 64
  WI-FI   : 55 -> 64
  DMZ     : 20 -> 32
  VOIP    : 25 -> 32

  Required: 256
  Provided: 256 /24



- D 

  0 floor : 25 -> 32
  1 floor : 60 -> 64
  WI-FI   : 80 -> 128
  DMZ     : 10 -> 16
  VOIP    : 13 -> 16

  Required: 256
  Provided: 256 /24


- E 

  0 floor : 45 -> 64
  1 floor : 60 -> 64
  WI-FI   : 70 -> 128
  DMZ     : 20 -> 32
  VOIP    : 25 -> 32

  Required: 320
  Provided: 512 /

### IPV4 block addresses
      10.80.160.0/21

A- 10.80.160.0/23 - 10.80.161.255/23

E- 10.80.162.0/23 - 10.80.163.255/23

B- 10.80.164.0/24 - 10.80.164.255/24 

C- 10.80.165.0/24 - 10.80.165.255/24 

D- 10.80.166.0/24 - 10.80.166.255/24 

Backbone- 10.80.167.0/25 - 10.80.167.127/25 



**The following diagram:**

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


#### Example: ####
  * 1181478 - Structured cable design for building A, floors 2 and 3
  * 1210951 - Structured cable design for building B, floors 0 and 1
  * 1210954 - VLAN devices configuration for building C
  * 1211155 - IPv4 addressing and routing configurations for building D
