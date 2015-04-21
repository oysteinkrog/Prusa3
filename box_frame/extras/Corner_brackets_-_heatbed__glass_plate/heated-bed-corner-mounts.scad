
// 
// TOP PART
//
module top_part(){
	translate([0, 0, 0]){

		// Main object
		difference() {
			cube([20, 20, 7.7]); // Base
			translate([-1, -1, 6]) cube([16, 16, 2]); // Bed cut
			translate([-1, -1, 3.2]) cube([11, 11, 2.9]); // Glassplate cut
			translate([12.3, 12.3, -1]) cylinder(h = 22, d=3.5, $fn=30); // Screw hole
			translate([-25, 5, -1]) rotate(a=-45, v=[0, 0, 1]) cube([40, 20, 22]); // Mask cutoff front
			translate([10, 25, -1]) rotate(a=-45, v=[0, 0, 1]) cube([40, 20, 22]); // Mask cutoff back
		}

		// First arm
		translate([10, -30, 0]) cube([3, 30, 3]);
		difference(){
			translate([9, -30, 0]) resize([0, 10, 0]) cylinder(h=6, d=8, $fn=50);
			translate([1, -45, -1]) rotate(a=-40, v=z) cube([3, 30, 8]);
		}

		// Second arm
		translate([-30, 10, 0]) cube([30, 3, 3]);
		difference(){
			translate([-30, 9, 0]) resize([10, 0, 0]) cylinder(h=6, d=8, $fn=50);
			translate([-45, 5, -1]) rotate(a=-50, v=z) cube([3, 30, 8]);
		}

		//Hinges
		translate([16.5, 3, 7.7]) cube([2, 3, 3]);
		translate([3, 16.5, 7.7]) cube([3, 2, 3]);
	}
}


//
// BOTTOM PART
//
module bottom_part(){
	translate([0, 0, 7.7]){
		difference() {
			cube([20, 20, 10]); // Base
			translate([12.3, 12.3, -1]) cylinder(h = 22, d=3.5, $fn=30); // Screw cut
			translate([12.3, 12.3, 2]) cylinder(h = 10, d=9, $fn=50); // Spring cut
			translate([-25, 5, -1]) rotate(a=-45, v=[0, 0, 1]) cube([40, 20, 22]);
			translate([10, 25, -1]) rotate(a=-45, v=[0, 0, 1]) cube([40, 20, 22]);

			//Hinges
			translate([16.25, 2.75, -1]) cube([2.5, 3.5, 7]);
			translate([2.75, 16.25, -1]) cube([3.5, 2.5, 7]);
		}
	}
}



//
// NUT PART
//
module nut_part(){
	translate([0, 0, -15]){
		difference() {
			cube([20, 20, 10]); // Base
			translate([12.3, 12.3, -1]) cylinder(h = 22, d=3.5, $fn=30); // Screw cut
			translate([12.3, 12.3, 4]) cylinder(h = 10, d=10.2, $fn=50); // Circle end
			translate([-5.2, 2, 4]) rotate(a=-45, v=z) cube([10.2, 20, 10]); // Box cut
			translate([12.3, 12.3, -1]) cylinder(h = 3, d=7, $fn=6); // Nut hole
			translate([-25, 5, -1]) rotate(a=-45, v=[0, 0, 1]) cube([40, 20, 22]);
			translate([10, 25, -1]) rotate(a=-45, v=[0, 0, 1]) cube([40, 20, 22]);
		}
	}
}


//
// 	CROOKED NUT PART
//	I had to make this bottom part because one of the screw holes in my aluminum plate
//	had been milled crooked.
//
module crooked_nut_part(){
	translate([0, 0, -15]){
		difference() {
			cube([20, 20, 10]); // Base
			translate([13, 12, -1]) cylinder(h = 22, d=3.5, $fn=30); // Screw cut
			translate([12.3, 12.3, 4]) cylinder(h = 10, d=10.2, $fn=50); // Circle end
			translate([-5.2, 2, 4]) rotate(a=-45, v=z) cube([10.2, 20, 10]); // Box cut
			translate([13, 12, -1]) cylinder(h = 3, d=7.3, $fn=6); // Nut hole
			translate([-25, 5, -1]) rotate(a=-45, v=[0, 0, 1]) cube([40, 20, 22]);
			translate([10, 25, -1]) rotate(a=-45, v=[0, 0, 1]) cube([40, 20, 22]);
		}
	}
}




top_part();
bottom_part();
nut_part();
//crooked_nut_part();



