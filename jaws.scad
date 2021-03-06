include<configuration.scad>;

thickness = 6;
gap = 10;

h = (thickness+gap)/2;
r = h/2 / cos(30);




module jaws() {
  difference() {
    union() {
      intersection () {
        rotate([90, 0, 0]) cylinder(r=5, h=gap+thickness, center=true, $fn=24);
        translate([-4, 0, 0]) cube([10, gap+thickness, h], center=true);
      }
      intersection() {
        translate([10, 0, 0]) cube([26, gap+thickness, h], center=true);
        translate([10, 0, 0]) rotate([0, 90, 0]) rotate([0, 0, 30]) cylinder(r1=gap, r2=r, h=26, center=true, $fn=6);
      }
	
    }
	
	//Makin it look nice
    translate([-1.5, 0, 0]) cube([10, gap, 10], center=true);
    translate([3.5, 0, 0]) rotate([0, 0, 30]) cylinder(r=gap/2, h=10, center=true, $fn=6);
    translate([4, 0, 4]) rotate([0, 45, 0]) rotate([0, 0, 30]) cylinder(r=4.2, h=8, center=true, $fn=6);
    translate([4, 0, -4]) rotate([0, -45, 0]) rotate([0, 0, 30]) cylinder(r=4.2, h=8, center=true, $fn=6);

	//M3 Holes
    rotate([90, 0, 0]) cylinder(r=M3h/2, h=40, center=true, $fn=12);



  }
}

module jaws_full(){
translate([-50, 0, 0]) jaws();
translate([50,0,0]) mirror([1,0,0]) jaws();
translate([0, 0, 0]) rotate([90, 0, 90]) cylinder(r=r, h=80, center=true, $fn=6);
}
jaws_full();