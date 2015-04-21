rotate([90, 0, 0])
{
    clamp();
}
    

module clamp()
{
	difference(){ 
		cube([38, 16, 28]);

		// Out cut
		translate([15, -1, -1]) cube([8, 40, 21]);
		translate([19, 39, 20]) rotate([90, 0, 0]) cylinder(h = 40, d = 8, $fn = 50);
		translate([-1, -1, 5.6]) cube([11, 40, 35]);
		translate([28, -1, 5.6]) cube([11, 40, 35]);

		// Screw holes
		translate([5, 8.3, 3]) cylinder(h = 3, d = 7, $fn = 20);
		//translate([5, 29.7, 7]) cylinder(h = 3, d = 7, $fn = 20);
		translate([5, 8.3, -1]) cylinder(h = 20, d = 3.5, $fn = 20);
        //translate([5, 29.7, -1]) cylinder(h = 20, d = 3.5, $fn = 20);

		translate([28, 0, 0]){
			translate([5, 8.3, 3]) cylinder(h = 3, d = 7, $fn = 20);
			//translate([5, 29.7, 7]) cylinder(h = 3, d = 7, $fn = 20);
			translate([5, 8.3, -1]) cylinder(h = 20, d = 3.5, $fn = 20);
			//translate([5, 29.7, -1]) cylinder(h = 20, d = 3.5, $fn = 20);
		}
	}
}