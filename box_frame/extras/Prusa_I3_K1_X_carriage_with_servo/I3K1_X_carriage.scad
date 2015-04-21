include <configuration.scad>
include <linear-bearings.scad>
use <library.scad>
use <hardware.scad>
use <servos.scad>
use <Writescad/Write.scad>

$fn=100;

// Select your belt type ******************************************************

//T2
belt_width = 6.5;
belt_tooth_distance = 2;
belt_tooth_ratio = 0.5;
belt_thickness = 0.8;

//T2.5
//belt_tooth_distance = 2.5;

//T5 (strongly discouraged)
//belt_tooth_distance = 5;

//HTD3
//belt_tooth_distance = 3;

//MXL
//belt_tooth_distance = 2.032;


bearing_type = graphite_bushing;//LM8UU;
bearing_radius = bearing_radius(bearing_type);
bearing_length = bearing_length(bearing_type);

smoothbar_distance = 45;

bearing_spacing = 2;
bearing_x = bearing_length/2 + bearing_spacing/2;
bearing_y = smoothbar_distance/2;

outerwall_thickness = 6;
block_width = bearing_length*2+bearing_spacing+outerwall_thickness;
block_height = smoothbar_distance+bearing_radius*2+outerwall_thickness;
block_thickness = bearing_radius + outerwall_thickness ;
block_offset_z = -3;

lid_thickness = 5;
lid_offset_z = block_thickness/2 + block_offset_z + lid_thickness/2;

belt_mount_width = min(30,block_width/3 );
belt_mount_thickness = 10;

servo_mount_thickness = 5;
servo_mount_z = -block_thickness/2 + servo_mount_thickness/2 + 1;


X_carriage();
//X_carriage_cap();

module bearing_cutout(pos=[0,0,0])
{
	hull(){
		translate([pos[0],pos[1],pos[2]+bearing_radius])
				box([bearing_length,bearing_radius*2, bearing_radius*2], true);

		translate([pos[0],pos[1],pos[2]]) 
				linear_bearing(bearing_type);
	}
		translate([pos[0],pos[1],pos[2]]) rotate([0,0,0]) roundedBox([bearing_length/2,bearing_radius,40],2, true);

}

module smoothbar_cutout(pos=[0,0,0])
{
	hull(){
		translate([pos[0],pos[1],pos[2]+5])
				box([230,10,10], true);
		translate([pos[0],pos[1],pos[2]]) rotate([0,90,0]) cylinder(r=5, h=230, center=true);
		%translate([pos[0],pos[1],pos[2]]) rotate([0,90,0]) cylinder(r=4, h=230, center=true);
		}
}

module extruder_mounts()
{
		translate([-11,-12.5,10]) screw(4,50);
		translate([11,-12.5,10]) screw(4,50);
		translate([-11,10.5,10]) screw(4,50);
		translate([11,10.5,10]) screw(4,50);
}

module bearing_cutouts()
{
		bearing_cutout([-bearing_x,-bearing_y,0]);
		bearing_cutout([-bearing_x,bearing_y,0]);
		bearing_cutout([bearing_x,-bearing_y,0]);
		bearing_cutout([bearing_x,bearing_y,0]);
}

module belts_cutout()
{
	//translate([0,0,0]) cylinder(r=8, h=40, center=true);
#	translate([0,3,0]) box([4,1.8*4,10], center=true);

		translate([0,-6.5,0]) cube([block_width,5,belt_mount_thickness], center=true);
		translate([0,0,0]) cube([block_width,1.8,belt_mount_thickness], center=true);
		translate([0,6.5,0]) cube([block_width,1.8,belt_mount_thickness], center=true);
		translate([0,0,0]) cube([block,15,10], center=true);
	
		channel_width = block_width/2;
		translate([belt_mount_width+channel_width/2,0,0]) cube([channel_width,15,belt_mount_thickness], center=true);
		translate([-belt_mount_width-channel_width/2,0,0]) cube([channel_width,15,belt_mount_thickness], center=true);

		// Belt Cuts
     #translate([-belt_mount_width, 6, 0]) rotate([90,0,90]) {
         belt(belt_mount_width, 5);
     }
     #translate([-belt_mount_width, 0.5, 0]) mirror([0,1,0]) rotate([90,0,90]) {
         belt(belt_mount_width, 5);
     }
     #translate([0.5, 6, 0]) rotate([90,0,90]) {
         belt(belt_mount_width, 5);
     }
     #translate([0.5, 0.5, 0]) mirror([0,1,0]) rotate([90,0,90]) {
         belt(belt_mount_width, 5);
     }

}

module X_carriage(){
	difference(){
		union(){
			translate([0,0,block_offset_z]) roundedBox([block_width,block_height,block_thickness],3,true);
			translate([0,block_height/2+4.5,servo_mount_z]) box([37,9,servo_mount_thickness],3,center=true);
		}

		smoothbar_cutout([0,-bearing_y,0]);
		smoothbar_cutout([0,bearing_y,0]);

		bearing_cutouts();

		extruder_mounts();

		belts_cutout();

	  translate([-6,block_height/2+6,servo_mount_z+14.5]) rotate([180,0,0]) servo(0,-90,1);

		//#translate([-6,-22.5,2]) rotate([180,0,0]) write("I3", h=8, t=3);
		//#translate([-5,31.5,2]) rotate([180,0,0]) write("K1", h=8, t=3);

	}
}

module X_carriage_cap(){
	difference(){
		translate([0,0,lid_offset_z]) roundedBox([block_width,block_height,lid_thickness],3,true);

		rotate([180,0,0]) smoothbar_cutout([0,-bearing_y,0]);
		rotate([180,0,0]) smoothbar_cutout([0,bearing_y,0]);

		rotate([180,0,0]) bearing_cutouts();

		belts_cutout();

		translate([0,0,lid_thickness/2 - 2]) extruder_mounts();

		//#translate([6,-22.5,18]) rotate([180,180,0]) write("I3", h=8, t=3);
		//#translate([5,31.5,18]) rotate([180,180,0]) write("K1", h=8, t=3);

	}
}


module belt(len, side = 0){
    //belt. To be substracted from model
    //len is in +Z, smooth side in +X, Y centered
    translate([-0.5, 0, 0]) maketeeth(len);
    translate([0, -4.5, -0.01]) cube([belt_thickness, 9, len + 0.02]);
    if (side != 0) {
    translate([0, -4.5 + side, -0.01]) cube_fillet([belt_thickness, 9, len + 0.02], vertical = [3, 0, 0, 0]);
    }
}


module maketeeth(len){
    //Belt teeth. 
    for (i = [0 : len / belt_tooth_distance]) {
        translate([0, 0, i * belt_tooth_distance]) cube([2, 9, belt_tooth_distance * belt_tooth_ratio], center = true);
    }
}