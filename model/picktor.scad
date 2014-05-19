//If these don't load for you, make sure you have the latest version of openscad
include <MCAD/involute_gears.scad>;
include <MCAD/stepper.scad>;
include <MCAD/nuts_and_bolts.scad>;

//Set the fineness
$fn=25;


//How far the tool gear is from the stepper gear
gear_offset=28.1;
//Top and bottom tool gear diameters
tool_top_gear_diameter=19;
tool_bottom_gear_diameter=15;


needle_diameter=1.23;


//Setup for M3 hardware
screw_size=3;
screw_hole=3.7;
screw_hole_threaded=2.8;
screw_cap=6.5;
screw_cap_height=4;

module bearing_cutout(){
	difference(){
		cylinder(r=12/2,h=4,center=true);
		translate([0,0,-4/2]) cylinder(r=6/2,h=0.6,center=true);
		translate([0,0,4/2]) cylinder(r=6/2,h=0.6,center=true);
	}
}

module bearing_screw_cutout(screw_length=15,nut_hole_depth=0){
	translate([0,0,-2]){
		translate([0,0,3.5]) cylinder(r=screw_cap/2,h=screw_cap_height);
		translate([0,0,-screw_length+4]) cylinder(r=screw_hole/2,h=screw_length);
		for(i=[0:1:nut_hole_depth]){
			rotate([0,0,30]) translate([0,0,-screw_length+4-i]) nutHole(screw_size);
		}
	}
}

module brass_stub(){
	cylinder(r=(4.4+0.90)/2,h=18.7);
	translate([0,0,18.7-6]) cylinder(r=7/2,h=6);
}

module picker_needle(n=needle_diameter){
  translate([0,0,0]) cylinder(r=7.8/2,h=2.5);
  translate([0,0,2.5]) cylinder(r1=6.8/2,r2=6.5/2,h=17);
  cylinder(r=n/2,h=50.50);
}

module tool_gear(n=needle_diameter){
	difference(){
		union(){
			gear(circular_pitch=135,number_of_teeth=25,hub_thickness=0,bore_diameter=5.40,rim_thicknes=15);
			translate([0,0,14]) cylinder(r=tool_bottom_gear_diameter/2,h=25,center=true,$fn=80);
			translate([0,0,-6]) cylinder(r=tool_top_gear_diameter/2,h=12,center=true,$fn=80);
			translate([0,0,12]) cylinder(r=tool_top_gear_diameter/2,h=8,center=true,$fn=80);
			//So I wanted some way for the tool gear to turn a part dispensor ... 
			//translate([0,0,26]) scale(0.20) bevel_gear(pressure_angle=40,cone_distance=50);
		}

		rotate([0,0,0]) translate([9.25,0.25,-12]) cylinder(r=2/2,h=0.5);

		for(a=[0:360/4:360]){
			rotate([0,0,a]) translate([6,0,-12]) cube([5,0.5,0.5]);
		}
		for(a=[0:360/4:360]){
			rotate([0,0,a+45]) translate([8,0,-12]) cube([5,0.5,0.5]);
		}

		translate([0,0,-12]) picker_needle(n);
		
	}
	
}

module tool_gear_cutout(){
	translate([0,0,8]) cylinder(r=tool_bottom_gear_diameter/2+1.5,h=40,center=true);
	translate([0,0,-2.5]) cylinder(r=tool_top_gear_diameter/2+1.5,h=20,center=true);
    translate([0,0,7.5]) cylinder(r=tool_top_gear_diameter/2+1.5,h=18,center=true);
}

module stepper_gear_cutout(){
	translate([0,0,-4]) cylinder(r=41.1/2,h=14);
	translate([0,0,0]) cylinder(r=28/2,h=16);
}


module stepper_gear(){
	difference(){
		gear(circular_pitch=135,number_of_teeth=50,hub_thickness=15,bore_diameter=5.40,hub_diameter=17);
		translate([0,0,11]) rotate([0,90,0]) cylinder(r=screw_hole_threaded/2,h=20,center=true);
	}
}

module tri_rotate(distance,offset=30){
	for(a=[0:360/3:360]){
		rotate([0,0,offset+a]) translate([distance,0,0]) children();
	}	
}

module stri_rotate(distance,offset=30){
	
	rotate([0,0,offset+120]) translate([distance,0,0]) children();
	rotate([0,0,offset+240]) translate([distance,0,0]) children();

	rotate([0,0,offset+60]) translate([distance,0,0]) children();
	rotate([0,0,offset-60]) translate([distance,0,0]) children();

}

