$fn=30;

uhel = 57;

module uchyt() {
    sirka = 40;
    delka = 10;
    difference() {
        cube([40, delka, 2]);
        translate([1.8+1.7, delka/2, 0]) cylinder(r=3.6/2, h=2);
        translate([40-(1.8+1.7), delka/2, 0]) cylinder(r=3.6/2, h=2);
        translate([sirka/2, sirka/2+1.8, 0]) cylinder(r=38/2, h=2);
    }
}
module bok() {
    difference() {
        cube([1, 35, 20]);
        translate([0, -16.5, 0]) rotate([-(90-uhel), 0, 0]) cube([1, 13.5, 40]);
        translate([0, 35, 6]) rotate([60, 0, 0]) cube([1, 30, 50]);
    }
}
difference() {
    union() {
        union() {
        translate([-1.07, 0.3, 0]) rotate([0, 0, -20]) bok();
        translate([43, 0, 0]) rotate([0, 0, 20]) bok();
        translate([1.5, 1.3, 0]) rotate([uhel, 0, 0]) uchyt();
        }
        union() {
            difference() {
                cube([43, 33, 1.5]);
                translate([-16, 15, 1]) rotate([0, 0, -20]) cube([40, 60, 2], center=true);
                translate([59, 15, 1]) rotate([0, 0, 20]) cube([40, 60, 2], center=true);
            }
        }
    }
    #translate([5, 8, 2]) rotate([uhel, 0, 0]) translate([0, 0, -15.5]) cylinder(r=4, h=20);
    #translate([38, 8, 2]) rotate([uhel, 0, 0]) translate([0, 0, -15.5]) cylinder(r=4, h=20);
}