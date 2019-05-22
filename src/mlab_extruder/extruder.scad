
use <../Extruder_filament_1.75mm/extruder_model.scad>

motor_a = 42 + 0.4; // hrana motoru
motor_length = 40;  //hloubka
motor_screw_d = 3;
motor_screw_l = 31;
motor_axis_d = 5;
motor_axis_l = 26;

motor_support_thickness = 10;

gear_d = 9; // prumer - podavaci kolecko
gear_l = 13;

bearing_d = 5;
bearing_D = 16;
bearing_b = 5;

base_thickness = 5;
base_top_overlap = 5;

M3_screw_d = 3.25;
M3_head_d = 6;

HE_flange_d = 21;
HE_flange_h = 3.9;
HE_flange_outd = 10;

HE_flange_thickness = 3.9+5;
HE_flange_width = HE_flange_d + 13;

HE_height = 55;

module extruder_01(){
    y_posuv = gear_d/2;

    difference(){
        union(){
            translate([-motor_a/2 - base_top_overlap, -motor_a/2, 0])
                cube([motor_a + base_top_overlap, motor_a+y_posuv, base_thickness + motor_axis_l]);

            translate([motor_a/2 , -motor_a/2, 0])
                cube([base_thickness, motor_a+y_posuv, base_thickness + motor_axis_l + 15]);

            translate([motor_a/2 , y_posuv - HE_flange_width/2, 0])
                cube([base_thickness+HE_flange_thickness, HE_flange_width, base_thickness + motor_axis_l/2]);

            translate([motor_a/2 , -motor_a/2, 0])
                cube([base_thickness+HE_height, motor_a + y_posuv, base_thickness]);


            //translate([motor_a/2 , motor_a/2, 0])
            //    cube([base_thickness+HE_height, base_thickness, base_thickness+motor_axis_l+15]);

        }// end of main functionality



    // Srouby pro pridelani motoru extruderu
        for(x = [[-motor_screw_l/2, motor_screw_l/2, 0],[-motor_screw_l/2, -motor_screw_l/2,0],
            [motor_screw_l/2, -motor_screw_l/2, 0],[motor_screw_l/2, motor_screw_l/2, 0]]) {
            translate(x){
                translate([0, 0, base_thickness-2+0.2])
                    cylinder(h=100, d=M3_screw_d, $fn = 40);
                translate([0, 0, -0.1])
                    cylinder(h=base_thickness-2+0.1, d=M3_head_d, $fn = 40);
            }
        }

        translate([-motor_screw_l/2-5, motor_a/2+y_posuv-18, base_thickness + motor_axis_l/2])
            rotate([-90, 0, 0])
                cylinder(d=3.3, h=50, $fn=50);
        translate([-motor_screw_l/2-5-60+3, motor_a/2+y_posuv-5, base_thickness + motor_axis_l/2 - 3])
            cube([60, 3, 6]);

        // vyrez pro pritlacne lozisko
        translate([0, y_posuv*2-1, base_thickness])
            cube([motor_a/2, motor_a/2, motor_axis_l+0.1]);

        // vyrez pro kolo extruderu
        hull(){
            translate([0, 0, base_thickness])
                cylinder(d = 9+2, h = motor_axis_l, $fn=40);

            translate([0, -10, base_thickness])
                cylinder(d = 22, h = motor_axis_l, $fn=40);

            translate([-(motor_a - motor_support_thickness*2)/2, -motor_a/2-0.1, base_thickness])
                cube([motor_a - motor_support_thickness*2, y_posuv, motor_axis_l+0.1]);
        }

        // Vyrez pro osazeni motoru
        translate([0, 0, base_thickness+motor_axis_l-2.5])
            cylinder(d = 25, h = 2.6);

        // Vyrez pro pritlacne lozisko
        hull(){
            translate([0, bearing_D/2+gear_d/2, base_thickness])
                cylinder(d = bearing_D+2, h = 50);
            translate([-(motor_a - motor_support_thickness*1.5)/2, motor_a/2, base_thickness])
                cube([motor_a - motor_support_thickness*1.5, y_posuv+0.1, motor_axis_l]);
        }

        // Cesta pro filament
        translate([0, y_posuv, base_thickness + motor_axis_l/2])
            rotate([0, 90, 0]){
                translate([0, 0, -100]) cylinder(h=200, d=2, $fn=40);
                translate([0, 0, 0]) cylinder(h=motor_axis_l/2, d1=2.5, d2=2, $fn=40);
                translate([0, 0, -motor_axis_l/2 - base_top_overlap- 10]) cylinder(h=motor_axis_l/2, d1=3, d2=2, $fn=40);
            }

        // priruba HE
        translate([motor_a/2+base_thickness, y_posuv, base_thickness+motor_axis_l/2])
            rotate([0, 90, 0]){
                cylinder(h=HE_flange_h, d=HE_flange_d, $fn=60);
                cylinder(h=15, d=HE_flange_outd, $fn=60);
                translate([0,0,-0.6]) cylinder(h=15, d=HE_flange_outd, $fn=60);
            }

        // Diry pro pridelani priruby
        translate([motor_a/2 + base_thickness + 3, y_posuv + HE_flange_d/3*2, base_thickness/2]){
            cylinder(h=100, d=M3_screw_d, $fn=60);
            translate([-3, -3, 3]) cube([6, 20, 3]);
        }
        translate([motor_a/2 + base_thickness + 3, y_posuv - HE_flange_d/3*2, base_thickness/2]){
            cylinder(h=100, d=M3_screw_d, $fn=60);
            translate([-3,-20+3, 3]) cube([6, 20, 3]);
        }

        translate([HE_height + base_thickness+13,-5,0])
            cube([10, 26, 33]);

        translate([HE_height + base_thickness+14, y_posuv, 15])
            rotate([0, -90, 0])
            cylinder(h=25, d=22);
        /* // pro pridelani vetraku
        translate([motor_a/2+base_thickness+HE_height/2+4, motor_a/2 + y_posuv + 1, base_thickness+motor_axis_l/2 + 5]){
            rotate([90, 0, 0]){
                cylinder(h=20, d1=40, d2=30, $fn=60);
                for(x=[[32/2, 32/2, 0], [-32/2, -32/2, 0], [-32/2, 32/2, 0], [32/2, -32/2, 0]]){
                    translate(x) cylinder(h=20, d=M3_screw_d, $fn=60);
                }
                translate([32/2, 32/2, 2]) rotate([0, 0, 45]) translate([-5, -3, 0]) cube([10, 6, 2.5]);
                translate([32/2, -32/2, 2]) rotate([0, 0, -45]) translate([-5, -3, 0]) cube([10, 6, 2.5]);
                translate([-32/2, -32/2, 2]) rotate([0, 0, -90]) translate([-20+5, -3, 0]) cube([20, 6, 2.5]);
            }
        } */

        //translate([])
        //    rotate([0, 90, 0]);
    }
}

