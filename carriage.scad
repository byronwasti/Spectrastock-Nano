include<configuration.scad>;
use<modules.scad>;

//VARIABLES

lm8uu = 16;  //Gotta check this



//MODULES
module m8poles(){

	for(i=[-1,1,1]){
		translate([i*rod_sep,0,0]) cylinder(r=M8/2,h=rod_height,center=true);

	}
}



module carriage(){
	cube([1,1,1],center=true);

}


module connector(){

}





//DRAW
carriage();
%m8poles();

