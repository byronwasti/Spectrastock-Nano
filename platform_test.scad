include<configuration.scad>;
use<hotend_clamp.scad>;
use<carriage.scad>;
$fn=20;

plat_h = 10;
arm_sep = 21;


module ubis(){
	ubis_l = 70-2.31-4.3;

	translate([0,0,ubis_l+5/2+2.31+4.3/2]) cylinder(r=15.89/2,h=4.3,center=true);
	translate([0,0,ubis_l+5/2+2.31/2]) cylinder(r=11.6/2,h=2.31,center=true);
	translate([0,0,ubis_l/2+5/2]) cylinder(r=15.89/2,h=ubis_l,center=true);
	cylinder(r2=15.89/2,r1=3,h=5,center=true);
}




module platform(){

	difference(){
		union(){
			hull() for(i=[0:120:240]){
				rotate([0,0,i]) translate([0,-38,0]) cube([1,1,plat_h],center=true);
			}
			for(i=[0:120:240]){
				rotate([0,0,i]) translate([0,25,0]) connector(0);
			}
		}
			
		cylinder(r=14,h=plat_h+3,center=true);
		
		for(i=[0:120:240],d=[-1:2:1]){
			rotate([0,0,i]) translate([0,18,0]) rotate([90,0,0]) cylinder(r=M4/2,h=plat_h+3,center=true);
			rotate([0,0,i]) translate([0,-20,0]) cylinder(r=M4/2,h=plat_h+3,center=true);


			rotate([0,0,i]) translate([d*21,34,0]) cube([13,20,plat_h+3],center=true);
			rotate([0,0,i]) translate([d*21,23,0]) cylinder(r=13/2,h=plat_h+3,center=true);


		}	
		
		
	}
	

}





/********DRAWING********/

//translate([0,0,-20]) ubis();
platform();

//translate([0,0,20]) rotate([0,0,0]) Head_Mount();
