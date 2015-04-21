use <triangles.scad>


test_servo();

module servo(position, rotation, screws = 0, axle_lenght = 0)
{
	translate(position)
	{
		rotate(rotation)
	    {
			union()
			{
				// Main axle
				translate([0,0,17])
				{
					cylinder(r=6, h=8, $fn=30);
					cylinder(r=2.5, h=10.5, $fn=20);
				}
				// Box and ears
				translate([-6,-6,0])
				{
					cube([12, 24.5,19.5], false);
					translate([0,-5, 17])
					{
						cube([12, 7, 2.5]);
					}
					translate([0, 22, 17])
					{
						cube([12, 7, 2.5]);
					}
				}
				if (screws > 0)
				{
					translate([0,(-10.2 + 1.8),11])
					{
						 cylinder(r=1.2, h=9, $fn=10);
					}
					translate([0,(22.5 - 1.8),11])
					{
						 cylinder(r=1.2, h=9, $fn=10);
					}

				}
				// The large slope
				translate([-6,0,19])
				{
					rotate([90,0,90])
					{
						triangle(4, 18, 12);
					}
				}

				translate([-6,-6,19.0])
				{
					cube([12,6.5,4]);
				}
			}
			if (axle_lenght > 0)
			{
				% cylinder(r=0.9, h=axle_lenght, center=true, $fn=8);
			}
		}
	}
}

// Tests:
module test_servo(){servo(screws=1);}
