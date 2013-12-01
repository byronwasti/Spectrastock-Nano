include<configuration.scad>;

height= 8;

module bowden_cold(){
	difference(){
		hull(){
			//cube([65,15,height],center=true);
			translate([25,0,0]) cylinder(r=6,h=height,center=true);
			translate([-25,0,0]) cylinder(r=6,h=height,center=true);

			
		}

		cylinder(r=M4/2,h=10,center=true);	
		for(i=[-1:2:1]){
			translate([i*25,0,0]) cylinder(r=M4/2,h=10,center=true);	
		}
	}
}

bowden_cold();