glassX = 9;
glassY = 9;
glassZ = 3.0;
sizeX = 20;
sizeY = 20;
sizeZ = 7.7;
bedZ = 2;

// 
// TOP PART
//
module top_part(){
	translate([0, 0, 0]){

		// Main object
		difference() {
			cube([sizeX, sizeY, sizeZ]); // Base

			// Bed cut
			translate([-1, -1, sizeZ-bedZ+0.3]) cube([16, 16, bedZ]); 

			// Glassplate cut
			translate([-1, -1, glassZ+0.2]) cube([abs(sizeX-glassX), sizeY-glassY, glassZ]); 

			// Screw hole
			translate([12.3, 12.3, -1]) cylinder(h = 22, d=3.5, $fn=30); 
			
			// Mask cutoff front
			translate([-25, 5, -1]) rotate(a=-45, v=[0, 0, 1]) cube([40, 20, 22]); 

			// Mask cutoff back
			translate([10, 25, -1]) rotate(a=-45, v=[0, 0, 1]) cube([40, 20, 22]); 
		}

		// First arm
		translate([10, -30, 0]) arm();

		// Second arm
		translate([-30, 10, 0]) mirror([0,0,1]) rotate([0,180,-90]) arm();

		//Hinges
		//translate([16.5, 3, 7.7]) cube([2, 3, 3]);
		//translate([3, 16.5, 7.7]) cube([3, 2, 3]);
	}
}

module arm()
{
	// arm
  cube([3, 30, 3]);

	// knob
	difference()
	{
		translate([-1,0,0]) resize([0, 10, 0]) cylinder(h=6, d=8, $fn=50);
		translate([-1, -5, -1]) rotate(a=-40, v=z) cube([3, 30, 8]);
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
			//#translate([16, -1, -1]) rotate([0, 30, 0])  cube([40, 40, 40]);
			//translate([18, 16, -1]) rotate([0, 30, 90])  cube([40, 40, 40]);
			translate([31, -30.5, -21]) rotate([0, -30, 90])  cube([40, 40, 40]);
			translate([-31, -10.5, -21]) rotate([0, -30, 00])  cube([40, 40, 40]);
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



