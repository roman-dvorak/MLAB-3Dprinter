
// PRUSA iteration3
// x carriage
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <../configuration.scad>
use <inc/bearing.scad>
x_rod_distance = 45;
fix_teeth_count = 6.8; // Pokud je zde cele cislo je na konci "hrebene" takovy zvlastni artefakt

module x_carriage_base(){
 // Small bearing holder
 hull(){
     translate([-33/2,+2,0]) rotate([0,0,90]) horizontal_bearing_base(2);
     translate([-36,20,0]) cube([39,16,12]);
 }
 hull(){
     // Long bearing holder
     translate([-33/2,x_rod_distance+2,0]) rotate([0,0,90]) horizontal_bearing_base(2);
     // Belt holder base
     translate([-36,20,0]) cube([39,16,12]);
 }
 // Base plate
 translate([-41-5,-11.5-6,0]) cube([49+10,68+6+6+3, 12]);
 //translate([-41-5,-11.5-6,0]) cube([15,68+6+6+3, 12]);
 //translate([-1.5,-11.5-6,0]) cube([15,68+6+6+3, 12]);
}

module x_carriage_beltcut(){
    tooth_size = belt_tooth_ratio*belt_tooth_distance;
    echo(tooth_size);
    // Cut clearing space for the belt
    translate([-50,10,7]) cube([70,10,15]);
    // Belt slit
    translate([-50,31.5,6]) cube([67,0.7,15]);
    // left belt slit inlet
    translate([-46,29.5,6]) cube([10,3,15]);
    // right belt slit inlet
    translate([3,29.5,6]) cube([10,3,15]);
    // Smooth entrance
    translate([-56,21.7+10,16]) rotate([45,0,0]) cube([67,15,15]);
    // Teeth cuts
    for ( i = [0 : fix_teeth_count + 1] ){
        translate([i*belt_tooth_distance-36-tooth_size,21.9+8,7.5]) cube([belt_tooth_ratio*belt_tooth_distance,1.7,15]);
    }

    for ( i = [0 : fix_teeth_count + 1] ){
        translate([-i*belt_tooth_distance+3,21.9+8,6+1.5]) cube([belt_tooth_ratio*belt_tooth_distance,1.7,15]);
    }

    // Middle belt opening
    left_opening_border =-36+fix_teeth_count*belt_tooth_distance;
    right_opening_border =3-fix_teeth_count*belt_tooth_distance-left_opening_border;
    translate([left_opening_border,18,7.5]) cube([right_opening_border,14,15]);
}

module x_carriage_holes(){
 // Small bearing holder holes cutter
  translate([-33/2,2,0]) rotate([0,0,90]) horizontal_bearing_holes(2, 0);
 // Long bearing holder holes cutter
  translate([-33/2,x_rod_distance+2,0]) rotate([0,0,90]) horizontal_bearing_holes(2, 0);
  // Extruder mounting holes
  translate([-16.5+16,58,-1])cylinder(r=M3_diameter/2, h=20, $fn=32);
  translate([-16.5+16,58,7])cylinder(r=M3_nut_diameter/2, h=20, $fn=6);
  translate([-16.5-16,58,-1])cylinder(r=M3_diameter/2, h=20, $fn=32);
  translate([-16.5-16,58,7])cylinder(r=M3_nut_diameter/2, h=20, $fn=6);
  //translate([-16.5+1,24+31+2,-1])cylinder(r=M3_diameter/2, h=20, $fn=32);
  //translate([-16.5+1,24+31+2,7])cylinder(r=M3_nut_diameter/2, h=20, $fn=6);
}

module x_carriage_fancy(){
 // Top right corner
 translate([17, 0,0]) translate([0,45+12.5,-1]) rotate([0,0,45]) translate([0,-15,0]) cube([30,30,20]);
 // Bottom right corner
 translate([17,5,0]) translate([0,-12.5,-1]) rotate([0,0,-45]) translate([0,-15,0]) cube([30,30,20]);
 // Bottom ĺeft corner
 translate([-33-17,5,0]) translate([0,-12.5,-1]) rotate([0,0,-135]) translate([0,-15,0]) cube([30,30,20]);
 // Top left corner
 translate([-33-17,0,0]) translate([0,45+12.5,-1]) rotate([0,0,135]) translate([0,-15,0]) cube([30,30,20]);
}

module x_carriage_mountholes(){
    translate([-16.5, 0, 0]){
        translate([+25,-10, 6.1])cylinder(r=M3_diameter/2, h=20, $fn=32);
        translate([+25,-10, -1])cylinder(r=M3_nut_diameter/2, h=7, $fn=6);

        translate([-25, -10, 6.1])cylinder(r=M3_diameter/2, h=20, $fn=32);
        translate([-25, -10, -1])cylinder(r=M3_nut_diameter/2, h=7, $fn=6);

        translate([+25, 25, 6.1])cylinder(r=M3_diameter/2, h=20, $fn=32);
        translate([+25, 25, -1])cylinder(r=M3_nut_diameter/2, h=7, $fn=6);

        translate([-25, 25, 6.1])cylinder(r=M3_diameter/2, h=20, $fn=32);
        translate([-25, 25, -1])cylinder(r=M3_nut_diameter/2, h=7, $fn=6);

        translate([+25, 60, 6.1])cylinder(r=M3_diameter/2, h=20, $fn=32);
        translate([+25, 60, -1])cylinder(r=M3_nut_diameter/2, h=7, $fn=6);

        translate([-25, 60, 6.1])cylinder(r=M3_diameter/2, h=20, $fn=32);
        translate([-25, 60, -1])cylinder(r=M3_nut_diameter/2, h=7, $fn=6);
    }
}

// Final part
module x_carriage(){
 difference(){
  x_carriage_base();
  x_carriage_beltcut();
  x_carriage_holes();
  x_carriage_mountholes();
  x_carriage_fancy();
 }
}

x_carriage();
