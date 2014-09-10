// PRUSA iteration3
// X ends
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/josefprusa/Prusa3

// ThingDoc entry
/**
 * @id xMotorEnd
 * @name X Axis Motor End
 * @category Printed
 */
 
/**
 * @id xIdlerEnd
 * @name X Axis Idler End
 * @category Printed
 */
 
include <configuration.scad>
use <bushing.scad>
use <inc/bearing-guide.scad>
use <y-drivetrain.scad>

//height and width of the x blocks depend on x smooth rod radius
bushing_spacing = 4;
x_box_height = max(xaxis_rod_distance+bushing_xy[0]*4, bushing_spacing + 2 * bushing_xy[2]);
x_box_width = (bushing_xy[0] <= 4) ? 17.5 : bushing_xy[0] * 2 + 9.5;
bearing_height = max ((bushing_z[2] > 30 ? x_box_height : (2 * bushing_z[2] + bushing_spacing)), x_box_height);

function sinr(x) = sin(180 * x / PI);
function tanr(x) = tan(180 * x / PI);
module x_end_motor(){

    mirror([0, 1, 0]) {

        translate([0, z_delta_y-5, 0]) difference(){
            union(){
               translate([0, -(z_delta_y-5), 0]) 
                    x_end_base([3, 3, min((bushing_xy[0] - 3) * 2, 3), 2], len=48 + abs(z_delta_y) + bushing_z[1]/2, offset=z_delta_y-bushing_z[1], thru=false);

               intersection() {
                   translate([-x_box_width+3.5, -34+bushing_z[1], x_box_height/2]) cube([x_box_width, 60, x_box_height], center = true);
                   //lower arm holding outer stepper screw
                   translate([-x_box_width+3.5, -51+(40+abs(z_delta_y))/2 + +bushing_z[1], (x_box_height/2-11)/2]) cube_fillet([x_box_width, 40+abs(z_delta_y), x_box_height/2-11], radius=2, center=true,top=[3, 3, 3, 3]);                    
               }
               translate([-x_box_width-5.25, -32+bushing_z[1], x_box_height/2 + 0.25]) rotate([90, 0, 0])  rotate([0, 90, 0]) nema17(places=[1, 0, 1, 1], h=x_box_width);
            }

            // motor screw holes
            translate([21-5, -21-11+bushing_z[1], x_box_height/2 + 0.25]){
                // belt hole
                translate([-30, 11, -1.25]) cube_fillet([11, 36, 22], vertical=0, top=[0, 1, 0, 1], bottom=[0, 1, 0, 1], center = true, $fn=4);
                //motor mounting holes
                translate([-30.5, 0, 0]) rotate([0, 0, 0])  rotate([0, 90, 180]) nema17(places=[1, 1, 1, 1], holes=true, shadow=5.5, $fn=small_hole_segments, h=8);
            }
        }
        //smooth rod caps
        //translate([-22, -10, 0]) cube([17, 2, 15]);
        //translate([-22, -10, 45]) cube([17, 2, 10]);
    }
}

module x_end_base(vfillet=[2, 2, 2, 2], thru=true, len=40, offset=0){

