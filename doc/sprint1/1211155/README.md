Building C
==========

# Building features

Building C is a two-story building with a total area of **1800 square meters ((30 x 30 meters) multiplied by 2 floors)**. The ground floor (Floor 0) features an **underfloor cable raceway that is connected to an external ditch**, while the first floor (Floor 1) has a **dropped ceiling that is 2.5 meters from the ground**, providing approximately 0.5 meters of space that can be used to install cable raceways and wireless access points. The ceiling height of Floor 0 is **4 meters**, and the effective ceiling height of Floor 1 is **2.5 meters**.

The building has two storage areas: **Room C.0.14 and Room C.1.8**. Both rooms can be used to house cross-connects for the structured cabling system. In addition, Room C.1.8 can also store other network infrastructure hardware.

# Floor 0

Structured cabling standards specifies a minimum of **two outlets per work area**, and also a ratio of **two outlets for each 10 square meters of area**. That ratio will be maintained throughout the project.

![floor 0](./Floor%200.jpg)

## Outlets and Measurements

There are a few business rules to point out regarding the **outlet placement**:

* Room C.0.14 is a storage area that may be used to house a cross-connect, no network outlets are required there, and the same applies to restrooms, halls, and corridors.

* Rooms C.0.1, C.0.2, and C.0.3 have specific purposes and the only network outlets necessary are two near each floor cable passageway

| Room          | Width (m) | Length (m) | Area (m) | No. Outlets |
|:-------------:|:---------:|:----------:|:--------:|:-----------:|
| C.0.1         | 9.00      | 8.00       | 72.00    | 8           |
| C.0.2         | 9.00      | 8.00       | 72.00    | 6           |
| C.0.3         | 11.60     | 8.00       | 92.80    | 10          |
| C.0.4         | 8.00      | 7.00       | 56.00    | 12          |
| C.0.5         | 7.00      | 3.40       | 23.80    | 6           |
| C.0.6         | 7.00      | 3.40       | 23.80    | 6           |
| C.0.7         | 7.00      | 3.40       | 23.80    | 6           |
| C.0.8         | 7.00      | 3.40       | 23.80    | 6           |
| C.0.9         | 7.00      | 3.40       | 23.80    | 6           |
| C.0.10        | 7.00      | 3.40       | 23.80    | 6           |
| C.0.11        | 7.00      | 3.40       | 23.80    | 6           |
| C.0.12        | 7.00      | 3.40       | 23.80    | 6           |
| C.0.13        | 7.00      | 3.40       | 23.80    | 6           |
| C.0.14        | 3.00      | 2.60       | 7.80     | 0           |
| C.0.15        | 3.00      | 4.00       | 12.00    | 4           |
| Access Point  | --------- | ---------  | -------  | 2           |

Note that all measurements were taken on paper using a scale of 2.5 centimeters to represent 5 meters in real life.

**Total outlets: 96 (48 double outlets)**

## Access Points

Given the floor's dimensions of **30 x 30 meters**, an access point with a radius of coverage of approximately 25 meters is deemed adequate for the space. Therefore, a single access point is expected to provide sufficient coverage for the entirety of the floor. Two cables go from the ground to the wall and then to the ceiling, then they connect to a double outlet that has the purpose of serving the AP.

The following image will depict the coverage radius of the access point in question:

![floor 0 - ac](./Floor%200%20-%20Access%20point%20coverage.jpg)

## IC Cross-connect

* To ensure proper infrastructure for the IC, a 24U rack cabinet will be utilized, consisting of two patch panels with 48 ports each and one with 24 ports, along with two switches with 48 ports each and one with 24 ports.

* It is essential to have 1U of space between each patch panel or switch to maintain optimal functionality.

* The use of a 24U rack is recommended as it allows for an **additional 50% of free space**, enabling any necessary upgrades in the future.

| Equipment              | U size |
|:----------------------:|:------:|
| Patch panel (48 ports) | 1U     |
| Cable management       | 1U     |
| Patch panel (48 ports) | 1U     |
| Cable management       | 1U     |
| Patch panel (24 ports) | 1U     |
| Cable management       | 1U     |
| Switch (48 ports)      | 1U     |
| Cable management       | 1U     |
| Switch (48 ports)      | 1U     |
| Cable management       | 1U     |
| Switch (24 ports)      | 1U     |
| Cable management       | 1U     |
| Expansion Gap          | 12U    |

## Inventory

|        Material                  | Price (€) |
| :--------------------:           | :-------: |
|     1 Cabinet 24U                |  799,83   |
|   48 Double outlets              |  542,4,9  |
| 2 Patch Panel 48 Ports           |  138,00   |
|   2 Switch 48 Ports              |  1323,54  |
| 1 Patch Panel 24 Ports           |   27,50   |
|   1 Switch 24 Ports              |  314,97   |
| 3755m of Copper Cables           |  3116,65  |
|  63,6m of Fiber Cables (8 cores) |   182,53  |
| 60m of Cable Raceways            |   895,2   |
|     1 Access Point               |   80,36   |

