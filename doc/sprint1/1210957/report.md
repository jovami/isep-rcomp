# Building D

## Building Dimensions
<p></p>

**Length:** 30 meters

**Width:** 30 meters

**Height floor zero:** 4 meters

**Underfloor cable raceway:** //TODO

**Height floor one:** 2,5 meters

**Removable dropped ceiling:** 0,5 meters


**Outlets** The standard number of network outlets per area ratio is being apllied thoughtout this hole project with 2 outlets per each 10 square meters.


# Rooms

## Floor 0

![Floor 0 Squema](Building%204%20-%20Floor%20Zero.png)


## Measurements
| Room  | Length (m) | Width (m) | Area (m²) | Outlets |
|:-----:|:----------:|:---------:|:---------:|:-------:|
| D.0.1 |    8,48    |    7,42   |   62,92   |    6    |
| D.0.2 |    8,79    |    7,42   |   65,22   |    6    |
| D.0.3 |    11,36   |    7,73   |   87,81   |    10   |
| D.0.4 to D.0.14 |  6,67 | 3,33 |   22,21   |    66   |
| D.0.15 |   3,33    |    2,73   |    9,09   |    0    |
| D.0.16 |   3,33    |    3,79   |   11,09   |    0    |
| TOTAL |

## Information

The horizontal cross connect for this floor will use a 19" rack format, housing a patch panel with 48 ports with 1U size, a patch panel with 12 ports with 1U size a switch with 48 ports with 1U size and a switch with 12 ports with 1U size. Between all of these, we need about 2U of space to organize the cables. So, a cabinet with 24U will be used (4x6U).

The intermediate cross connect will use a 19" rack format, housing a patch panel with 12 ports with 1U size and a switch with 12 ports with 1U size. Between switches and patch panels we need about 1U of space to organize the cables. So, a cabinet with 12U will be used (4x3U).

- Between IC and HC, will be used 2 copper cable to make sure the if one fails we have always a backup one.

- It was chosen to place 1 Acess Point (AP) on this floor, with that and the range of 50m diameter it was possible to cover the entire floor. The AP has also been placed on the right side of the building to be closer to the areas with those needs and away from places like for example the telecomunications room.

- For the AP, a cable goes from the ground to the wall and connects to a double outlet that has the purpose of serving the AP.

## Inventory For Floor 0

|         Material         | Price for a unit (€) | Price (€) |
|:------------------------:|:--------------------:|:---------:|
|      1 Cabinet 12U       |        181,56        |  181,56   |
|      1 Cabinet 24U       |        767,70        |  767,70   |
|        46 outlets        |          7           |    322    |
|  1 Patch Panel 48 Ports  |        69,70         |   69,70   |
|    1 Switch 48 Ports     |       1105,51        |  1105,51  |
|  2 Patch Panel 12 Ports  |         9,84         |   19,68   |
|    2 Switch 12 Ports     |        279,99        |  559,98   |
| 996,1m of Copper Cables  |        1,7/m         |  1693,37  | This distance is taking in account the 0,50m between each switch and patch panel for each outlet and the distance from the floor to the AP.
|  129,6m of Fibre Cables  |         11/m         |  1425,6   |
| 110,5m of Cable Raceways |         3/m          |   331,5   | This distance is taking in accoun the fact that every raceway has to go up from the floor at least 1 meter and then cover all the cables in the room.
|     3 Access Points      |        69,90         |   209,7   |
|     3 Double Outlets     |          9           |    27     |


## Floor 1

![Floor 1 Photo](Building%204%20-%20Floor%20One.png)


## Measurements
| Room  | Length (m) | Width (m) | Area (m²) | Outlets | Copper Cable Size |
|:-----:|:----------:|:---------:|:---------:|:-------:|:-----------------:|
| 4.1.1 |     16     |     6     |    96     |   20    |       519,5       |
| 4.1.2 |    8,5     |     5     |   42,5    |   10    |       228,8       |
| 4.1.3 |     9      |    3,5    |   31,5    |    8    |        158        |
| 4.1.4 |    8,5     |     5     |   42,5    |   10    |       208,6       |
| 4.1.5 |     9      |    3,5    |   31,5    |    8    |       132,7       |
| 4.1.6 |    3,5     |    2,5    |   8,75    |    -    |        0,5        |
| 4.1.7 |     9      |     7     |    63     |   14    |       272,9       |

All the measurements were made based on the picture and the scale of 5 meters given.

### 4.1.1
* (1,6 + 5 + 7) * 5 + 1,4 + 2,9 + 4,5 + 6,2 + 7,7 = 90,7
* (1,6 + 5 + 7 + 0,9 + 0,5) * 3 + 0,5 + 1,7 + 3 = 50,2
* (1,6 + 5 + 7 + 8) * 4 + 1 + 2 + 3 + 4 = 96,4
* (1,6 + 5 + 7 + 8 + 4,2) * 9 + 1 + 2,2 + 3,6 + 4,9 + 6,3 + 7,6 + 9 + 10,5 + 4,9 = 282,2
* Total = 519,5m

### 4.1.2
* (1,6 + 5 + 5,6 + 1,2) * 2 + 1,2 = 28
* (1,6 + 5 + 5,6 + 1,2 + 1,5) * 4 + 1,8 + 3 + 4,4 + 5,8 = 74,6
* (1,6 + 5 + 5,6 + 1,2 + 1,5 + 6,4) * 2 + 1,3 + 3 = 46,9
* (1,6 + 5 + 5,6 + 1,2 + 1,5 + 6,4 + 3,4) * 3 + 1,5 + 3 + 0,7 = 79,3
* Total = 228,8m

