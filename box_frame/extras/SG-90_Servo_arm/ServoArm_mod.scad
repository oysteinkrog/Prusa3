//scale(1) rotate([0,0,180]) translate([-21.3,10.23,-23]) rotate([90,0,0]) import("E:/3DPRINTING/ITEMS/i3 upgrades/SG-90_Servo_arm/SG-90_Servo_arm/servo_MG90S.STL");

module org_part() 
{
	translate([-12.5,-21.0,0]) import("Part6.stl");
}

//extend the arm
module arm(l=20)
{
difference()
{
	translate([0,-l,0]) cube([20,l,height], center=false);
	union()
	{
		translate([5.5,-l+5,0]) cylinder(r=1,h=10, center=true);
		translate([14.5,-l+5,0]) cylinder(r=1,h=10, center=true);
	}
}
}

module slice(r = 10, deg = 30) 
{
	degn = (deg % 360 > 0) ? deg % 360 : deg % 360 + 360;
	difference() {
		circle(r);
		if (degn > 180) 
			intersection_for(a = [0, 180 - degn]) rotate(a) translate([-r, 0, 0]) square(r * 2);
		else 
			union() for(a = [0, 180 - degn]) rotate(a) translate([-r, 0, 0]) square(r * 2);
	}
}

module slicer(r,degF, degT)
{
	rotate([0,0,-degF]) slice(r, degT-degF);
}

module servo_mount()
{
	// servo inner cylinder
	cylinder(r=5.9, h=height*3, center=true);
	// servo cylinder nub
	translate([5.9,0,0]) cylinder(r=2.8, h=height*3, center=true);
}

module rotate_servo(degF, degT)
{
	linear_extrude(h=height, center=true) slicer(8.7, degF,degT);
	rotate([0,0,-degF-1]) servo_mount();
	rotate([0,0,-degT+1]) servo_mount();
}

difference()
{
	org_part();
  
	rotate_servo(-00,90);	 

	translate([-12.5,-32,0]) cube([20,20,10]);
}

translate([-12.5,-12,0]) arm(11);

$fn = 100;
height = 4;
