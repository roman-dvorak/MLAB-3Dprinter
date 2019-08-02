

// Extruder od projektu spoluprace
module superextruder(){
    rotate([180, 0, 0]){

        cylinder(d = 21, h = 3.9);
        cylinder(d = 10, h=10);
        cylinder(d = 5, h=49);
        translate([0, 0, 10]) cylinder(d=15, h=17);
        translate([0, 0, 27]) cylinder(d=20, h=21);

        translate([-21/2, -21/2 - (21/2-6), 49]) cube([21,21,12]);
        translate([-21/2-5, -21/2 - (21/2-6) + 3, 49+1]) cube([23,15,10]);

    }
}

// Extruder od projektu spoluprace
module E3Dv6(){
    rotate([180, 0, 0]){

        cylinder(d = 16, h = 3.7);
        cylinder(d = 12, h=10);
        cylinder(d = 5, h=62);
        translate([0, 0, 10]) cylinder(d=15, h=17);
        translate([0, 0, 27]) cylinder(d=20, h=21);

        translate([-21/2, -21/2 - (21/2-6), 49]) cube([21,21,12]);
        translate([-21/2-5, -21/2 - (21/2-6) + 3, 49+1]) cube([23,15,10]);

    }
}
