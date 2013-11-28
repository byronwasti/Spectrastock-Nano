include<configuration.scad>;
use<modules.scad>;

//VARIABLES

lm8uu_r = 15/2;  //Gotta check this
lm8uu_h = 24.12;
height = 15;
thick = 5;



//MODULES
module m8poles(){
	for(i=[-1:2:1]){
		translate([i*rod_sep,0,0]) cylinder(r=M8/2,h=rod_height,center=true);
	}
}
module lm8uu(h){
	for(i=[-1:2:1]){
		translate([i*rod_sep,0,0]) cylinder(r=lm8uu_r,h=h,center=true);

	}
}




module carriage(){
	difference(){
		union(){
			
			//The main section
			translate([0,5,-lm8uu_h/2+height/2]) cube([rod_sep*2,thick,height],center=true);

			for(i=[-1:2:1]){
				
				//The slots for the lm8uu
				translate([i*rod_sep,0,0]) difference(){
					cylinder(r=lm8uu_r+2,h=lm8uu_h,center=true);
					translate([0,-5,0]) cube([lm8uu_r*2+8,10,lm8uu_h+1],center=true);
				}

				//In order to get the material for the zip-tie holes
				translate([i*(rod_sep-7),5,5/2]) rotate([90,0,0]) cylinder(r=8,h=thick,center=true);
			}
		}

	
		//LM8UU Slot fit
		lm8uu(lm8uu_h+1);

		//Cutting away for the rounded effect
		for(i=[-1:2:1]){
			translate([i*(rod_sep-18),5,5/2+9]) rotate([90,0,0]) cylinder(r=8,h=thick+1,center=true);
		}

		//Holes for zip-ties

	}
}



module connector(){

}





//DRAW
//cube();
carriage();
%m8poles();
%lm8uu(lm8uu_h);

