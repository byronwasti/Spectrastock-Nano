include<configuration.scad>;
use<modules.scad>;

$fn = 20;
test = 3;
wall = 1;
height = 4;
gap = 1.2;


module pivot(){
	difference(){
		union(){
			cylinder(r=M3/2+wall,h=height,center=true);
			hull(){	
				for(i=[-180:360:180]){
					translate([i/180*(wall+1.9),0,0]) rotate([0,i/2,0]) cylinder(r1=1.5,r2=0,h=1.5);
				}
			}
		}
		cylinder(r=M3/2,h=height+1,center=true);
	}
	
}

module arm(){

	difference(){
		
		translate([0,-3,0])cube([10,10,height],center=true);
		hull(){
			translate([0,-1,0]) cylinder(r=M3/2+wall+gap/2,h=height+1, center=true);
			translate([0,10,0]) cylinder(r=M3/2+wall+gap/2,h=height+1,center=true);

		}
		
		for(i=[-180:360:180]){
				translate([i/180*(wall+2),0,0]) rotate([0,i/2,0]) cylinder(r1=2,r2=0,h=1.5,$fn=20);
		}


	}


}




arm();
pivot();