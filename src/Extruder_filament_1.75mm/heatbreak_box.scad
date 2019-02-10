
wall = 2;

module fan_part(){

    difference(){
    union(){
        hull(){
            translate([-72/2, 0, -wall]) cube([72, 55, wall]);
            translate([-1, 0, -10]) cube([72/2, 40, 10]);
            translate([-10, 0, -10]) cube([20, 55, 10]);
        }

        translate([34.5,0,-45]) cube([5, 55+11, 45]);
        translate([-34-5,50,-10]) cube([5, 16, 10]);

    }

    translate([-65/2, 45, -50]) cube([65, 10, 50]);
    translate([40, 30-5, -20]){
        hull(){
        translate([-40+5, -10, -10]) cube([10, 25, 20]);
        translate([-5+10, 0, 0]) rotate([0, -90, 0]) cylinder(d=40, h=11);
        }

        for (i=[0:3]) {
            rotate([i*90, 0, 0]){
                translate([0, 32/2, 32/2]) rotate([0, -90, 0]) cylinder(d=3.3, h=11, $fn=50);
                hull(){
                    translate([-4, 32/2, 32/2]) rotate([-15,0,0]) rotate([0, -90, 0]) cylinder(d=6.5, h=3.2, $fn=6);
                    translate([-4, 0, 0]) cylinder(d=6.5, h=3.2, $fn=6);
                }
            }
        }
    }

    translate([-50+8, 0, -20]) cube([50, 12, 20]);
    hull(){
        #translate([0, 0, -18]) rotate([-90, 0, 0]) cylinder(h=40, d = 23);
        #translate([-50, 0, -18]) rotate([-90, 0, 0]) cylinder(h=40, d = 23);
    }

    }
}