### 4.1.3
* (1,6 + 5 + 6,5) * 5 + 1,4 + 3 + 4,5 + 6,2 + 7,2 = 87,8
* (1,6 + 5 + 6,5 + 8) * 2 + 1 + 2 = 45,2
* (1,6 + 5 + 6,5 + 8 + 2,4) + 1,5 = 25
* Total = 158m

### 4.1.4
* (1,6 + 5 + 3,3) * 3 + 4,2 + 5,7 + 7,2 = 46,8
* (1,6 + 5 + 3,3 + 7,6) * 2 + 1,3 + 2,6 = 38,9
* (1,6 + 5 + 3,3 + 7,6 + 3) * 4 + 1,4 + 2,7 + 4 + 5,1 = 95,2
* (1,6 + 5 + 3,3 + 7,6 + 3 + 6,4) + 0,8 = 27,7
* Total = 208,6m

### 4.1.5
* (1,6 + 5 + 1,5) * 6 + 2 + 3,4 + 4,6 + 6,2 + 7,7 + 5 = 77,5
* (1,6 + 5 + 1,5 + 8) * 2 + 1 + 2 = 35,2
* (1,6 + 5 + 1,5 + 8 + 2,5) + 1,4 = 20
* Total = 132,7m

### 4.1.7
* (1,6 + 5 + 1) * 5 + 2,7 + 3,9 + 5 + 6,4 + 7,6 = 63,6
* (1,6 + 5 + 1 + 8) * 3 + 1,3 + 2,6 + 4,6 = 55,3
* (1,6 + 5 + 1 + 8 + 5) * 4 + 1,5 + 2,8 + 4,3 + 5,7 = 96,7
* (1,6 + 5 + 1 + 8 + 5 + 6,8) * 2 + 0,7 + 1,8 = 57,3
* Total = 272,9m

All the measurements were made based on the picture and the scale of 5 meters given.

## Information
Total number of outlets = 70

Room 4.1.6 is the telecommunications room which means the horizontal cross connect will be placed there.

The building's total area, for each floor, is 400m² which means that only one horizontal cross connect per floor will be necessary, since one HCC covers up to 1000m².

It's important to note that all the cabling done on floor one is above the droppable ceiling and below the actual ceiling, and whenever the cables need to drop from the ceiling, a cable raceway is used.

The horizontal cross connect for this floor will use a 19" rack format, housing a two patch panels with 48 ports with 1U size, two switches with 48 ports with 1U size. We also need 1U of space between each patch panel and switch, which means 2U in total. So, a cabinet with 24U will be used (4x6U). Two copper cables per switch will be used to assure that if one fails, the other one still works.

Copper cable distance has in account the fact that every cable raceway has to drop from the ceiling to 1 meter of height at least, which means there's 1,5m of added copper cable on every single room on this floor. This means that 10,5m of copper cable will need to be added to the inventory.

From floor zero to floor one there's 4 meters of copper cable required.

For this floor, I chose to place 3 access points, with reduced range, in order to get signal for all the rooms and not exceed the limit of 30 people per access point.

For each access point, a double outlet was used to assure that if one fails, the other one still works.

Each access point was set on a different channel, one being on channel 1, another on channel 6 and another on channel 11. This was done in order to avoid interference between access points.

The access point on room 4.1.1 has a radius of 6,5m, the one on room 4.1.2 has a radius of 6,5m and the one on room 4.1.5 has a radius of 6,5m.

There's about 0,50m of copper cable between a patch panel and a switch.

All the outlets are 1 meter above the floor.

## Inventory For Floor One

|        Material         | Price for unit (€) | Price (€) |
|:-----------------------:|:------------------:|:---------:|
|       70 outlets        |         7          |    490    |
|      1 Cabinet 24U      |       767,70       |  767,70   |
| 2 Patch Panel 48 Ports  |       69,70        |   139,4   |
|    2 Switch 48 Ports    |      1105,51       |  2211,02  |
| 1584m of Copper Cables  |       1,7/m        |  2692,8   | This distance is taking in account the distance between floor zero and one, each cable going down from the ceiling, one cable going up from the HCC to the ceiling, the 0,50m of copper cable between the switches and the patch panels for each outlet and the four copper cables running from the HCC to the ICC.
| 98,4m of Cable Raceways |        3/m         |   295,2   |
|     3 Access Points     |       69,90        |   209,7   |
|    3 Double Outlets     |         9          |    27     |


# Total Inventory

|           Material           | Price (€) |
|:----------------------------:|:---------:|
|         116 outlets          |    812    |
|        1 Cabinet 12U         |  363,12   |
|        2 Cabinet 24U         |  1535,4   |
|    3 Patch Panel 48 Ports    |   209,1   |
|    2 Patch Panel 12 Ports    |   19,68   |
|      3 Switch 48 Ports       |  3316,53  |
|      2 Switch 12 Ports       |  559,98   |
|    210m of Cable Raceways    |    630    |
|     130m of Fibre Cables     |   1430    | We're buying the fibre cables by meter.
|    2600m of Copper Cables    |   4420    | We're buying the copper cables by meter.
|       6 Access Points        |   419,4   |
|       6 Double Outlets       |    54     |
| 232 ISO8877(RJ45) connectors |   46,4    |

Total Price = 13815,61€