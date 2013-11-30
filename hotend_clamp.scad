include<configuration.scad>;

$fn=60;
clamp_h = 2.31;
ubis_gap = 11.8;


module clamp(){
	difference(){
		union(){
			for(i=[0:120:240]){
				hull(){
					rotate([0,0,i]) translate([0,-35,0]) cylinder(r=6,h=clamp_h,center=true);
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



module Head_Mount(){

	difference(){
		union(){
			hull(){
				for(a = [0:120:240]){
					rotate([0,0,a]) translate([0,-21,0]) cylinder( r=5, h=clamp_h,center=true);
				}
			}
		}

		//Bolt holes
		for(a = [0:120:240]){
			rotate([0,0,a]) translate([0,-20,0]) cylinder( r=M4/2, h=clamp_h+1,center=true);
		}
	
		//Hotend hole w/ pathway thing
		cylinder(r=ubis_gap/2,h=clamp_h+1,center=true);
		hull(){
			cylinder(r=ubis_gap/2,h=clamp_h+1,center=true);
			translate([0,50,0]) cube([2*ubis_gap,1,clamp_h+1],center=true);

		}

	}
}




//DRAWING

//clamp();
Head_Mount();
