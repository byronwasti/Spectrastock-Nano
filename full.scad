include<configuration.scad>
use<arms.scad>;
use<carriage.scad>; 
use<hotend_clamp.scad>;
use<idler_end.scad>;
use<modules.scad>;
use<motor_end_lighter.scad>;
use<platform.scad>;
use<jaws.scad>;


for(i=[0:120:240]){
	rotate([0,0,i]) translate([0,80.6,0]){ 
		translate([0,0,85]) rotate([180,0,0]) carriage();
		translate([20,-34,45]) rotate([90,75,-90]) jaws_full();
		translate([-20,-34,45]) rotate([90,75,-90]) jaws_full();


		color("blue") m8poles();
		translate([0,0,rod_height/2]) rotate([180,0,180]) idler_end();
		translate([0,0,-rod_height/2]) motorend();
		color("red") translate([0,-47.5/2-25/2-5,-rod_height/2]) nema17();
	}
}
rotate([0,0,90]){
	rotate([0,0,30]) platform();
	color("red") translate([0,0,-20]) ubis();

	color("red") translate([0,0,20]) for(i=[0:120:240]){
		rotate([0,0,i]) translate([18,0,0]) cylinder(r=M4/2,h=60,center=true);
	}	

	translate([0,0,40]) rotate([0,0,30]) Head_Mount();
}