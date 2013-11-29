include<configuration.scad>;
use<hotend_clamp.scad>;
$fn=20;

plat_h = 8;


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

				rotate([0,0,i]) translate([20,0,0]) cube([10,arm_sep+20,plat_h],center=true);



			}
		}

		hull() for(i=[0:120:240]){
			rotate([0,0,i]) translate([-20,0,0]) cylinder(r=5,h=plat_h+1,center=true);
		}
		for(i=[0:120:240]){
			rotate([0,0,i]) translate([-32,0,0]) cylinder(r=M4/2,h=plat_h+1,center=true);
		}	
	}
	

}





/********DRAWING********/

%translate([0,0,-20]) ubis();
platform();

%translate([0,0,47]) rotate([0,0,60]) clamp();
#translate([0,0,20]) for(i=[0:120:240]){
	rotate([0,0,i]) translate([-32,0,0]) cylinder(r=M4/2,h=60,center=true);
}	
