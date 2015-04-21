include <configuration.scad>
//Based on: http://www.roymech.co.uk/Useful_Tables/Screws/Hex_Screws.htm

BOLTD =
[
	-1, //0 index is not used but reduces computation
	-1,
	-1,
	3,//m3
	4,//m4
	5,//m5
	6,//m6
	-1,
	8,//m8
	-1,
	10,//m10
	-1,
	11.986,//m12
	-1,
	-1,
	-1,
	15.982,//m16
	-1,
	-1,
	-1,
	19.978,//m20
	-1,
	-1,
	-1,
	23.972,//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	29.967,//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	35.960//m36
];

BOLTH =
[
	-1, //0 index is not used but reduces computation
	-1,
	-1,
	2.125,//m3
	2.925,//m4
	3.650,//m5
	4.150,//m6
	-1,
	5.650,//m8
	-1,
	7.180,//m10
	-1,
	8.180,//m12
	-1,
	-1,
	-1,
	10.180,//m16
	-1,
	-1,
	-1,
	13.215,//m20
	-1,
	-1,
	-1,
	15.215,//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	19.260,//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	23.260//m36
];

CAPD =
[
	-1, //0 index is not used but reduces computation
	-1,
	3.62,//m2
	5.32,//m3
	6.78,//m4
	8.28,//m5
	9.78,//m6
	-1,
	12.73,//m8
	-1,
	15.73,//m10
	-1,
	17.73,//m12
	-1,
	-1,
	-1,
	23.67,//m16
	-1,
	-1,
	-1,
	29.67,//m20
	-1,
	-1,
	-1,
	35.61,//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	49.947,//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	55.940//m36
];

CAPH =
[
	-1, //0 index is not used but reduces computation
	-1,
	1.86,//m2
	2.86,//m3
	3.82,//m4
	4.82,//m5
	5.70,//m6
	-1,
	7.64,//m8
	-1,
	9.64,//m10
	-1,
	11.57,//m12
	-1,
	-1,
	-1,
	15.57,//m16
	-1,
	-1,
	-1,
	19.48,//m20
	-1,
	-1,
	-1,
	23.48,//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	29.57,//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	35.48//m36
];

NUTD =
[
	-1, //0 index is not used but reduces computation
	-1,
	-1,
	6.40,//m3
	8.10,//m4
	9.20,//m5
	11.50,//m6
	-1,
	15.00,//m8
	-1,
	19.60,//m10
	-1,
	22.10,//m12
	-1,
	-1,
	-1,
	27.70,//m16
	-1,
	-1,
	-1,
	34.60,//m20
	-1,
	-1,
	-1,
	41.60,//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	53.1,//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	63.5//m36
];
NUTH =
[
	-1, //0 index is not used but reduces computation
	-1,
	-1,
	2.40,//m3
	3.20,//m4
	4.00,//m5
	5.00,//m6
	-1,
	6.50,//m8
	-1,
	8.00,//m10
	-1,
	10.00,//m12
	-1,
	-1,
	-1,
	13.00,//m16
	-1,
	-1,
	-1,
	16.00//m20
	-1,
	-1,
	-1,
	19.00,//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	24.00,//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	29.00//m36
];

WASHD =
[
	-1, //0 index is not used but reduces computation
	-1,
	-1,
	7,//m3
	9,//m4
	10,//m5
	12.5,//m6
	-1,
	17,//m8
	-1,
	21,//m10
	-1,
	24,//m12
	-1,
	-1,
	-1,
	30,//m16
	-1,
	-1,
	-1,
	37,//m20
	-1,
	-1,
	-1,
	44,//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	56,//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	66//m36
];

WASHH =
[
	-1, //0 index is not used but reduces computation
	-1,
	-1,
	0.6,//m3
	0.9,//m4
	1.1,//m5
	1.8,//m6
	-1,
	1.8,//m8
	-1,
	2.2,//m10
	-1,
	2.7,//m12
	-1,
	-1,
	-1,
	3.3,//m16
	-1,
	-1,
	-1,
	3.3,//m20
	-1,
	-1,
	-1,
	4.3,//m24
	-1,
	-1,
	-1,
	-1,
	-1,
	4.3,//m30
	-1,
	-1,
	-1,
	-1,
	-1,
	5.6//m36
];

c = [0.3, 0.3, 0.3];

renderrodthreads = true;

fn = 64;

module screw(size, length, nutpos, washer){
	screwsize = BOLTD[size] + tolerance;
	capHeight = CAPH[size];
	capRadius = CAPD[size]/2 + tolerance;
	washersize = WASHH[size];
	translate([0, 0, -capHeight+.2]) rotate([180,0,0]) cylinder(h = length, r = screwsize / 2, $fn = fn);
	translate([0, 0, -capHeight / 2 + .1]) cylinder(h = capHeight, r = capRadius, center = true, $fn = fn);
		
	if (washer > 0 && nutpos > 0) {
		washer(size, nutpos);
		nut(size, 0, nutpos + washersize);
	} else if (nutpos > 0) nut(size, 0, nutpos);
}

module nut(size, rotation, nutpos, washer){
	translate([0, 0, -nutpos - BOLTH[size] - NUTH[size]/2]) rotate([0,0,rotation])
		cylinder (h = NUTH[size], r = (NUTD[size] + tolerance) / 2, center = true, $fn = 6);
	if (washer > 0) washer(0);
}

module washer(size, position){
	translate ([0, 0, -position - BOLTH[size] - WASHH[size]/2])
		cylinder(r = WASHD[size]/2, h = WASHH[size], center = true, $fn = fn);
}


module rod(rodsize, length, threaded) if (threaded && renderrodthreads) {
	linear_extrude(height = length, center = true, convexity = 10, twist = -360 * length / (rodsize / 6), $fn = fn)
		translate([rodsize * 0.1 / 2, 0, 0])
			circle(r = rodsize * 0.9 / 2, $fn = fn);
} else cylinder(h = length, r = rodsize / 2, center = true, $fn = fn);

module rodnut(rodsize, position, washer) render() translate([0, 0, position]) {
	intersection() {
		scale([1, 1, 0.5]) sphere(r = 1.05 * rodsize, center = true);
		difference() {
			cylinder (h = 0.8 * rodsize, r = (1.9 * rodsize) / 2, center = true, $fn = 6);
			rod(0.8 * rodsize + 0.1);
		}
	}
	if (washer == 1 || washer == 4) rodwasher(((position > 0) ? -1 : 1) * ((0.8 * rodsize) + (0.2 * rodsize)) / 2);
	if (washer == 2 || washer == 4) rodwasher(rodsize, ((position > 0) ? 1 : -1) * ((0.8 * rodsize) +(0.2 * rodsize)) / 2);
}


module rodwasher(rodsize, position) render() translate ([0, 0, position]) difference() {
	cylinder(r = rodsize, h = 2 * rodsize, center = true, $fn = fn);
	rod(2 * rodsize + 0.1);
}


//rod(8,20);
//translate([20, 0, 0]) rod(8,20, false);
//translate([40, 0, 0]) screw(3,6,2);
//translate([60, 0, 0]) bearing();
//translate([80, 0, 0]) rodnut(4);
//translate([100, 0, 0]) rodwasher();
//translate([120, 0, 0]) nut(4,32);
//translate([140, 0, 0]) washer();