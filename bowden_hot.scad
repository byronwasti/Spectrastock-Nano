include<configuration.scad>;
use<platform.scad>;
use<hotend_clamp.scad>;

height = 8;

//MODULES
module bowden(){
	difference(){
		union(){
			hull() for(i=[0:120:240]){
				rotate([0,0,i]) translate([0,-21,0]) cylinder(r=5,h=height,center=true,$fn=10);
			}
			translate([0,8,-6]) difference(){
				cube([10,15,5],center=true);
				translate([0,-6,0]) cylinder(r=15.89/2,h=10,center=true);
			}
		}
		for(i=[0:120:240]){
			rotate([0,0,i]) translate([0,-20,0]) cylinder(r=M4/2+.3,h=height+4, center=true);
		}
		cylinder(r=M4/2,h=50,center=true);

		translate([0,0,0]) cylinder(r=10/2,h=6,center=true);

		translate([0,0,-2]) cylinder(r=15.89/2+.5,h=6,center=true);
	}
}





//DRAWING
/*
%translate([0,0,-70])ubis();
%translate([0,0,-3]) Head_Mount();
#cylinder(r=4/2,h=40,center=true);
*/
rotate([0,180,0]) translate([0,0,10]) bowden();