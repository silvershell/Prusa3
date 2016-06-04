
include <../configuration.scad>

module groovemount(){
    
    difference(){
        
    translate([-12,-32,0])cube(size=[29,64,12], center=false);

    translate([-10,0,5])cube(size=[20,12.5,15], center=true);
    translate([-10,0,5+hotend_contact_h])cube(size=[20,16.5,10], center=true);

    cylinder(h=20, r=12.5/2);
    translate([0,0,hotend_contact_h])cylinder(h=20, r=16.5/2);

    translate([0,-25,0])cylinder(h=20, r=5/2);
    translate([0,25,0])cylinder(h=20, r=5/2);
    }
    
    if( use_groovemount_fanmount ){
        translate([12,0,0]) groovemountFanmountArm();
    }
}

module groovemountFanmountArm(){
    r = 3;
    width = 20;
    h = 20;
    
    difference(){
        union(){
            translate([0,-width/2,0]) cube([h,width,r*2]);
            translate([h,-width/2,r]) rotate([-90,0,0]) cylinder(r=r, h=width, $fn=32);
        }
        translate([h,-width/2-0.1,r]) rotate([-90,0,0]) cylinder(d=3.2, h=width+0.2, $fn=32);
    }
}

module groovemountFanmount(){
    r = 3;
    width = 20;
    fanW = 40;
    fanD = 36;
    fanM = 32;
    
    translate([0, -fanW/2, 0])
    difference(){
        union(){
            translate([0,0,0]) cube([8+r,40,r]);
            translate([0,fanW,r]) rotate([90,0,0]) cylinder(r=r, h=40, $fn=32);
        }
        translate([0,fanW,r]) rotate([90,0,0]) cylinder(d=3.2, h=40, $fn=32);
        translate([-r,(fanW-width)/2,0]) cube([r*2,width,r*2]);
        translate([r + (fanW-fanD)/2 + fanD/2, fanW/2, 0]) cylinder( d=fanD, h=r+0.2, $fn=64);

        translate([r + 3.6, (fanW-fanM)/2, 0]){
            cylinder( d=3.2, h=r, $fn=64);
            translate([0, fanM, 0]) cylinder( d=3.2, h=r, $fn=64);
        }
    }
}

// --------------------

groovemount();

if( use_groovemount_fanmount ){
    translate([40,0,0]) groovemountFanmount();
}
