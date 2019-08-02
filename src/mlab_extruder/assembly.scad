
use <../x-carriage.scad>
use <../x-carriage-back.scad>
use <extruder.scad>
use <../Extruder_filament_1.75mm/extruder_model.scad>

color("green")
translate([19,-17, -25-10])
    rotate([-90, 180, 180])
        x_carriage();

color("green")
translate([19, -80, -25-10])
    rotate([90, 0, 180])
        x_carriage_back();

rotate([-90,90,0]){

    translate([-15, -4.5, -15]) extruder_01();
    translate([-15+31/2, -4.5+31/2, -10]) rotate([0, 0, 180]) extruder_02();

    //translate([66, -26, 31]) extruder_03();

}
/*
 color("green")
translate([-14, -43.4, -25-2])
    rotate([-90, 180, 0])
        x_carriage_back(); */

color("red")
translate([0, 3, -10])
    rotate([0, 0, 90])
    //superextruder();
    E3Dv6();


//color("blue")
//translate([0, 3, -60+2])
//    rotate([0, 0, 90])
//    extruder_04();

/*
color("green")
translate([45, 10, -10])
rotate([0, 90, 180])
radial_40(); */

//translate([0, 0, -10.2])
//    rotate([0, 180, 0])
//        extruder_05();

//color("green")
//translate([43, -4.5, -31])
//rotate([90, 90, 180])
//radial_40();

//module radial_40(){
//        cylinder(d = 51, h=15);
//        translate([25.5-17.5, 0, 0]) cube([17.5, 26, 15]);
//
//}


translate([0, -30, -75])
cube([10, 10, 38]);
