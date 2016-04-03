# Power Distribution Unit For Astrophotography

by C.Y. Tan 2016

![Power Distribution Unit](https://github.com/cytan299/power_distribution/blob/master/pics/IMG_2708.jpg)

I got really annoyed with the number of power bricks (or wall-warts)
that were required power my astrophotography setup:

* **LX200** 18V power supply. 
* **SBIG ST8300C** 12V power supply.
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

* [External 240W 19.5V slim PA-9E PC supply](http://www.amazon.com/Original-PA-9E-Replacement-adapter-Notebook/dp/B00AVMYMUG?ie=UTF8&psc=1&redirect=true&ref_=oh_aui_detailpage_o02_s00).

![Plex](https://github.com/cytan299/power_distribution/blob/master/pics/IMG_2711.jpg)

The 19.5V from the above supply is connected to an internal fanless
[HDPLEX 160W ATX DC power supply](http://www.amazon.com/HDPLEX-DC-ATX-Power-Supply-16V-24V/dp/B00KVWHUXW?ie=UTF8&psc=1&redirect=true&ref_=oh_aui_detailpage_o03_s00). The 5V and 12V supplies come directly from
the PLEX. The other 9V is linearly regulated from the 12V and the 15V
is linearly regulated from the 19.5V input voltage. The available voltage
outlets are listed below:

* Three 5V outlets
* Three 12V outlets
* Two 9 V outlets
* One 15 V outlet. I used this to power my LX200 classic. Although the
  front panel says that the voltage should be 18V, sources on the [web](http://www.skymtn.com/mapug-astronomy/MAPUG/Battery1.htm#anchor318436)
  recommend that a lower voltage be used to power it. Therefore I have
  reduced the voltage from 18V to 15V. Note: I was really shocked to
  measure >20V coming out from the Meade power supply for my LX200!

## Support

This is unsupported hardware. Build at your own peril! :)

You can submit questions or bug reports using the
[issues](https://github.com/cytan299/power_distribution/issues) tab on
the right and then click on **NEW**.

Have fun!

## Directory structure

* **case** The case design for the power distribution unit. It
  consists of a 3D STL file for the box and a SVG file for the
  cover. Source code for generating the 3D STL file in [OpenScad](http://www.openscad.org) format
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