    difference(){
        union(){
            translate([-10 - bushing_xy[0], -10 + len / 2 + offset, x_box_height/2]) cube_fillet([x_box_width, len, x_box_height], center=true, vertical=vfillet, top=[3, 3, 3, 3]);
          
//            rotate([0, 0, 0]) translate([0, -9.5, 0]) 
            translate([z_delta_x, z_delta_y, 0]) linear(bushing_z, bearing_height);

            if(z_type == "threadedrod") {
                // Nut trap
                translate([-2, 18, 5]) cube_fillet([20, 14, 10], center = true, vertical=[8, 0, 0, 5]);            
            } else if(z_type == "leadscrew_rb_8x8_ab") {
                translate([0, 17, 0]) 
                    cylinder(h=10, r= 18.25);
            }     
            
        }
        // here are bushings/bearings
        translate([z_delta_x, z_delta_y, -1]) linear_negative(bushing_z, bearing_height+2);

        // belt hole
        translate([-14 - xy_delta / 2, 22 - 9 + offset, x_box_height/2]) cube_fillet([max(idler_width + 2, 2), 550, 27], center = true, vertical=0, top=[0, 1, 0, 1], bottom=[0, 1, 0, 1], $fn=4);

        if(z_type == "threadedrod") {
            translate([0, 0, 5 - bushing_xy[0]]) {  // m5 nut insert
                translate([0, 17, 0]) rotate([0, 0, 10]){
                    //rod
                    translate([0, 0, -1]) cylinder(h=(4.1 / 2 + 5), r=3, $fn=32);
                    //nut
                    translate([0, 0, 9]) cylinder(r=4.6, h=14.1, center = true, $fn=6);
            }
        }
        } else if(z_type == "leadscrew_rb_8x8_ab") {
            translate([0, 17, -1])
                union() {
                    cylinder(h=19+1, r=10+.1, center= false); 
                    translate([0, 13.5, -1]) cylinder(h=5, r=1.6); 
                    translate([0, -13.5, -1]) cylinder(h=5, r=1.6); 
                }
        }     
        //smooth rods
        translate([-10 - bushing_xy[0], offset-z_delta_y, x_box_height/2]) {
            if(thru == true){
                translate([0, -11+z_delta_y, -xaxis_rod_distance/2]) rotate([-90, 180, 0]) pushfit_rod(bushing_xy[0] * 2 + 0.2, len);
                translate([0, -11+z_delta_y, xaxis_rod_distance/2]) rotate([-90, 0, 0]) pushfit_rod(bushing_xy[0] * 2 + 0.2, len);
            } else {
                translate([0, +z_delta_y, -xaxis_rod_distance/2]) rotate([-90, 180, 0]) pushfit_rod(bushing_xy[0] * 2 + 0.2, len);
                translate([0, +z_delta_y, +xaxis_rod_distance/2]) rotate([-90, 0, 0]) pushfit_rod(bushing_xy[0] * 2 + 0.2, len);
            }
        }
    }
    //threaded rod
    translate([0, 17, 0]) %cylinder(h = 70, r=z_threaded_rod_r);
}

module x_end_idler(len=50){
    difference() {
        x_end_base(len=len + abs(z_delta_y), offset=-5+z_delta_y);

        translate([-6 - x_box_width, 11, -0.25 + x_box_height/2 - (max(idler_width, 16) / 2)]) cube([x_box_width + 1, len, 0.5 + max(idler_bearing[0], 16)]);
    }
        %translate([-14 - xy_delta / 2, -9, x_box_height/2 - (max(idler_width, 16) / 2)]) x_tensioner();
}

module x_tensioner(len=62, idler_height=max(idler_bearing[0], 16)) {
    idlermount(len=len, rod=m4_diameter / 2 + 0.5, idler_height=idler_height, narrow_len=42, narrow_width=idler_width + 2 - single_wall_width);
}


//translate([-40, 0, 0]) x_tensioner();
translate([0, -80, 0]) mirror([1, 0, 0]) x_end_idler(thru=true);
translate([-50, 0, 0]) mirror([1, 0, 0]) translate([-50, 0, 0])   x_end_motor();

module pushfit_rod(diameter, length){
    cylinder(h = length, r=diameter/2, $fn=30);
    translate([0, -diameter/4, length/2]) cube_fillet([diameter, diameter/2, length], vertical = [0, 0, 1, 1], center = true, $fn=4);

    translate([0, -diameter/2-1.2, length/2]) cube([diameter - 1, 1, length], center = true);
}


//if (idler_bearing[3] == 1) {  // bearing guides
//    translate([-39,  -60 - idler_bearing[0] / 2, 0]) rotate([0, 0, 55]) {
//        render() bearing_assy();
//    }
//}
