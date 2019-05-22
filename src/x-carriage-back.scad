
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

module x_carriage_back_base(){
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
 translate([-41-5,-11.5-6,0]) cube([49+10,68+6+9, 12]);
}

module x_carriage_back_beltcut(){
    // Cut clearing space for the belt
    translate([-50,10,7]) cube([70,29,15]);

}

module x_carriage_back_holes(){
 // Small bearing holder holes cutter
  translate([-33/2,2,0]) rotate([0,0,90]) horizontal_bearing_holes(2, 0);
 // Long bearing holder holes cutter
  translate([-33/2,x_rod_distance+2,0]) rotate([0,0,90]) horizontal_bearing_holes(2, 0);
  // Extruder mounting holes
  translate([-16.5+16,58,-1])cylinder(r=M3_diameter/2, h=20, $fn=32);
  translate([-16.5-16,58,-1])cylinder(r=M3_diameter/2, h=20, $fn=32);
}

module x_carriage_back_fancy(){
    // Top right corner
    translate([17, 0,0]) translate([0,45+12.5,-1]) rotate([0,0,45]) translate([0,-15,0]) cube([30,30,20]);
    // Bottom right corner
    translate([17,5,0]) translate([0,-12.5,-1]) rotate([0,0,-45]) translate([0,-15,0]) cube([30,30,20]);
    // Bottom ĺeft corner
    translate([-33-17,5,0]) translate([0,-12.5,-1]) rotate([0,0,-135]) translate([0,-15,0]) cube([30,30,20]);
    // Top left corner
    translate([-33-17,0,0]) translate([0,45+12.5,-1]) rotate([0,0,135]) translate([0,-15,0]) cube([30,30,20]);
   }


module x_carriage_back_mountholes(){
    translate([-16.5, 0, 0]){
        translate([+25,-10, 4.2])cylinder(r=M3_diameter/2, h=20, $fn=52);
        #translate([+25,-10, -1])cylinder(r=M3_nut_diameter/2, h=4, $fn=50);

        translate([-25, -10, 4.2])cylinder(r=M3_diameter/2, h=20, $fn=52);
        translate([-25, -10, -1])cylinder(r=M3_nut_diameter/2, h=4, $fn=50);

        translate([+25, 25, 4.2])cylinder(r=M3_diameter/2, h=20, $fn=52);
        translate([+25, 25, -1])cylinder(r=M3_nut_diameter/2, h=4, $fn=50);

        translate([-25, 25, 4.2])cylinder(r=M3_diameter/2, h=20, $fn=52);
        translate([-25, 25, -1])cylinder(r=M3_nut_diameter/2, h=4, $fn=50);

        translate([+25, 60, 4.2])cylinder(r=M3_diameter/2, h=20, $fn=52);
        translate([+25, 60, -1])cylinder(r=M3_nut_diameter/2, h=4, $fn=50);

        translate([-25, 60, 4.2])cylinder(r=M3_diameter/2, h=20, $fn=52);
        translate([-25, 60, -1])cylinder(r=M3_nut_diameter/2, h=4, $fn=50);
    }
}

// Final part
module x_carriage_back(){
 difference(){
  x_carriage_back_base();
  x_carriage_back_beltcut();
  x_carriage_back_holes();
  x_carriage_back_mountholes();
  x_carriage_back_fancy();
 }
}

x_carriage_back();
