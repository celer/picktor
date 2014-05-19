Introduction
============

Picktor is a 3D printable pick and place head for surface mount electronics components. 

It mounts on a 3D printer and uses a needle and vacuum pump to pick up small components and place them on a circuit board. 

To keep things simple the included software assumes you've taped/attached one or more circuit boards and bits of 
component tape to your print bed, and then told the software where your circuit boards and component tapes are. 

You can see it work here:

[![Video of it working](http://img.youtube.com/vi/OV2Zr3X-EQc/0.jpg)](http://www.youtube.com/watch?v=OV2Zr3X-EQc)


*While I've tested this and it seems to work for me consider it a proof of concept, it may not work for you, it may break your printer, it may ruin your circuit boards...*

Building the Picktor PNP Head
=============================

First you'll need to print out each of the components in the /model directory

Modifying the 3D model
======================

Modify the model/picktor.scad, and run Make

Building the Picktor PNP Head
=============================

Here is what you'll need

![Parts] (https://raw.githubusercontent.com/celer/picktor/master/images/parts.jpg)

 # A 3D printer
 # All the parts in the model directory printed out
 # 4x M3 x 40MM Cap screws [1]
 # 7x 623ZZ Bearings [2]
 # 11x M3 nuts [3]
 # 7x M3 flat washers [3]
 # 7x M3 lock washers [3]
 # 3x M3 x 10MM hex head screws [3]
 # 4x M3 x 10MM cap head screws [1]
 # 3x M3 x 8MM cap screws [1]
 # 4x M3 x 30MM cap screws [1]
 # 2x M4 x 5MM set screws 
 # 1x 1/16 x 5/32 x 9/32 o-ring [4]
 # 6.5mm x 10mm spring [5]
 # 1/4 Brass insert from the Watts A-4 961 P plumbing kit [6]
 # 12v Vacuum Pump [7]
 # 18guage dispensing needle 
 # 1/4 ID nylon hose 
 # white lithium grease


### Where to get stuff

[1] http://www.ebay.com/itm/M3-0-50-X-6MM-THRU-30MM-STAINLESS-STEEL-METRIC-SOCKET-HEAD-C-S-ASSORTMENT-/291147199149?
[2] http://www.amazon.com/Bearing-Shielded-Miniature-Bearings-VXB/dp/B002BBF3JO/ref=sr_1_1?ie=UTF8&qid=1400472770&sr=8-1&keywords=623zz
[3] http://www.ebay.com/itm/M3-0-50-X-6MM-THRU-20MM-STAINLESS-STEEL-HEX-HEAD-CAP-SCREW-BOLT-ASSORTMENT-/291140653858?
[4] http://www.harborfreight.com/382-piece-o-ring-assortment-67554.html
[5] http://www.amazon.com/Tradespro-835798-Spring-Assortment-200-Piece/dp/B003L0LEJM/ref=sr_1_1?s=hi&ie=UTF8&qid=1400472954&sr=1-1&keywords=835798
[6] http://www.homedepot.com/p/Watts-1-4-in-Brass-Compression-Nut-with-Insert-A-4/100638289
[7] http://www.ebay.com/itm/DC12V-DC-micro-vacuum-pump-Pumping-air-pump-30Kpa-Air-sampling-/191113084674?ssPageName=ADME:L:OC:US:3160


## Optional Items
 
  # 1 USB camera

For mounting to the printer

  # 4x M6x16 cap head screws
  # 4x M6 nuts

Things you might have from your existing printer

  # NEMA 17 stepper motor

## Assembling the top mount

Put an M3 nut in the recessed part of the top mount. In order place a lock washer, 623ZZ bearing 
and flat washer on an M3x10 hex head bolt. Then screw the M3 bolt into the recessed nut. 

## Assemble the stepper gear

Insert the two M4 x 5MM set screws into the stepper gear. You may need an M4 tap to properly thread
the set screws into the gear. 

## Place the top mount on the stepper

Place the top mount on the stepper motor, so that the recessed nut is pressed against the stepper
motor. (It may require some pressure to put the top mount on the stepper motor. 
 
## Place the stepper gear on the stepper motor

Place the stepper gear on the stepper motor shaft, but do not tighten the set screws yet. 

## Assemble the bottom mount

Insert two M3 nuts into the recessed cut outs on the bottom of the mount. Assemble two sets of screws and bearings. 

Place a lock washer, bearing and flat washer on an M3 x 10MM cap screw and screw them into the recessed nuts on the mount.

## Put the top and bottom mount together

Place the bottom mount on the top mount and screw them togther using the 4 M3 X 40MM screws. 

## Assemble the front mount

Place 4 M3 nuts on the recessed cut outs.

Assemble 4 sets of M3 x 10mm bolts (two hex head and two cap screw) with washers and bearings. 

Utilize the 2 hex head bolts on the top part of the front mount (it has a larger diameter circle cut out of it)

Utilize the 2 cap screws on the bottom part of the front mount. 

## Prepare the tool gear

File and sand the surfaces of the tool gear that contact the bearings. 

Insert the 17 gauge need into the center of the tool gear (you may need to drill out the hole
in the tool gear). Using white lithium grease grease the o-ring and press it on top of the 17 gauge
needle. The o-ring must press on the top of the needle opening (the pink part). Apply grease to the
top of the o-ring.

Using a marker, mark the top of the tool gear on one of the lines. 

## Place the tool gear between the front mount and mounts attached to the stepper motor. 

Place the tool gear between the front mount and mounts attached to the stepper motor. 
Adjust the stepper gear so that the teeth on the stepper gear align with the teeth on the tool gear - tighten the set screws. 

Check to make sure that the tool gear spins freely, if not check for clearences against the various bolt heads, uneven surfaces
on the tool gear and lastly that all the bearings spin freely. 

## Attach the front mount to the other mounts

Place the 4 M3 nuts into the recessed cut outs on the front of the bottom mount. 

Using the 4 M3 x 30 MM screws attach the front mount to the bottom mount. 

## Assemble the air house mount

Place the spring on top of the brass insert, and then insert into the printed air hose mount. Attach the air house mount to the top of the top mount using 2 M3x8MM cap head screws. The brass insert
should press against the top of the o-ring in the tool gear. 

## Assemble the pump mount

Thread an M3 X 8mm screw into one of the holes on the side of the air pump mount. 

Insert the vacuum pump into the vacuum pump mount. Place the vacuum pump mount on top of the stepper motor, and cut an appropriate length of 1/4 nylon hose to fit between the pump and
air hose mount. 

Using it
========

 *There is no warranty, use this at your own risk*
 
## Attach the picktor head to your 3D printer

In the model/picktor.scad file there is a function mount\_ordbot which generates the appropriate
mount setup for the ordbot, create a new function which is appropriate for your printer. 

## Wire up the stepper motor to where your extruder was

If you used the same stepper motor which powered your extruder, then simply hook it back up. 

## Attach the vacuum pump to one of the power supplies (I used the power supply which was running the fan for my extruder)

You'll need some way to to turn on and off the vacuum pump. On my printer I'm using the same pins that were used to power
the cooling fan for the extruder. In my case it is PIN 4 and I use the gcode command 'M42 P4 S255' to turn on and off the vacuum pump. 

Both Marlin and Sprinter firmware don't buffer the M42 command, so you will need to modify your firmware to call st\_synchronize(); immediately after
the M42 command is recieved.

In sprinter, this functionality can be enabled by enabling the macro CHAIN\_OF\_COMMAND

https://github.com/kliment/Sprinter/blob/master/Sprinter/Sprinter.pde#L1446

In Marlin you'll need to add the line st\_synchronize()

https://github.com/ErikZalm/Marlin/blob/Marlin_v1/Marlin/Marlin_main.cpp#L1798

It should look like this after your modification:

```c
    case 42: //M42 -Change pin status via gcode
      if (code_seen('S'))
      {
        int pin_status = code_value();
        int pin_number = LED_PIN;

        st_synchronize();

      //...
```

## Level our printer bed so that it just barely touches the placer needle

The included software in /src is designed to utilize a needle which almost touches the print bed. 

## Configure the software

To run the included software you'll need Python 2.7 and to create an appropriate configuration file. 

So the software makes some assumptions, it assumes that you've taped your circuit board(s) to the print bed, along with some 
component tapes. And that you've put some basic reference information in the config.yml.

## Tape the circuit board to your printer bed

Tape one or more circuit boards to your print bed. And in the config.yml specify the location of a single component 
on the board. Once you run the software it will tell you where it expects the second reference to be on your print bed. 

## Tape the component tapes to your printer bed

Tape one or more tapes of componets to your print bed. Specify in the config software where the first component is 
on the print bed. Once you run the software it will tel you where it expects the last component to be on the print bed.

## Print! 

Do a few test prints before you assume all is good!

## Adjust any out of place components  
