use <mlab_logo.scad>

$fn = 60;

prumer_sroub1 = 3;
prumer_sroub2 = 3.5;

module uchyt() {
    difference() {
        cube([40, 25, 8.5]);
        translate([1.7+4.5/2, 1.7+4.5/2, 0]) cylinder(r=prumer_sroub1/2, h=10);
        translate([40-(1.7+4.5/2), 1.7+4.5/2, 0]) cylinder(r=prumer_sroub1/2, h=10);
        translate([20, 20+16.55, 0]) cylinder(r=38/2, h=10);
        translate([1.7+4.5/2, 20, 0]) cylinder(r=prumer_sroub2/2, h=10);
        translate([40-(1.7+4.5/2), 20, 0]) cylinder(r=prumer_sroub2/2, h=10);
        translate([0, 7, 7]) rotate([-26.8, 0, 0]) cube([40, 10.6, 10]);
        translate([0, 7, 7]) rotate([]) cube([40, 20, 5]);
        translate([0, 16.5, 2.3]) cube([40, 10, 10]);
    }
}
difference() {
    uchyt();
    #translate([20, 11.4, 4.3]) rotate([26.8, 0, 180]) scale(0.13) MLAB_logo_short();
}

