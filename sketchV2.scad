include<configuration.scad>;



pd = pole_center;
angle = 30 ; //angle of arms at rest

sep = rod_sep ; //seperation of poles


for(i=[0:120:360]){
	rotate([0,0,i]) translate([pd,0,0]) union(){
		translate([0,sep,0]) cylinder(h=260, r=rod/2, center=true);
		translate([0,-sep,0]) cylinder(h=260, r=rod/2, center=true);
	}
	//rotate([0,0,i]) translate([pd-100*sin(angle)/2,0,0]) union(){
		translate([50,arm_sep/2,0]) rotate([0,angle,0]) cylinder(h=arm_length,r=2,center=true);
		translate([50,-arm_sep/2,0]) rotate([0,angle,0]) cylinder(h=arm_length,r=2,center=true);
	//}

}


cylinder(h=50, r=15/2, center=true);

translate([0,0,-100]){
%cube([100,100,100],center=true);
%cylinder(r=50,h=100,center=true);
}