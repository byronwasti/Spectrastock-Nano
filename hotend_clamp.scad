include<configuration.scad>;

$fn=60;
clamp_h = 2.31;
ubis_gap = 11.65;


module clamp(){
	difference(){
		union(){
			for(i=[0:120:240]){
				hull(){
					rotate([0,0,i]) translate([33,0,0]) cylinder(r=6,h=clamp_h,center=true);
					cylinder(r=6,h=clamp_h,center=true);
				}
			}
			cylinder(r=ubis_gap/2+5,h=clamp_h,center=true);
		}


		for(i=[0:120:240]){
			rotate([0,0,i]) translate([32,0,0]) cylinder(r=M4/2,h=clamp_h+1,center=true);
		}
		
		cylinder(r=ubis_gap/2,h=clamp_h+1,center=true);
		hull(){
			cylinder(r=ubis_gap/2-1,h=clamp_h+1,center=true);
			translate([-30,0,0]) cylinder(r=ubis_gap/2-1,h=clamp_h+1,center=true);
		}

	}
}



//DRAWING

clamp();