// PRUSA iteration3
// x end idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/x-end.scad>
include <../configuration.scad>

module x_end_idler_base(){
 x_end_base();
}

module x_end_idler_holes(){
 x_end_holes();
 translate(v=[0,-23.4,30.25]) rotate(a=[0,-90,0]) cylinder(h = 40, r=M3_diameter_horizontal/2, $fn=30);
 translate(v=[-21.4,-23.4,30.25])rotate(a=[0,-90,0])cylinder(h = 2.2, r=M3_nut_diameter_horizontal/2, $fn=6);	
}

module waste_pocket(){
 // waste pocket
    translate([-15,-1,6]) rotate([90,0,0]) cylinder( h=5, r=5.5, $fn=30);     
    translate([-15,-1,51]) rotate([90,0,0]) cylinder( h=5, r=5.5, $fn=30);    
    translate([-15,-5.9,6]) rotate([90,0,0]) cylinder( h=3, r1=5.5, r2=4.3, $fn=30);     
    translate([-15,-5.9,51]) rotate([90,0,0]) cylinder( h=3, r=5.5, r2=4.3, $fn=30);      

    
    //M3 thread
    translate([-15,8.5,6]) rotate([90,0,0]) cylinder( h=12, r=1.4, $fn=30); 
    translate([-15,8.5,51]) rotate([90,0,0]) cylinder( h=12, r=1.4, $fn=30); 

    //M3 heads
    translate([-15,11.5,6]) rotate([90,0,0]) cylinder( h=4, r=2.9, $fn=30); 
    translate([-15,11.5,51]) rotate([90,0,0]) cylinder( h=4, r=2.9, $fn=30); 

    //M3 nut traps
    translate([-17.9,0.5,52-3-1.6]) cube([5.8,3.1,20]);
    translate([-17.9,0.5,-10+1.5+1.6]) cube([5.8,3.1,16]);
}
 
// Final part
module x_end_idler(){
 mirror([0,1,0]) 
 difference()
    {
    union()
        {
        difference()
            {
            x_end_idler_base();
            x_end_idler_holes();
            }
        translate([-15,8.5,6]) rotate([90,0,0]) cylinder( h=11, r=6, $fn=30);
        translate([-15,8.5,51]) rotate([90,0,0]) cylinder( h=11, r=6, $fn=30);
        }   
    waste_pocket();
    }
 }


x_end_idler();


