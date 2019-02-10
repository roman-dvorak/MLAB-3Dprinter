// RebeliX
//
// j-head mount + fan 40mm
// GNU GPL v3
// Martin Neruda
// http://www.reprap4u.cz

fan_width = 40;
fan_diameter = 38;
fan_mount = 33;

mount_height = 10;
shell_height = 5.5;
screw_distance = 50;

module jhead(){
difference(){
	union(){
	  cube([60,25,mount_height]);
	  //translate([60/2-fan_width/2,20,0]) cube([fan_width,10,mount_height]);
	}
	// Vyrez pro ventilator
	/* translate([60/2-fan_width/2-0.1,20+3.5,0]) rotate([-45,0,0]) cube([fan_width+1,15,15]);
	translate([60/2,32,21]) rotate([-135,0,0]) cylinder(r=fan_diameter/2, h=20);
	translate([60/2,20+2,7.4]){
	    translate([fan_mount/2,0,0]) rotate([-135,0,0]) cylinder(r=1.1,h=30,$fn=20,center=true);
	    translate([-fan_mount/2,0,0]) rotate([-135,0,0]) cylinder(r=1.1,h=30,$fn=20,center=true);
	}*/

	translate([30,10,shell_height]) cylinder(r=8.5,h=6,$fn=30);
	translate([30-8.5,-0.1,shell_height]) cube([17,10,6]);

	translate([30,10,-0.1]) cylinder(r=6.1,h=10,$fn=30);
	translate([30-6.1,-0.1,-0.1]) cube([12.2,10,10]);

	// Otvory pro prisroubovani
	translate([30-screw_distance/2,10,-0.1]) cylinder(r=2.5,h=10,$fn=30);
	translate([-0.1,10-2.5,-0.1]) cube([6,5,10]);

	translate([30+screw_distance/2,10,-0.1]) cylinder(r=2.5,h=10,$fn=30);
	translate([30+24,10-2.5,-0.1]) cube([7,5,10]);

	translate([30-screw_distance/2,10,4]) cylinder(r=6,h=10,$fn=30);
	translate([-0.1,10-6,4]) cube([6,12,10]);

	translate([30+screw_distance/2,10,4]) cylinder(r=6,h=10,$fn=30);
	translate([30+screw_distance/2,10-6,4]) cube([7,12,10]);

	// Seriznute rohy
	translate([2.5,0,-0.1]) rotate([0,0,135]) cube([5,5,11]);
	translate([60-2.5,0,-0.1]) rotate([0,0,-45]) cube([5,5,11]);
	translate([60,20+2.5,-0.1]) rotate([0,0,45]) cube([5,5,11]);
	translate([2.5,20+5,-0.1]) rotate([0,0,135]) cube([5,5,11]);
}
}

jhead();
