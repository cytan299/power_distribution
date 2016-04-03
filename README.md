# Power Distribution Unit For Astrophotography

by C.Y. Tan 2016

![Power Distribution Unit](https://github.com/cytan299/power_distribution/blob/master/power_distribution/pics/power_distribution.png)

I got really annoyed with the number of power bricks (or wall-warts)
that were required power:

* **LX200** 15V power supply. I reduced the voltage from 18V to 15V.
* **SBIG ST8300C** 12 power supply.
* **Field DeRotator** 9V power supply.
* **Dew Heater** 5V power supply.
* **Flat field box** 9V power supply.

I decided to consolidate the above into one box but with enough spare
outlets for future expansion.

## Goal

The goal is to build a power distribution unit that replaces all the
wall-warts that are necessary for running my astrophotography
setup. It should have extra outlets so that it can be used to power
other pieces of equipment in the future. All the outlets have to be
fused to protect itself as well as the connected equipment.

## Design

The power distribution unit is powered by a

* External 240W 19.5V slim PA-9E PC supply.

The 19.5V from the above supply is connected to an internal
PLEX 165W ATX DC power supply. The 5V and 12V supplies come directly from
the PLEX. The other 9V is linearly regulated from the 12V and the 15V
is linearly regulated from the 19.5V input voltage. The available voltage
outlets are listed below:

* Three 5V outlets
* Three 12V outlets
* Two 9 V outlets
* One 15 V outlet

## Support

This is unsupported hardware. Build at your own peril! :)

You can submit questions or bug reports using the
[issues](https://github.com/cytan299/power_distribution/issues) tab on
the right and then click on **NEW**.

Have fun!

## Directory structure

* **case** The case design for the power distribution unit. It
  consists of a 3D STL file for the box and a SVG file for the
  cover. Source code for generating the 3D STL file in OpenScad format
  is included.
* **bom** Bill of materials for 1 power distribution unit.
* **eagle** Eagle schematic and board files.

## Other information

More information can be found in he *README.md* files in each
directory and the [wiki](https://github.com/cytan299/power_distribution/wiki/Power-Distribution-Unit) of this project on github.

## Copyright
All the software, documentation, and hardware that I have written is
copyright 2016 C.Y. Tan.

All software is released under GPLv3

All documentation is released under Creative Commons
Attribution-ShareAlike 3.0 Unported License or GNU Free
Documentation License, Version 1.3

All hardware is released under CERN Hardware Open License v1.2