module extruder_03(){
    difference(){
        union(){
            translate([-60, -base_thickness, -40-base_thickness]) cube([60, base_thickness, 40+base_thickness]);
            translate([-60, -base_thickness, 0]) cube([60, 52.5, base_thickness]);
            translate([-60+15, -base_thickness+27.5, -30+15]) cube([60-15, 20, 15]);
        }
        hull(){
            translate([-23.5, 48, -23]) rotate([90, 0, 0]) cylinder(h=5, d=40, $fn=60);
            //translate([-23.5, 52-33, -23-10]) rotate([90, 0, 0]) cylinder(h=2, d=40);
            #translate([-23.5+5, 25, -23-8]) rotate([0, 90, 0]) cylinder(h=20, d=20, center=true);
        }
    }
}
translate([0,0,-20]) extruder_03();


module extruder_02(){
    $fn=50;

    height = 15;
    difference(){
        union(){
            hull(){
                cylinder(h=height, d=10, $fn=30);
                translate([31/2, 3, 0])
                    cylinder(h=height, d=10);
                translate([20, -15, 0])
                    cylinder(h=height, d=13);
                translate([15, -15, 0])
                    cylinder(h=height, d=13);
            }
            hull(){
                translate([23+20, -17, 0])
                    cylinder(h=height, d=9);
                translate([15-0.5, -15-2, 0])
                    cylinder(h=height, d=9);
            }
        }
        translate([31/2, 11-bearing_D/2, 0]){
            cylinder(d=5.2, h=50);
        }
        translate([31/2, 11-bearing_D/2, height/2]){
            cylinder(d=16, h=bearing_b+1, center = true);
        }

        translate([31+5, 0, height/2])
            rotate([90, 0, 0])
                hull(){
                    translate([2.5, 0, 0]) cylinder(h=50, d=3.3);
                    translate([-2.5, 0, 0]) cylinder(h=50, d=3.3);
                }

        hull(){
            cylinder(d=3.2, h=50);
            translate([0, -30, 0])
                cylinder(d=5, h=50);
        }
    }
}


fan_width = 15.3;
HB_d = 21;
HB_height = 20;

module extruder_04(){
    difference(){
        union(){
            translate([-(HB_d+2)/2, 0, 0]) cube([HB_d+2, (HB_d+2)/2, 21]);
            hull(){
                translate([-fan_width/2-1, -20, 0]) cube([fan_width+2, 1, 21]);
                cylinder(h=HB_height+1, d=HB_d+2, $fn=60);
            }
        }

        union(){
            hull(){
                translate([0, 0, 1]) cylinder(h=HB_height-1, d=HB_d);
                translate([-fan_width/2, -21, 1]) cube([fan_width, 20/2, HB_height-1]);
            }

            translate([-fan_width/2, -20-5, 1]) cube([fan_width, 20/2, HB_height+1]);

            translate([0, 0, 1]) cylinder(h=HB_height-1, d=HB_d);
            translate([-HB_d/2, 0, 1]) cube([HB_d, 23/2, HB_height-1]);

            hull(){
                translate([0, 0, HB_height+0.2]) cylinder(h=HB_height+1, d=16);
                translate([0, 20, HB_height+0.2]) cylinder(h=HB_height+1, d=16);
            }

            hull(){
                translate([0, 0, -1]) cylinder(h=HB_height+1, d=HB_d);
                translate([0, 20, -1]) cylinder(h=HB_height+1, d=HB_d);
            }
        }
    }
}

module extruder_05(){
    difference(){
        translate([-HE_flange_width/2, 4, 1.2]) cube([HE_flange_width, 11, 9-0.3]);
        cylinder(d=10.2, h=21, $fn=60);
        cylinder(d=21.1, h=3.9, $fn=60);

        rotate([-90, 0, 0]) translate([HE_flange_d/3*2, -4, 0]){
            cylinder(d=3.3, h=10-0.2, $fn=50);
            translate([0, 0, 10]) cylinder(d=5.8, h=20, $fn=50);
        }

        rotate([-90, 0, 0]) translate([-HE_flange_d/3*2, -4, 0]){
            cylinder(d=3.3, h=10-0.2, $fn=50);
            translate([0, 0, 10]) cylinder(d=5.8, h=20, $fn=50);
        }

    }
}

echo("4x DIN912:M3x", 2+7+motor_axis_l);

extruder_01();
translate([31/2, 31/2, base_thickness]) rotate([0, 0, 180]) extruder_02();
