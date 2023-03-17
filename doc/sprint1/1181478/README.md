RCOMP 2022-2023 Project - Sprint 1 - Member 1181478 folder
===========================================
(This folder is to be created/edited by the team member 1181478 only)

# Building E

# Building dimensions

Length: 30 meters

Width: 30 meters

Two floors:
1. Floor 0:
    - Underground cable raceway
    - Ceiling height : 4 meters
2. Floor 1:
    - Ceiling height: 3 meters
    - Removable dropped ceiling: 2.5 meters (So there's about 0,5 meters of space, in terms of height, to put cables).

### Number of network outlets

Structured cabling standards specifies a minimum of two outlets per work area,
and also a ratio of two outlets for each 10 square meters of area.

# Building E - Ground floor(floor 0)

![Floor Zero Photo](Building_E-Ground_floor.png)

## Outlets

- Room E.0.2 has a specific purpose and the only network outlets necessary are two near each floor cable passageway.
- Room E.0.12 no network outlets are required in this room, and the same applies to restrooms and common
  areas like the entrance hall and corridors.

|    Room     | Width (m) | Length (m) | Area(m2)   |     No. Outlets needed((area/10)*2)     | No. Outlets used       |
|:-----------:|:---------:|:----------:|------------|:---------------------------------------:|------------------------|
|    E.0.1    |    5.2    |    5.2     | 27.04      |                   5.4                   | 6                      |
|    E.0.2    |   11.25   |   11.25    | 126.56     |                ---------                | 12(6 cable passageway) |
|    E.0.3    |   3.13    |    6.67    | 20.87      |                   4.2                   | 6                      |
|    E.0.4    |   3.13    |    6.67    | 20.87      |                   4.2                   | 6                      |
|    E.0.5    |   3.13    |    6.67    | 20.87      |                   4.2                   | 6                      |
|    E.0.6    |   3.13    |    6.67    | 20.87      |                   4.2                   | 6                      |
|    E.0.7    |   3.13    |    6.67    | 20.87      |                   4.2                   | 6                      |
|    E.0.8    |   3.13    |    6.67    | 20.87      |                   4.2                   | 6                      |
|    E.0.9    |   3.13    |    6.67    | 20.87      |                   4.2                   | 6                      |
|   E.0.10    |   3.13    |    6.67    | 20.87      |                   4.2                   | 6                      |
|   E.0.11    |   3.13    |    6.67    | 20.87      |                   4.2                   | 6                      |
|   E.0.12    |   3.13    |    3.96    | 12.39      |                ---------                | ---------              |
| AccessPoint | --------- | ---------  | ---------  |                ---------                | 2                      |

#### Note1: All the measurements were made based on paper and the scale of 5 meters given(corresponding to 2.4 cm).
#### Note2: The double outlets used for the access point are not represented in this floor plan.
#### Note3: The radius of the access point is not represented in this floor.

#### Total number of outlets = 74

#### Important aspects(Consulting TP-01 available on moodle):

- Room E.0.12  is the telecommunications room, which means the horizontal cross connect(HC) and the intermediate cross connect(IC) will be placed there and there is no need for outlets here.

- The outlets were organized so that is possible to connect a PC with a 5 meter or less cable from any reasonable position on the room, using long patch cords. 
  Wherever the user equipment is, there should always be an outlet less than three meters away.(Places near doors were ignored since it's not practical to have an outlet behind a door).

- The 2 outlets per 10m2 rule was respect, in all rooms extra outlets were put to cover for an unexpected number of workers in a room.

- A double outlet was put near the access point for an easier fix in case the used cable gets damaged.

- A wireless 802.11 local area coverage is used, the access-point device will grant approximately a 50 meters diameter circle coverage. 

- .
- .
- Between ICC and HCC, copper cables will be used, since there isn't more than 90m of cable necessary between those two.

- Between ICC and MCC, it is needed the use of fiber since the distance between this is higher than the maximum 90m of the cooper cables.

- For the access point it is needed to drill a hole between Room E.0.8 and the hall.

- The router channel is the following(access point), channel 1.

- The longest cooper cable on this floor is around X meters long, not even close to the maximum 90 meter for this type of cable.

- The copper cables used were CAT6A and the fiber cables were 4 pair monomode fiber. More information on these on the planing.md.

## Inventory For Ground floor(floor 0)

|               Material | Price for a unit (€) | Price (€) |
|-----------------------:|:--------------------:|:---------:|
|         X Cabinets 24U |                      |           |
|         X Cabinets 12U |                      |           |
|             74 outlets |                      |           |
| X Patch Panel 24 Ports |                      |           |
|      X Switch 24 Ports |                      |           |
| X Patch Panel 12 Ports |                      |           |
|      X Switch 12 Ports |                      |           |
|    Xm of Copper Cables |                      |           | 
|     Xm of Fibre Cables |                      |           |
|   Xm of Cable Raceways |                      |           |
|        1 Access Points |                      |           |
|          Total floor 0 |          -           |           |


# Building E - First floor(floor 1)

![Floor One Photo](Building_E-Floor_one.png)
![Floor Passageway Photo](Building_E-Floor_one_removable_celling.png)

## Outlets

- Rooms E.1.19 and E.1.20 are storage areas that may be used to house a cross-connect and other network
  infrastructure hardware, no network outlets are required there, the same goes for restrooms, and common
  areas like halls and corridors.

|    Room     | Width (m) | Length (m) |  Area(m2)   | No. Outlets needed((area/10)*2) |  No. Outlets used  |
|:-----------:|:---------:|:----------:|:-----------:|:-------------------------------:|:------------------:|
|    E.1.1    |   7.14    |     10     |    71.4     |              14.28              |         16         |
|    E.1.2    |   3.81    |    6.19    |    23.58    |              4.72               |         6          |
|    E.1.3    |   3.81    |    6.19    |    23.58    |              4.72               |         6          |
|    E.1.4    |   4.52    |    9.52    |     43      |               8.6               |         10         |
|    E.1.5    |   3.81    |    6.67    |    25.41    |               5.1               |         6          |
|    E.1.6    |   3.81    |    6.67    |    25.41    |               5.1               |         6          |
|    E.1.7    |   3.81    |    6.67    |    25.41    |               5.1               |         6          |
|    E.1.8    |   3.81    |    6.67    |    25.41    |               5.1               |         6          |
|    E.1.9    |   3.81    |    6.67    |    25.41    |               5.1               |         6          |
|   E.1.10    |   3.81    |    6.67    |    25.41    |               5.1               |         6          |
|   E.1.11    |   3.81    |    6.19    |    23.58    |              4.72               |         6          |
|   E.1.12    |   3.81    |    6.19    |    23.58    |              4.72               |         6          |
|   E.1.13    |   3.81    |    5.71    |    21.76    |              4.35               |         6          |
|   E.1.14    |   3.81    |    5.71    |    21.76    |              4.35               |         6          |
|   E.1.15    |   3.81    |    5.71    |    21.76    |              4.35               |         6          |
|   E.1.16    |   3.81    |    5.71    |    21.76    |              4.35               |         6          |
|   E.1.17    |   3.81    |    5.71    |    21.76    |              4.35               |         6          |
|   E.1.18    |   3.81    |    5.71    |    21.76    |              4.35               |         6          |
|   E.1.19    |   1.90    |    3.33    |    6.34     |            ---------            |     ---------      |
|   E.1.20    |   1.67    |    6.43    |    10.74    |            ---------            |     ---------      |
| AccessPoint | --------- | ---------  |  ---------  |            ---------            |         2          |

#### Note1: All the measurements were made based on paper and the scale of 5 meters given(corresponding to 2.1 cm).
#### Note2: The double outlets used for the access point are not represented in this floor plan.
#### Note3: The radius of the access point is not represented in this floor.

#### Total number of outlets = 124

#### Important aspects(Consulting TP-01 available on moodle):

- Copper cable distance has in account the fact that every cable raceway has to drop from the ceiling to 1 meter of height at least,
    which means there's 1,5m of added copper cable on rooms from E.1.1 until E.1.18.
    For this, it was added 1.5 * 18 = 27m of cable and cable raceway.

- Room E.1.19 the copper cable comes through the floor cable passageway to the floor below and goes until the celling and after goes to a corner of the room,
    to pass from there to room E.1.20. Room E.1.20 will be telecommunications room which means the horizontal cross connect will be placed there
      and there is no need for outlets here. Between Floors, the IC connects to the HC in floor above through the ceiling passageway.

- It's important to note that all the cabling done on floor one is above the droppable ceiling and below the actual ceiling,
   and whenever the cables need to drop from the ceiling, a cable raceway is used.

- .

- Access point in this floor will be placed on the main hall, between Room E.1.12 and E.1.13. A hole need's to be drill in the droppable celling to
  place the access point there.

- The router channel is the following(access point), channel 6. Although nothing was specified about the materials of the building 
    to make sure the signal of the access point in floor 0 and floor 1 don't interfere with each other we choose different channels for both.

- The rules for the positioning of the outlets and access points are the same as the ones on the floor 0.
      The cooper cables used were the same and there was no need for fiber cables in this floor.

- The longest cooper cable on this floor is around X meters long, not even close to the maximum 90 meter for this type of cable.

## Inventory For First floor(floor 1)

|        Material         | Price for a unit (€) | Price (€) |
|:-----------------------:|:--------------------:|:---------:|
|     X Cabinets 24U      |                      |           |
|     X Cabinets 12U      |                      |           |
|       74 outlets        |                      |           |
| X Patch Panel 24 Ports  |                      |           |
|    X Switch 24 Ports    |                      |           |
| X Patch Panel 12 Ports  |                      |           |
|    X Switch 12 Ports    |                      |           |
|   Xm of Copper Cables   |                      |           | 
|   Xm of Fibre Cables    |          -           |     -     |
|  Xm of Cable Raceways   |                      |           |
|     1 Access Points     |                      |           |
|      Total floor 1      |          -           |           |

 
# Total Inventory

|       Material       | Quatity |
|:--------------------:|:----:|
|       Outlets        |      |
|     Cabinets 12U     |      |
|     Cabinets 24U     |      |
| Patch Panel 48 Ports |      |
| Patch Panel 24 Ports |      |
| Patch Panel 12 Ports |      |
|   Switch 48 Ports    |      |
|   Switch 24 Ports    |      |
|   Switch 12 Ports    |      |
|    Cable Raceways    |    m |
|     Fibre Cables     |    m |
|    Copper Cables     |    m |
|    Access Points     |    2 |
|     Connectors*      |      | 

**Total Cost Of Building E : €**