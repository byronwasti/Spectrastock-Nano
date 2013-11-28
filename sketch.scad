pd = 100*sqrt(2)/2+15; //distance of poles from center
angle = 45 ; //angle of arms at rest
armlength = 100 ; //length of the arms
sep = 10 ; //seperation of poles


for(i=[0:120:360]){
	rotate([0,0,i]) translate([pd,0,0]) union(){
		translate([0,sep,0]) cylinder(h=260, r=4, center=true);
		translate([0,-sep,0]) cylinder(h=260, r=4, center=true);
	}
	rotate([0,0,i]) translate([pd-100*sin(angle)/2,0,0]) union(){
		translate([0,sep,0]) rotate([0,angle,0]) cylinder(h=armlength,r=2,center=true);
		translate([0,-sep,0]) rotate([0,angle,0]) cylinder(h=armlength,r=2,center=true);
	}

	rotate([0,0,i]) translate([-pd*sqrt(3)/2+15,0,0]) rotate([90,0,0]) cylinder(h=100*2/sqrt(2),r=3,center=true);

}


cylinder(h=50, r=15/2, center=true);

translate([0,0,-100]){
%cube([100,100,100],center=true);
%cylinder(r=50,h=100,center=true);
}