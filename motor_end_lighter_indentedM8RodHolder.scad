include<configuration.scad>;
use<modules.scad>;
use<platform.scad>;


//VARIABLE
side_length = pole_center*0.866025-1;
side_width = 20;
end_height = 42;



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
				for(i=[-1:2:1]){
					rotate([0,0,i*30]) translate([i*(30-side_width/2),-side_length/2-19,0]) side_mount(i);
					translate([i*rod_sep,0,0]) rotate([0,0,0]) cylinder(r2=M8/2+2.5,r1=2,h=end_height,center=true);
					translate([i*(rod_sep-4),-8,0]) rotate([0,0,0]) cylinder(r=8,h=end_height,center=true);


				}
			}

		translate([0,0,rod_height/2+42/2-20]) m8poles();
		for(i=[-1:2:1]){
			translate([i*(rod_sep-13),-5,0]) rotate([0,0,0]) cylinder(r2=8,r1=12,h=end_height+1,center=true);
			//translate([i*(rod_sep+15),-4,0]) rotate([0,0,0]) cylinder(r2=8,r1=12,h=end_height+1,center=true);

		}
		

		}
		difference(){
			
			//MOTOR BAR (?)
			translate([0,-15,0]) cube([50,6,end_height],center=true);
			//MOTOR HOLE SLOTS
			translate([0,-12,0]) motor_holes();
			rotate([90,0,0]) cylinder(r=15,h=100,center=true);
		}
		

	}
	//%translate([0,0,rod_height/2+42/2]) m8poles();
	%translate([0,-47.5/2-25/2-5,-(end_height-42)/2]) nema17();

}


module motor_holes(){
	for(i=[-1,1,1]){
		translate([0,0,i*31/2]) for(i=[-1,1,1]){
			translate([i*32/2,0,0]) rotate([90,0,0]) cylinder(r=M3/2,h=20,center=true);
			translate([i*32/2,0,0]) rotate([90,0,0]) cylinder(r=M3/2,h=10,center=true);
		}
	}
}

module side_mount(a){

	difference(){
		cube([side_width,side_length,end_height],center=true);

		translate([-5*a,0,10]) cube([side_width,side_length-20,end_height],center=true);

		for(i=[-1,1,1]){
			translate([0,-30,i*8]) rotate([90,0,0]) cylinder(r=M4/2,h= 40,center=true);
			translate([0,0,0]) rotate([0,90,0]) cylinder(r=15,h= 40,center=true,$fn=4);
			
			translate([0,-30,end_height/2]) cylinder(r=M3/2,h= 10,center=true);
			translate([-2.5,-35.5,end_height/2-7]) cube([5,11,3]);

		}
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

