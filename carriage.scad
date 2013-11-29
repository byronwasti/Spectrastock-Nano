include<configuration.scad>;
use<modules.scad>;
use<idler_end.scad>;

//VARIABLES

lm8uu_r = 15/2;  //Gotta check this
lm8uu_h = 24.12;
height = 15;
thick = 5;



ten_pos = 5;  //Position of tensioner in x-axis
pos_tem = 2; //temporary variable



cubex = 4;
cubey = 13;
cubez = 10;
cubie = [cubex,cubey,cubez];

arm_sep = 20;
swivel_sep = 5+cubex/2;



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

			//Connectors
			translate([0,cubey,-lm8uu_h/2+height/2-10/4]) connector();



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
	difference(){
		union(){
				
			//The initial blocks
			for(i=[-1:2:1],d=[-1:2:1]){
				translate([d*swivel_sep/2+i*arm_sep,0,0]){
					cube(cubie,center=true);
					translate([0,cubey/2,0]) rotate([0,90,0]) cylinder(r=cubez/2,h=cubex,center=true);


					//get that extra support 
					difference(){
						translate([0,-cubey/3,cubez/2]) rotate([0,90,0]) cylinder(r=cubez/2,h=cubex,center=true);
						translate([0,0,cubez]) rotate([0,90,0]) cylinder(r=cubez/2,h=cubex+1,center=true);
					}
				}
			}
		}
		
		//The M3 nut hole
		translate([0,cubey/3,0]) rotate([0,90,0]) cylinder(r=M3nut/2,h=31,center=true,$fn=6);
		translate([0,cubey/3,0]) rotate([0,90,0]) cylinder(r=M3h/2,h=100,center=true,$fn=20);

		for(i=[-1:2:1]){
			translate([29*i,cubey/3,0]) rotate([0,90,0]) cylinder(r=M3washer/2,h=10,center=true);
		}

		
	}	
}





//DRAW
carriage();



%translate([0,0,-30]) rotate([0,0,180]) idler_end();
%m8poles();
%lm8uu(lm8uu_h);
