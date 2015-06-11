// PRUSA iteration3
// y belt holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <../configuration.scad>

x_size = 33;
x_offset = 8.5;

module belt_holder_base(){
 translate([-x_size-x_offset,0,-1]) cube([x_size,35,16]);
 translate([-50,32,-1]) cube([50,4,16]); 
}

module belt_holder_beltcut(){
tooth_size = belt_tooth_ratio*belt_tooth_distance;
  echo(tooth_size);
// position_tweak=-1.1;
 // Belt slit
 translate([-66,-0.5+10,3]) cube([67,0.55,15]);
 // Smooth insert cutout
 translate([-66,-0.5+10,12]) rotate([45,0,0]) cube([67,15,15]);
 // Individual teeth
    for ( i = [0 : 8] ){
            translate([(-i*belt_tooth_distance)-x_offset,-0.5+x_offset,3]) cube([belt_tooth_ratio*belt_tooth_distance,1.7,15]);
    }
    
        for ( i = [0 : 8] ){
            translate([i*belt_tooth_distance-tooth_size-x_offset-x_size,-0.5+x_offset,3]) cube([belt_tooth_ratio*belt_tooth_distance,1.7,15]);
    }
    
    // Middle opening
    translate([-x_size/2-x_offset-belt_tooth_distance-tooth_size/2,-1,3]) cube([2*belt_tooth_distance+tooth_size,11,15]);	
 
    translate([-33-8.5+10,17,-2]) cube([13,13,20]);
}

module belt_holder_holes(){
 translate([-4.5,0.1,7.5]) rotate([-90,0,0]) cylinder(h=50, r=1.7, $fn=10);
 translate([-45.5,0.1,7.5]) rotate([-90,0,0]) cylinder(h=50, r=1.7, $fn=10);
}

// Final part
module belt_holder(){
    difference(){
        belt_holder_base();
        belt_holder_beltcut();
        belt_holder_holes();
    }
}

belt_holder();