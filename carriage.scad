include<configuration.scad>;
use<modules.scad>;

//VARIABLES

lm8uu_r = 15/2;  //Gotta check this
lm8uu_h = 24.12;
height = 15;
thick = 5;
M3washer = 8;
M3nut = 7;


ten_pos = 5;  //Position of tensioner in x-axis
pos_tem = 2; //temporary variable





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


			//Tensioner Block
			translate([ten_pos,0,-lm8uu_h/2+height/2+1.5]) cube([10,5,height+3],center=true);


			for(i=[-1:2:1]){
				
				//The slots for the lm8uu
				translate([i*rod_sep,0,0]) difference(){
					cylinder(r=lm8uu_r+2,h=lm8uu_h,center=true);
					translate([0,-5,0]) cube([lm8uu_r*2+8,10,lm8uu_h+1],center=true);
				}

				//In order to get the material for the zip-tie holes
				translate([i*(rod_sep-9),5,4]) rotate([90,0,0]) cylinder(r=8,h=thick,center=true);
			}
		}

	
		//LM8UU Slot fit
		lm8uu(lm8uu_h+1);

		//Cutting away for the rounded effect
		for(i=[-1:2:1]){
			translate([i*(rod_sep-20),5,5/2+9]) rotate([90,0,0]) cylinder(r=8,h=thick+.1,center=true);
		}

		//Holes for zip-ties
		for(i=[-1:2:1],d=[-1:2:1]){
			translate([i*rod_sep,0,d*(24.12/2-4)]) rings();
		}

		//Tensioner Holes
		translate([ten_pos,0,-lm8uu_h/2+height/2]){
			translate([0,0,8]) cube([2,2,6],center=true); //spectra hole

			translate([0,-1,pos_tem]) rotate([90,0,0]) cylinder(r=M3washer/2, h=4, center=true);
			translate([0,-1,pos_tem]) rotate([90,0,0]) cylinder(r=M3h/2, h=20, center=true);
			translate([0,7,pos_tem]) rotate([90,0,0]) cylinder(r=M3nut/2, h=4, center=true, $fn=6);
		
			translate([0,0,-5]) cube([2,20,2],center=true); //top spectra hole
		}


	}
}

module rings(){
	difference(){
		cylinder(r=lm8uu_r+4,h=3,center=true);
		cylinder(r=lm8uu_r+2,h=4,center=true);
	}
}



module connector(){
	
}





//DRAW
carriage();
%m8poles();
%lm8uu(lm8uu_h);
