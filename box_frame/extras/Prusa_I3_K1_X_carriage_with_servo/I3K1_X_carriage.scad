include <configuration.scad>
include <linear-bearings.scad>
use <library.scad>
use <hardware.scad>
use <servos.scad>
use <timing_belts.scad>
use <Writescad/Write.scad>

$fn=100;

X_carriage();
//rotate([180,0,0]) X_carriage_cap();
//flux_estension();

module X_carriage(){
	difference(){
		union(){
			translate([0,0,7]) roundedBox([56,67,14],3,true); // blocco centrale
			translate([0,41.5,2.5]) roundedBox([34,18,5],3,true); // blocco servo
		}

		// Primo blocco cuscinetti
		hull(){
			translate([0,-22,15]) rotate([0,90,0]) cylinder(r=5, h=230, center=true);
			translate([0,-22,10]) rotate([0,90,0]) cylinder(r=5, h=230, center=true);
			%translate([0,-22,10]) rotate([0,90,0]) cylinder(r=4, h=230, center=true);
		}
		hull(){
			translate([-13,-22,25]) rotate([0,0,0]) linear_bearing(LM8UU);
			#translate([-13,-22,10]) rotate([0,0,0]) linear_bearing(LM8UU);
		}
		hull(){
			translate([13,-22,25]) rotate([0,0,0]) linear_bearing(LM8UU);
			#translate([13,-22,10]) rotate([0,0,0]) linear_bearing(LM8UU);
		}
		translate([-13,-22,10]) rotate([0,0,0]) roundedBox([10,7,40],2, true);
		translate([13,-22,10]) rotate([0,0,0]) roundedBox([10,7,40],2, true);


		// Secondo blocco cuscinetti
		hull(){
			translate([0,23,15]) rotate([0,90,0]) cylinder(r=5, h=230, center=true);
			translate([0,23,10]) rotate([0,90,0]) cylinder(r=5, h=230, center=true);
			%translate([0,23,10]) rotate([0,90,0]) cylinder(r=4, h=230, center=true);
		}
		hull(){
			translate([-13,23,25]) rotate([0,0,0]) linear_bearing(LM8UU);
			#translate([-13,23,10]) rotate([0,0,0]) linear_bearing(LM8UU);
		}
		hull(){
			translate([13,23,25]) rotate([0,0,0]) linear_bearing(LM8UU);
			#translate([13,23,10]) rotate([0,0,0]) linear_bearing(LM8UU);
		}
		translate([-13,23,10]) rotate([0,0,0]) roundedBox([10,7,40],2, true);
		translate([13,23,10]) rotate([0,0,0]) roundedBox([10,7,40],2, true);

		translate([0,0,0]) cylinder(r=12, h=40, center=true);

		// Fori Viti Extruder
		translate([-11,-11.5,20]) screw(4,20);
		translate([11,-11.5,20]) screw(4,20);
		translate([-11,11.5,20]) screw(4,20);
		translate([11,11.5,20]) screw(4,20);

		// Fori belt
		translate([0,-7.5,10]) cube([70,1,10], center=true);
		translate([0,-1,10]) cube([70,1,10], center=true);
		translate([0,6.5,10]) cube([70,3,10], center=true);

		// Belt Cuts
		translate([-50,-6.5,5]) belt_length(profile = "T2.5", belt_width = 10, n = 50);
		translate([-50,-2,5]) mirror([0,1,0]) belt_length(profile = "T2.5", belt_width = 10, n = 50);
		%translate([-50,6.5,5]) mirror([0,1,0]) belt_length(profile = "T2.5", belt_width = 6, n = 50);

		// foro servo + viti
		translate([-5.5,41.5,17]) rotate([180,0,0]) servo(0,-90,1);
		%translate([-5.5,41.5,17]) rotate([180,0,0]) servo(0,-90,1);

		// Scritta
		#translate([-6,-22.5,2]) rotate([180,0,0]) write("I3", h=8, t=3);
		#translate([-5,31.5,2]) rotate([180,0,0]) write("K1", h=8, t=3);

	}
}

module X_carriage_cap(){
	difference(){
		translate([0,0,16.5]) roundedBox([56,67,5],3,true);

		// Primo blocco cuscinetti
		translate([0,-22,10]) rotate([0,90,0]) cylinder(r=5, h=230, center=true);
		%translate([0,-22,10]) rotate([0,90,0]) cylinder(r=4, h=230, center=true);

		#translate([-13,-22,10]) rotate([0,0,0]) linear_bearing(LM8UU);
		#translate([13,-22,10]) rotate([0,0,0]) linear_bearing(LM8UU);
		translate([-13,-22,10]) rotate([0,0,0]) roundedBox([10,7,40],2, true);
		translate([13,-22,10]) rotate([0,0,0]) roundedBox([10,7,40],2, true);

		// Secondo blocco cuscinetti
		translate([0,23,10]) rotate([0,90,0]) cylinder(r=5, h=230, center=true);
		%translate([0,23,10]) rotate([0,90,0]) cylinder(r=4, h=230, center=true);
		#translate([-13,23,10]) rotate([0,0,0]) linear_bearing(LM8UU);
		#translate([13,23,10]) rotate([0,0,0]) linear_bearing(LM8UU);
		translate([-13,23,10]) rotate([0,0,0]) roundedBox([10,7,40],2, true);
		translate([13,23,10]) rotate([0,0,0]) roundedBox([10,7,40],2, true);

		// Foro centrale
		translate([0,0,0]) cylinder(r=12, h=40, center=true);

		// Fori Viti Extruder
		#translate([-11,-11.5,19.5]) screw(4,10);
		#translate([11,-11.5,19.5]) screw(4,10);
		#translate([-11,11.5,19.5]) screw(4,10);
		#translate([11,11.5,19.5]) screw(4,10);

		// Scritta
		#translate([6,-22.5,18]) rotate([180,180,0]) write("I3", h=8, t=3);
		#translate([5,31.5,18]) rotate([180,180,0]) write("K1", h=8, t=3);

	}
}

module flux_estension(){
	difference(){
		translate([0,0,-9.5/2]) roundedBox([35,35,9.5],3,true); // blocco centrale
		// Fori Viti Extruder
		translate([-11,-11.5,20]) screw(4,40);
		translate([11,-11.5,20]) screw(4,40);
		translate([-11,11.5,20]) screw(4,40);
		translate([11,11.5,20]) screw(4,40);
	}
}