module quad_rotate(distance,offset=30){
	for(a=[0:360/4:360]){
		rotate([0,0,offset+a]) translate([distance,0,0]) children();
	}	
}

module bearing_set(){
	tri_rotate((tool_top_gear_diameter+10)/2){
		bearing_cutout();
	}
}

module stepper_screw_holes(){
	for(x=[-15.5,15.5]){
		for(y=[-15.5,15.5]){
			translate([x,y,0]) children();
		}
	}
}


mount_height=36;
bearing_tightness=0.40;


module camera_mount(){
	camera_d=8.2;
	camera_angle=-53;
	difference(){
		union(){
		translate([15,0,0]) rotate([0,camera_angle,0]){
			 translate([0,0,6]) union(){
				cylinder(r=(camera_d+4)/2,h=20,center=true);
				
			 }	
			 //line pointing at where the camera would aim	
			 //cylinder(r=1/2,h=110,center=true);
		}
		translate([5+2,7.5,0]) cube([20,20,8],center=true);
		rotate([90,0,0]) difference(){
			cylinder(r=10.5/2,h=5,center=true);
			cylinder(r=screw_hole/2,h=5,center=true);

			
		}


		difference(){
		translate([0,13+3.25,0]) rotate([90,0,0]) difference(){
			union(){
				cylinder(r=22/2,h=2.5,center=true);
			}
			
		}
		for(a=[-10:1:10]){
			rotate([0,a,0]){
				translate([-8,0,0]) rotate([90,0,0]){
					cylinder(r=screw_hole/2,h=100,center=true);
				}
			}
		}
	
		}
	}
	
		translate([0,13+3.25,0]) rotate([90,0,0])  cylinder(r=screw_hole/2,h=25,center=true);	
		translate([0,15,0]) rotate([90,0,0]) cylinder(r=11/2,h=13);
		translate([15,0,0]) rotate([0,camera_angle,0]){
			translate([0,0,6]) cylinder(r=camera_d/2,h=25,center=true);
		}
	}
}


module mount_cutout(){
	
	translate([0,gear_offset+10,-mount_height/2+6]) cube([0.5,tool_bottom_gear_diameter/2+1,0.5],center=true);


	for(y=[-26,26]){
		translate([y,50,20]) rotate([90,0,0]) cylinder(r=screw_hole/2,h=40);
		translate([y,47,20]) rotate([90,0,0]) cylinder(r=screw_cap/2,h=screw_cap_height);

		translate([y,50,12-20]) rotate([90,0,0]) cylinder(r=screw_hole/2,h=40);
		translate([y,47,12-20]) rotate([90,0,0]) cylinder(r=screw_cap/2,h=screw_cap_height);

		//cutout for the camera hinge
		translate([y,gear_offset,20]) rotate([90,0,0]) cylinder(r=11/2,h=7,center=true);

		translate([y-8,gear_offset+12,20]) rotate([90,0,0]) cylinder(r=screw_hole_threaded/2,h=15,center=true);

		for(i=[0:1:5]){
			translate([y,18-i,20]) rotate([90,0,0]) scale(1.05) nutHole(screw_size);
			translate([y,18-i,12-20]) rotate([90,0,0]) scale(1.05) nutHole(screw_size);
		}
	}


	for(x=[-16,16]) {
		translate([x,24,-13]) cylinder(r=screw_hole_threaded/2,h=10,center=true);
		translate([x,24,-17.5]) cylinder(r=screw_hole/2,h=10,center=true);
	}

	translate([0,gear_offset,-mount_height+6]) brass_stub();

	translate([0,0,6]){
		cylinder(r=23/2,h=mount_height+5,center=true);
		stepper_screw_holes(){
			cylinder(r=screw_hole/2,h=mount_height+5,center=true);
			translate([0,0,mount_height/2-1.5]) cylinder(r=screw_cap/2,h=screw_cap_height,center=true);
		}
		
	}
	translate([0,gear_offset,0]){
		stri_rotate((tool_bottom_gear_diameter+10)/2,90){
			translate([0,0,18]){
				 bearing_cutout();
				 translate([0,0,-22]) cylinder(r=12/2,h=23);
				 mirror([0,0,1]) bearing_screw_cutout(8,1);
			}
		}
		tri_rotate((tool_top_gear_diameter+10)/2,30){
			translate([0,0,-6]){
				bearing_cutout();
				cylinder(r=12/2,h=10);
				bearing_screw_cutout(9,3);
			}
		}
	}
	stepper_gear_cutout();
	translate([0,gear_offset,0]) tool_gear_cutout();
}

module mount_shape(){
	
