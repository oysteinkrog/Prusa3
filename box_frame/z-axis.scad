// PRUSA iteration3
// Z axis
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/josefprusa/Prusa3

// ThingDoc entries
/**
 * @id zMotorHolder
 * @name Z Axis Motor Holder
 * @category Printed
 */
 
/**
 * @id zRodHolder
 * @name Z Axis Rod Holder
 * @category Printed
 */
 
include <configuration.scad>
module zmotorholder(thickness=(i_am_box == 0 ? 40 : 23), bottom_thickness=7){
    difference(){
        union(){
            // Motor holding part
            difference(){
                union(){
                    zrodholder(thickness=thickness, xlen=51, ylen=48, zdelta=((i_want_to_use_single_plate_dxf_and_make_my_z_weaker == 0) ? 0 : 5));
                    translate([board_to_xz_distance_y, board_to_xz_distance_x, 0]) {
                        nema17(places=[0, 1, 1, 1], h=bottom_thickness + layer_height, $fn=23, shadow=layer_height + 2);
                    }
                }

                translate([board_to_xz_distance_y, board_to_xz_distance_x, 0]) {
                    nema17(places=[0, 1, 1, 1], h=bottom_thickness + layer_height, $fn=23, shadow=layer_height + 2, holes=true);
                }
            }
        }
    }
}


module zrodholder(thickness=(i_am_box == 0 ? 19 : 15), bottom_thickness=7, ylen=44, xlen=42, zdelta=0, bearing_holder=false, punch_smooth=0){
    holder_inner_r = 9;
    holder_inner_r2 = 2;
    xwidth = 14+4;
    ywidth = 14+abs(z_delta_y);
	  
    difference(){
        union(){
            difference(){
                union(){
                    //piece along the flat side of a board
								if(bearing_holder) {						
                      	cube_fillet([xlen, ylen, bottom_thickness], vertical=[8, 3, 0, 0]);
                    	cube_fillet([board_to_xz_distance_y-21, ylen, thickness+bottom_thickness-4], vertical=[3, 3, 0, 0], top = [thickness / 1.7, 0, 0, 5]);
								} else {
                   		cube_fillet([xwidth, ylen, bottom_thickness], vertical=[8, 3, 0, 0]);
                   		cube_fillet([board_to_xz_distance_y-21, ylen, thickness+bottom_thickness-4], vertical=[3, 3, 0, 0], top = [thickness / 1.7, 0, 0, 5]);
								}


                    //hole for Z axis is thru this
                    translate([0, z_delta_y, 0])
									cube_fillet([xlen, ywidth, bottom_thickness], vertical=[3, 0, 0, 3]);

                    translate([xwidth, ywidth+z_delta_y, 0]) {
										if(!bearing_holder)
										{
                        		//large fillet that makes it stiffer by lot. Thanks to Marcus Wolschon
                        		difference(){
                         	   cube([holder_inner_r, holder_inner_r, bottom_thickness]);
                         	   translate([holder_inner_r, holder_inner_r, -0.5])
                         	       cylinder(r=holder_inner_r, h=bottom_thickness + 1);
                        		}
										}
                    }

                    //piece along cut side of the board
                    if (i_am_box == 1) {
                        translate([0, z_delta_y, 0])
                            cube_fillet([xlen, abs(z_delta_y)+5, thickness+3], radius=2, top = [0, 0, 0, thickness], $fn=99);
                    } else {
                        translate([0, z_delta_y, 0])
                            cube_fillet([xlen, abs(z_delta_y)+5, thickness+3], radius=2, top = [0, 0, 0, thickness], $fn=99);
                    }

                    //smooth rod insert
                    translate([board_to_xz_distance_y - z_delta_x, 9+z_delta_y, 0])
                        cylinder(h=bottom_thickness / 2, r=(bushing_z[0] + 5 * single_wall_width));
                }

                if(bearing_holder)
                {		
                    // for bearing
                    translate([board_to_xz_distance_y - z_delta_x, board_to_xz_distance_x, -0.1])
                        cylinder(h=8+0.1, r=(22/2)+0.2);
								// for lead screw
                    translate([board_to_xz_distance_y - z_delta_x, board_to_xz_distance_x, -1])
                        cylinder(h=50, r=4+0.1, center=true);
                }

                //smooth rod hole
                translate([board_to_xz_distance_y - z_delta_x, 9+z_delta_y, -1]) cylinder(h=bottom_thickness+punch_smooth, r=bushing_z[0] + single_wall_width / 4);
                //inside rouned corner
                //translate([0, 5, -1]) cylinder(r=0.8, h=100, $fn=8);
                //side screw
                //translate([-board_thickness/2, 0, thickness/2-1.5]) rotate([-90, 0, 0]) screw(h=30, r_head=4);
                //front screws
                if (i_am_box != 1) {
                    //single plate has both screws on front
                    translate([16, 35, bottom_thickness + 4.5 + zdelta]) rotate([0, -90, 0]) {
                        plate_screw();
                    }
                    translate([16, 15, bottom_thickness + 4.5 + zdelta]) rotate([0, -90, 0]) {
                        plate_screw();
                    }
                    //motor mount has third screw
                    translate([16, 25, bottom_thickness + 4.5 + zdelta + 20]) rotate([0, -90, 0]) {
                        plate_screw();
                    }
                } else {
                    translate([16, 30, bottom_thickness+4]) rotate([0, -90, 0]) {
                        plate_screw();
                    }
                    //side screw
                    translate([-board_thickness/2, -11, thickness/2]) rotate([-90, 0, 0]) plate_screw();
                }
            }
        }
    }
}
translate([00, -50, 0]) zmotorholder();
translate([0, 50, 0]) mirror([0, 1, 0]) zmotorholder();
translate([67, 50, 0]) rotate([0,0,0]) mirror([0, 1, 0]) zrodholder(bearing_holder=true, bottom_thickness=10, punch_smooth=20);
translate([67, -50, 0]) rotate([0, 0, -0]) zrodholder(bearing_holder=true, bottom_thickness=10, punch_smooth=20);
