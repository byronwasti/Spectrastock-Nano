include<configuration.scad>;

$fn=60;
clamp_h = 4;
ubis_gap = 11.8;




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
		cylinder(r=(ubis_gap/2)+5,h=clamp_h+1,center=true);


	}
}




//DRAWING

//clamp();
Head_Mount();
rotate([0,0,60]) Head_Mount();
