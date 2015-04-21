//
// Mendel90
//
// GNU GPL v2
// nop.head@gmail.com
// hydraraptor.blogspot.com
//
// Linear bearings
//
bearing_color = [0.7, 0.7, 0.7];
LM10UU = [29, 19, 10];
LM8UU  = [24, 15,  8];
LM6UU  = [19, 12,  6];
LM4UU  = [12,  8,  4];
tolerance = 0.2;

function bearing_radius(type) = (type[1] + tolerance) / 2;

module linear_bearing(type) {
	color(bearing_color) render() rotate([0,90,0]) difference() {
		cylinder(r = bearing_radius(type), h = type[0] + tolerance, center = true);
		cylinder(r = type[2] / 2, h = type[0] + 1, center = true);
	}
}