include<configuration.scad>;
use<modules.scad>;
use<platform.scad>;


//VARIABLE
side_length = pole_center*0.866025+18;
side_width = 30;
end_height = 50;



//Testers
$fn=50;
draw_all = 0; //




//Modules
module nema17(){

	cube([42,47.5,42],center=true);
	translate([0,47.5/2+25/2,0]) rotate([90,0,0]) cylinder(r=2.5,h=25,center=true);
	translate([0,47.5/2+25/2+4,0]) rotate([90,0,0]) cylinder(r=10,h=25,center=true); //The pulley
}


module m8poles(){

	for(i=[-1,1,1]){
		translate([i*rod_sep,0,0]) cylinder(r=M8/2,h=rod_height,center=true);

	}
}

module motorend(){
	union(){
		difference(){
			union(){ //Getting the basic shape
				difference(){
					cylinder(r=42,h=end_height,center=true);
					translate([0,-42/2,0]) cube([42*2,42,51],center=true);
				}	
				rotate([0,0,30]) translate([42-side_width/2,-side_length/2,0]) side_mount();
				rotate([0,0,-30]) translate([-42+side_width/2,-side_length/2,0]) side_mount();
				
				//Nicer Additions
				

			}
	
		//GETTING THE SHAPE RIGHT	
		translate([0,10,0]) cylinder(r=23,h=51,center=true);
		//translate([0,-47.5/2-25/2-5,-(end_height-42)/2]) nema17();
		//translate([0,-35,0]) cube([50,60,51],center=true);	
		
		difference(){
			translate([0,-15,0]) cylinder(r=25,h=51,center=true);
			for(i=[-1,1,1]){
				translate([i*(rod_sep-1),-5,0]) cylinder(r=9,h=50,center=true);

			}
		}
	

		translate([0,0,rod_height/2+42/2-20]) m8poles();
		for(i=[-1,1,1]){
			translate([i*(rod_sep+6),10,35]) rotate([0,0,i*-60]) cube([27,7,100],center=true);

		}




		//Lower Print time diamonds
		translate([0,40,0]) rotate([90,0,0]) cylinder(r=16,h=30,center=true,$fn=4);
		translate([30,20,0]) rotate([90,0,-60]) cylinder(r=10,h=30,center=true,$fn=4);
		translate([-30,20,0]) rotate([90,0,60]) cylinder(r=10,h=30,center=true,$fn=4);



		


		}
		difference(){
			
			//MOTOR BAR (?)
			translate([0,-12,0]) cube([60,5,end_height],center=true);
			//MOTOR HOLE SLOTS
			translate([0,-12,0]) motor_holes();
			translate([0,-10,0]) rotate([90,0,0]) cylinder(r=15,h=20,center=true);


		}
		

	}
	//%translate([0,0,rod_height/2+42/2]) m8poles();
	//#translate([0,-47.5/2-25/2-5,-(end_height-42)/2]) nema17();

}


module motor_holes(){
	for(i=[-1,1,1]){
		translate([0,0,i*31/2]) for(i=[-1,1,1]){
			translate([i*32/2,0,0]) rotate([90,0,0]) cylinder(r=M3/2,h=20,center=true);
		}
	}
}

module side_mount(){

	difference(){
		cube([side_width,side_length,end_height],center=true);

		translate([0,-10,10]) cube([side_width-10,side_length-30,end_height],center=true);
		translate([0,-30,15]) rotate([90,0,0]) cylinder(r=M4/2,h= 40,center=true);
		translate([0,-30,-10]) rotate([90,0,0]) cylinder(r=M4/2,h= 40,center=true);
		translate([10,-35,25]) cylinder(r=M3/2,h= 10,center=true);
		translate([-10,-35,25]) cylinder(r=M3/2,h= 10,center=true);

		translate([0,-13,0]) rotate([90,0,90]) cylinder(r=15,h=31,center=true,$fn=4);




	}

}


 
/************************DRAWING************************/

if (draw_all == 1){

	for(i=[0:120:270]){

		rotate([0,0,i]) translate([0,80.6,0]) motorend();
		//%translate([0,0,100]) cylinder(r=50,h=100,center=true);

	}
}
if(draw_all == 0){
	motorend();
}


//side_mount();

//motor_holes();
//rotate([0,0,-30]) translate([0,0,100]) platform();