**Total price for floor 0:** 7420,98€

# Floor 1

In order to facilitate the installation of cables in a dropped ceiling, a cable raceway is employed to guide their path. It is customary for any cable that descends from the ceiling to maintain a **minimum distance of one meter from the floor**. As indicated in the diagram, each instance of the **small red circle** corresponds to a cable length of approximately 1.5 meters, accounting for the distance between the ceiling and the floor.

![floor 1](./Floor%201.jpg)

## Outlets and Measurements

Similarly to Floor 0, there are a few business rules to point out regarding outlet placement:

* Room C.1.8 is a storage area that may be used to house network infrastructure hardware, so the number of network outlets is variable and depends on the hardware to be installed. For the first sprint, no outlets will be installed yet.
  
* Restrooms, halls, and corridors do not require network outlets.

| Room          | Width (m) | Length (m) | Area (m) | No. Outlets |
|:-------------:|:---------:|:----------:|:--------:|:-----------:|
| C.1.1         | 5.60      | 8.20       | 45.92    | 10          |
| C.1.2         | 5.60      | 3.40       | 19.04    | 4           |
| C.1.3         | 5.60      | 3.40       | 19.04    | 4           |
| C.1.4         | 5.60      | 3.40       | 19.04    | 4           |
| C.1.5         | 5.60      | 3.40       | 19.04    | 4           |
| C.1.6         | 5.60      | 3.40       | 19.04    | 4           |
| C.1.7         | 5.60      | 3.40       | 19.04    | 4           |
| C.1.8         | 7.50      | 2.40       | 18.00    | 0           |
| C.1.9         | 5.60      | 3.40       | 19.04    | 4           |
| C.1.10        | 5.60      | 3.40       | 19.04    | 4           |
| C.1.11        | 5.60      | 3.40       | 19.04    | 4           |
| C.1.12        | 5.60      | 3.40       | 19.04    | 4           |
| C.1.13        | 5.60      | 3.40       | 19.04    | 4           |
| C.1.14        | 5.60      | 3.40       | 19.04    | 4           |
| C.1.15        | 5.60      | 3.40       | 19.04    | 4           |
| C.1.16        | 5.60      | 3.40       | 19.04    | 4           |
| C.1.17        | 5.60      | 3.40       | 19.04    | 4           |
| C.1.18        | 5.60      | 3.40       | 19.04    | 4           |
| C.1.19        | 5.60      | 3.40       | 19.04    | 4           |
| C.1.20        | 5.60      | 3.40       | 19.04    | 4           |
| Access Point  | --------- | ---------  | -------  | 2           |

Note that all measurements were taken on paper using a scale of 2.9 centimeters to represent 5 meters in real life.

**Total outlets: 84 (corresponds to 42 double outlets)**

## Access Points

Floor 1 also has dimensions of **30 x 30 meters** and a single access point featuring a coverage radius of roughly 25 meters can effectively cater to the connectivity needs of the floor. The access point is connected to a double outlet via two cables that run from the dropped ceiling to the outlet, with no need for additional wiring through the walls. The coverage radius of the access point can be seen in the accompanying image.

![floor 1 - ac](./Floor%201%20-%20Access%20point%20coverage.jpg)

## HC Cross-connect

* The planned HC will feature a 24U rack cabinet, equipped with two patch panels boasting 48 ports each, as well as another panel with 24 ports. The switch setup will similarly comprise two 48-port switches and an additional 24-port switch.
  
* Importantly, a single rack unit (1U) of space is required between adjacent patch panels or switches.

* To allow for possible future expansion, a 24U rack is deemed necessary, as this provides an **additional 50% of free space beyond the current requirement**s.

| Equipment              | U size |
|:----------------------:|:------:|
| Patch panel (48 ports) | 1U     |
| Cable management       | 1U     |
| Patch panel (48 ports) | 1U     |
| Cable management       | 1U     |
| Patch panel (24 ports) | 1U     |
| Cable management       | 1U     |
| Switch (48 ports)      | 1U     |
| Cable management       | 1U     |
| Switch (48 ports)      | 1U     |
| Cable management       | 1U     |
| Switch (24 ports)      | 1U     |
| Cable management       | 1U     |
| Expansion Gap          | 12U    |

## Inventory

|        Material        | Price (€) |
| :--------------------: | :-------: |
|     1 Cabinet 24U      |  799,83   |
|   42 Double outlets    |   476,6   |
| 2 Patch Panel 48 Ports |  138,00   |
|   2 Switch 48 Ports    |  1323,54  |
| 1 Patch Panel 24 Ports |   27,50   |
|   1 Switch 24 Ports    |  314,97   |
| 2974m of Copper Cables |  2468,36  |
| 266m of Cable Raceways |  3968,72  |
|     1 Access Point     |   80,36   |

**Total price for floor 1:** 9597,88€

# Total price for Building C

|        Floors          | Price (€) |
| :--------------------: | :-------: |
|        Floor 0         | 7420,98   |
|        Floor 1         | 9597,88   |

**Total price for building C:** 17018,86€
