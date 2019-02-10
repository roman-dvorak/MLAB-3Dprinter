use <extruder_fan.scad>
use <gregs-wade-625.scad>
use <extruder-idler.scad>
use <j-head-mount.scad>
use <extruder_model.scad>
use <heatbreak_box.scad>

use <../x-carriage.scad>
use <../x-carriage-back.scad>

translate([-6, 14, 0])
    rotate([90, 0, 0])
        wade();

//translate([-14, -12, 28])
//    rotate([90, 0, 90])
//        idler();

color("green")
translate([19,-17, -25-2])
    rotate([-90, 180, 180])
        x_carriage();


/* color("green")
translate([-14, -43.4, -25])
    rotate([-90, 180, 0])
        x_carriage_back(); */

color("red")
translate([30,-10,-5])
    rotate([0, 180, 0])
        jhead();

translate([0,-30,22-2])
    rotate([0, 90, 0])
        cylinder(h=24, d=15);

translate([0, 0, -1])
    rotate([0, 0, 90])
    superextruder();

translate([0.5,-17,-61])
    rotate([90, 0, 0])
        fan_part();

// fan
color("gray")
    translate([40,-17,-55])
        cube([20, 40, 40]);

// motor
color("gray")
    translate([19,-39,39])
        cube([43, 43, 40]);

//extruder_fan();
