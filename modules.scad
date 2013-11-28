






module hollow_cylinder(r1,r2,h,cent,fn){
	difference(){
		cylinder(r=r1,h=h,center=cent,$fn=fn);
		cylinder(r=r2,h=h+.1,center=cent,$fn=fn);
	}
}

