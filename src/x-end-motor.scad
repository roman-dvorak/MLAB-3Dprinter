    // PRUSA iteration3
// x end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org


z_thread_diameter = 12;

include <../configuration.scad>
use <inc/x-end.scad>

module x_end_motor_base(){
 x_end_base();
 translate(v=[-15,31,26.5]) cube(size = [17,44,53], center = true);
}

module x_end_motor_holes(){
 x_end_holes();
 // Position to place
 translate(v=[-1,32,30.25]){
  // Belt hole
  translate(v=[-14,1,0]) cube(size = [10,46,22], center = true);
  // Motor mounting holes
  //translate(v=[20,-15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  //translate(v=[1,-15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);

  hull(){
    translate(v=[20,-16.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=M3_diameter_horizontal/2, $fn=30);
    translate(v=[20,-14.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=M3_diameter_horizontal/2, $fn=30);
  }
  hull(){
    translate(v=[1,-16.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
    translate(v=[1,-14.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
  }

  hull(){
    translate(v=[20,-16.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=M3_diameter_horizontal/2, $fn=30);
    translate(v=[20,-14.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=M3_diameter_horizontal/2, $fn=30);
  }
  hull(){
    translate(v=[1,-16.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
    translate(v=[1,-14.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
  }

  hull(){
    translate(v=[20,16.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=M3_diameter_horizontal/2, $fn=30);
    translate(v=[20,14.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=M3_diameter_horizontal/2, $fn=30);
  }
  hull(){
    translate(v=[1,16.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
    translate(v=[1,14.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
  }

  // Material saving cutout
  translate(v=[-10,12,10]) cube(size = [60,42,42], center = true);

  // Material saving cutout
  translate(v=[-10,40,-30]) rotate(a=[45,0,0])  cube(size = [60,42,42], center = true);
  // Motor shaft cutout
  translate(v=[0,0,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90+180/8]) cylinder(h = 70, r=17, $fn=8);
  // without motor
  translate(v=[0,-19,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, d=M3_diameter_horizontal, $fn=60);
  translate(v=[5,-19,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,0]) cylinder(h = 5+8, d=6.4, $fn=6);
  translate(v=[-20,-19,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,0]) cylinder(h = 5+8, d=6.1, $fn=30);
 }
}

// Final part
module x_end_motor(){
 difference(){
  x_end_motor_base();
  x_end_motor_holes();
 }

 translate([30,0,0]) mirror([1,0,0])
   difference(){
   x_end_motor_base();
   x_end_motor_holes();
 }
}

x_end_motor();
