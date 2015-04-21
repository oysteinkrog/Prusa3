// M8 Bolt length = 30mm
// Bearing width = 7mm (2x)
// Locknut width = 8mm
// leftover for plastic = 8mm (max)
// 3mm wide belt shields

difference() {
 union () {
  difference() {
   // main body
   union() {
    cube([30,33,17]);
    translate([0,0,8.5]) rotate([0,90,0]) cylinder(h=30,r=8.5,$fn=100);
    translate([0,33,8.5]) rotate([0,90,0]) cylinder(h=30,r=8.5,$fn=100);
    translate([0,-8.5,0]) cube([30,8.5,8.5]);
    translate([0,33,0]) cube([30,8.5,8.5]);
   }
   // long inside hole
   translate([-0.5,4.5,4.5]) {
    cube([31,10,8]);
    translate([0,0,4]) rotate([0,90,0]) cylinder(h=31,r=4,$fn=50);
    translate([0,10,4]) rotate([0,90,0]) cylinder(h=31,r=4,$fn=50);
   }
   // bearing cavity
   translate([9,26,-0.5]) cube([12,21,18]);
   // bearing cavity inner curve
   translate([9,33,8.5]) rotate([0,90,0]) cylinder(h=12,r=13,$fn=100);
  }
  translate([8,33,8.5]) rotate([0,90,0]) cylinder(h=2,r=4.2,$fn=50);
  translate([20,33,8.5]) rotate([0,90,0]) cylinder(h=2,r=4.2,$fn=50);
 }
 // bearing bolt hole
 translate([-0.5,33,8.5]) rotate([0,90,0]) cylinder(h=31,r=2.1,$fn=50);

 // tightner bolt holes
 translate([7.5,5,8.5]) rotate([90,0,0]) cylinder(h=15,r=2.2,$fn=30);
 translate([22.5,5,8.5]) rotate([90,0,0]) cylinder(h=15,r=2.2,$fn=30);
 
 // tightner nut holes
 union() {
  translate([3.9,-3,8.5]) cube([7.2,3.4,10]);
  translate([7.5,-1.3,8.5]) union() {
   cube([7.2,3.4,4.11], true);
   rotate([0,-60,0]) cube([7.2,3.4,4.11], true);
   rotate([0,60,0]) cube([7.2,3.4,4.11], true);
  }
 }
union() {
  translate([18.9,-3,8.5]) cube([7.2,3.4,10]);
  translate([22.5,-1.3,8.5]) union() {
   cube([7.2,3.4,4.11], true);
   rotate([0,-60,0]) cube([7.2,3.4,4.11], true);
   rotate([0,60,0]) cube([7.2,3.4,4.11], true);
  }
 }
}