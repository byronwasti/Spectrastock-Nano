//Configuration File
//Lets you adjust pretty much everything
//
//Makes it all super paramatric
//


//Configuration Block
$fn = 20;
module configBlock(){
	difference(){
		cube([15,30,10],center=true);

		union(){  //Vertical Holes
			translate([0,10,5]) rotate([0,0,0]) cylinder(r=M3/2,h=10,center=true);
			translate([0,3,5]) rotate([0,0,0]) cylinder(r=M4/2,h=10,center=true);
			translate([0,-8,5]) rotate([0,0,0]) cylinder(r=M8/2,h=10,center=true);
		}

		union(){  //Horizontal Holes
			translate([-7.5,10,0]) rotate([0,90,0]) cylinder(r=M3h/2,h=10,center=true);		
			translate([-7.5,3,0]) rotate([0,90,0]) cylinder(r=M4h/2,h=10,center=true);
			//stranslate([0,-8,0]) rotate([0,90,0]) cylinder(r=M8/2,h=10,center=true);
		}
	}
}

//Bolts
M3 = 4;
M4 = 5;
M8 = 9;

M3h = 3.7;  //Horizontal versions
M4h = 5;  //Horizontal versions
M8h = 8; //Horizontal versions

//Nuts
M3_nut = 0;
M4_nut = 0;

//Size of other parts
rod = 8;  //Dimension of smooth rod
lm8uu = 16;

/*************************
 Printer Design files now
**************************/

//basic
arm_length = 100 ; //Length of the arms based on a planned 100x100 print size
pole_center = 60 ; //The pole distance from the center of the print
rod_sep = 25 + rod/2; // pole to pole seperation for one set. Includes rod length
rod_height = 260;

//motor end effector


//Universal joints
holewidth = 6;
arm_sep = 40;



//Hotend


