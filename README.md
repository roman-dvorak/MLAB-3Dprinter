RebeliX
=======
RebeliX – a 3D printer inspired by constructions of Rebel II a Prusa i3. Licensed as GPLv3. Howto and list of materials is available on www.RebeliX.cz (currently only in Czech, we are working on it, help is appreciated).

![RebeliX](Rebelix_render.png "Preview of assembled printer" )


### Note about branches

 * master - almost standard version of RebeliX 3D printer with few minor changes related mainly for improving printability od printer parts. 
 * multimotor - a modified design of printer which uses symmetrical (tandem) stepper motor driving to improve backslash and mitigate dynamical distortion of construction. 

Build
=====

    sudo pip install stlsort


To continue OpenSCAD has to be installed and available as `openscad` command.

1. Make necessary changes to configuration.scad according to printer that prints the parts and available hardware. 
* Generate a calibration object by `make calibration`.
* Print generated calibration.stl and repeat the steps if unhappy.

When satisfied, run `make clean && make all`. That produces STLs with your tweeks.