	translate([0,14,20]) cube([46,66,8],center=true);
	translate([-19,43,10]) cube([8,8,mount_height-8],center=true);
	translate([19,43,10]) cube([8,8,mount_height-8],center=true);

	for(i=[-21,21]){
		translate([i,35,10]) cube([4,9,mount_height-8],center=true);
	}
	
	for(i=[-20,20]){
		translate([i,22,10]) cube([6,12,mount_height-8],center=true);
	}
	translate([0,-16,10]) cube([46,6,mount_height-8],center=true);
}


module mount(){
	difference(){
		mount_shape();
		translate([0,gear_offset+1,0]) cube([50,3,50],center=true);
    		mount_cutout();
	}
}

module mount_top(){
	difference(){
		union(){
			translate([0,4.5,-8]) cube([46,47,9],center=true);
			translate([0,22,-8]) cube([58,12,9],center=true);
		}
		mount_cutout();
	}
}

module mount_bottom(){
	difference(){
		union(){
			translate([0,4.5,20]) cube([46,47,8],center=true);
			translate([0,22,20]) cube([58,12,8],center=true);
	
			for(i=[-20,20]){
				translate([i,24,10]) cube([6,8,mount_height-8],center=true);
			}
			
			translate([0,-16,10]) cube([46,6,mount_height-8],center=true);
		}
		mount_cutout();
	}
}

//This is a the bottom plate modified to fit on an ord bot
module mount_ordbot(){
	
	xdiff = 84.972-35.028;
	ydiff = 10;
	difference(){
		union(){
			translate([0,0,20]) cube([xdiff+10,ydiff+10,8],center=true);
			mount_bottom();
		}
		mount_cutout();
		for(x=[-xdiff/2,xdiff/2]){
			for(y=[-ydiff/2,ydiff/2]){
				translate([x,y,22.5]) cylinder(r=4.2/2,h=25,center=true);
			}
		}	
	}
}



module air_hose_mount(){
	difference(){
		union(){
			translate([0,gear_offset,-14]) cube([46,15,3],center=true);
			translate([0,gear_offset,-18]) cylinder(r=11/2,h=15,center=true);
		}
		mount_cutout();
	}
}

module mount_front(){
	difference(){
		union(){
			//translate([-19,43,10]) cube([8,8,mount_height-8],center=true);
			//translate([19,43,10]) cube([8,8,mount_height-8],center=true);

			
			translate([0,36.5,20]) cube([58,13,8],center=true);
			translate([0,36.5,-8]) cube([58,13,9],center=true);
	
			for(i=[-21,21]){
				translate([i,36.5,10]) cube([6,13,mount_height-8],center=true);
			}
		}
		mount_cutout();
	}
}


module pump_mount(){
	difference(){
		union(){
			cube([50,20,12],center=true);
			translate([0,0,-16]) rotate([90,0,0]) cylinder(r=28/2,h=20,center=true);
		}
		translate([0,0,2]) rotate([0,90,0]) cylinder(r=screw_hole_threaded/2,h=55,center=true);
		translate([0,0,3]) cube([41.9,20,9],center=true);
		translate([0,0,-16]) rotate([90,0,0]) cylinder(r=25/2,h=20,center=true);
	}
}

if(print_mount_top==1){
	mirror([0,0,1]) translate([60,0,11.5]) mirror([0,0,1]) mount_top();
}
if(print_mount_front==1){
	mirror([0,0,1]) translate([0,60,-19]) rotate([90,0,0]) mount_front();		
}
if(print_mount_bottom==1){
	mirror([0,0,1]) mount_bottom();
}
if(print_tool_gear==1){
	mirror([0,0,1]) translate([-50,0,12]) mirror([0,0,1]) tool_gear();
}
if(print_pump_mount==1){	
	mirror([0,0,1]) translate([-60,40,14]) rotate([90,0,0]) pump_mount();
}
if(print_stepper_gear==1){
	mirror([0,0,1]) translate([0,-50,24]) mirror([0,0,1]) stepper_gear();
}	
if(print_air_hose_mount==1){
	mirror([0,0,1]) translate([60,15,36.5]) air_hose_mount();
}
if(print_camera_mount==1){
	mirror([0,0,1]) translate([-70,-40,24]) rotate([90,0,0]) camera_mount();
}



module view(){
	translate([26,gear_offset,20]) camera_mount();
	air_hose_mount();
	mount_front();
	mount_top();
	mount_ordbot();
	stepper_gear();
	translate([0,gear_offset,0]){
		tool_gear();
		picker_needle();
	}
}

if(show_view==1){

	view();

}









