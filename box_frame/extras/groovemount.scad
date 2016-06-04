
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
    
}

groovemount();
