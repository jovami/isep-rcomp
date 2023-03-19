Building A
==========

Building A will hold the datacenter (Room A.1.4), and will also house the main cross-connect
for the structured cabling system.

# Building features

Dimensions: 20 x 20 meters

Two floors:
1. Floor 0:
    - Underground cable raceway
    - Ceiling height: 4 meters
2. Floor 1:
    - Dropped ceiling 2.5 meters from the ground
    - Ceiling height: 3 meters (2.5 effective)


# Network outlets

Taking into account the standard of 2 network outlets per 10 squared meters,
the number of outlets for each room was computed using [this Haskell source](./Outlets.hs).

It was further decided, for convenience of use, that the outlets would stay
1 meter above the floor level.

## Floor 0

![floor blueprint](./floor0.png)

A single 25m range (radius) access point was chosen since it is more than enough
to cover the whole floor. In order to connect the AP, a cable will be passed through
a wall in Room A.0.3, which will then extend towards the ceiling and connect to a
double outlet.

Additionally, the AP will reside on the rightmost part of the entrance hall
(i.e. next to rooms A.0.3 and A.0.4) in order to stay closer to areas with a
higher density of people.

### Outlets

| Room  | Width (m) | Length (m)    | No. Outlets   |
|:-----:|:---------:|:-------------:|:-------------:|
| A.0.1 | 5.00      | 5.27          | 5             |
| A.0.2 | 3.64      | 5.00          | 4             |
| A.0.3 | 4.73      | 5.00          | 5             |
| A.0.4 | 5.04      | 7.25          | 7             |
| A.0.5 | 4.46      | 5.85          | 5             |
| A.0.6 | 5.85      | 7.23          | 8             |

**Total Outlets**: 34 + 1 for access point

## Floor 1

![floor blueprint](./floor1.png)

<!--TODO: same idea as floor 0 -->

### Outlets

| Room  | Width (m) | Length (m)    | No. Outlets   |
|:-----:|:---------:|:-------------:|:-------------:|
| A.1.1 | 3.62      | 7.21          | 5             |
| A.1.2 | 3.62      | 7.21          | 5             |
| A.1.3 | 3.62      | 7.21          | 5             |
| A.1.4 | 7.21      | 7.79          | 11            |
| A.1.5 | 4.44      | 5.54          | 5             |
| A.1.6 | 5.83      | 7.21          | 8             |
| A.1.7 | 4.71      | 5.85          | 6             |

**Total Outlets**: 45 + 1 for access point


# Cross-connects

## Floor 0

<!-- TODO: IC -->

## Floor 1

<!-- TODO: MC -->


# Inventory

## Floor 0

| Item                  | Ammount   | Price (€/per unit)    |
|:----------------------|:---------:|:---------------------:|
| Cabinet 24U           | 1         | 799.83€               |
| Patch Panel 48 ports  | 2         | 69.00€                |
| Switch 48 ports       | 2         | 661.77€               |
| Patch Panel 24 ports  | 1         | 27.50€                |
| Switch 24 ports       | 1         | 314.97€               |
| Double Outlets        | 35        | 11.30€                |
| Access Point          | 1         | 80.36€                |
| Copper Cable          | 591.65m   | 0.83€                 |
| Fiber Cable           | 10.52m    | 2.87€                 |
| Cable Raceways        | 95.53m    | 14.92€                |

**Total price**: 5026.27€

## Floor 1

| Item                  | Ammount   | Price (€/per unit)    |
|:----------------------|:---------:|:---------------------:|
| 1 Cabinet 24U         | 1         | 799.83€               |
| 2 Patch Panel 48 ports| 2         | 69.00€                |
| 2 Switch 48 ports     | 2         | 661.77€               |
| 1 Patch Panel 24 ports| 1         | 27.50€                |
| 1 Switch 24 ports     | 1         | 314.97€               |
| 46 Double Outlets     | 46        | 11.30€                |
| 1 Access Point        | 1         | 80.36€                |
| 978.43m Copper Cable  | 978.43m   | 0.83€                 |
| 2.96m Fiber cable     | 2.96m     | 2.87€                 |
| 85.62m Cable Raceways | 85.62m    | 14.92€                |

**Total price**: 5302.04€

## Campus

| Item          | Ammount   | Price (€/per unit)    |
|:-------------:|:---------:|:---------------------:|
| Fiber cable   | 590.46m   | 2.87€                 |

**Total price**: 1694.62€

## Total

**Total Price for Building A:** 12022.93€
