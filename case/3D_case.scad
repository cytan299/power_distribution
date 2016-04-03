/*
    3D_case.scad is the code to generate a 3D case for the power distribution unit.
    Copyright (C) 2016  C.Y. Tan
    Contact: cytan299@yahoo.com

    This file is part of 3D case power distribution

    3D_case is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    derot is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with derot.  If not, see <http://www.gnu.org/licenses/>.

*/
$fn=100;

// constants
Box_round_r = 0.25;
Box_x = 8.575;
Box_y = 5.10;
Box_t = 0.125; // bottom thickness
Box_wall_t = 0.2; // wall thickness
Box_h = 1.6; // height of box (excludes bottom thickness)

Box_screw_hole_r = 0.0625;

/*
  rectangle
*/
module roundedRect(size, radius)
{
x = size[0];
y = size[1];
z = size[2];

linear_extrude(height=z)
hull()
{
    // place 4 circles in the corners, with the given radius
    translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
    circle(r=radius);

    translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
    circle(r=radius);

    translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
    circle(r=radius);

    translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
    circle(r=radius);
}
}

/*
  Standoff
*/
module standoff(xyz, height, radius, hole_radius)
{
  translate(xyz) 
  difference(){
    cylinder(h=height, r=radius);
    cylinder(h=1.5*height, r=hole_radius);
  };
}

// Make the bottom of the case
module make_bottom() {
  difference() {
    roundedRect([Box_x - Box_round_r, Box_y - Box_round_r, Box_t], Box_round_r);
    
    // the screw holes for the PCB
    translate([-3.1875,2.15, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
   
    translate([3.5125, 2.15, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
    
    translate([3.5125,0.3, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
    
    translate([3.5125,-1.550, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
    
    translate([0.7125,-0.95, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
    
    translate([-1.2375,-0.7, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
    
    translate([-1.2375,1.05, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
    
    translate([0.7125,1.05, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
    
    // the screw holes for the front cover
    translate([-4.0375, -2.30, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
    
    translate([4.0375, -2.30, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
    
    translate([4.0375, 2.30, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
    
    translate([-4.0375, 2.30, 0]) cylinder(h=3*Box_t, r=Box_screw_hole_r, center = true);
    
    // rectangular hole for the switching PS
    translate([-3.0375, -2.15, 0]) cube(size=[2.77, 1.21, 3*Box_t], center = false);
    
    // cooling slots
    for(i=[0:9]){
      translate([2.0625, 1.7663 - i*0.345, 0]) cube(size=[1.20, 0.1725, 3*Box_t],    center = false);
    }   

  }
}

module make_standoffs()
{
  // standoffs for the PCB
  PCB_standoff_height = 0.775;
  PCB_standoff_radius = 0.125;
  PCB_standoff_hole_radius = 0.0625;
  
  standoff([-3.1875,2.15,Box_t], 
           PCB_standoff_height, 
           PCB_standoff_radius,
           PCB_standoff_hole_radius);
  
  standoff([3.5125, 2.15,Box_t], 
           PCB_standoff_height, 
           PCB_standoff_radius,
           PCB_standoff_hole_radius);
  
  
  standoff([3.5125,0.3,Box_t], 
           PCB_standoff_height, 
           PCB_standoff_radius,
           PCB_standoff_hole_radius);
  
  
  standoff([3.5125,-1.550,Box_t], 
           PCB_standoff_height, 
           PCB_standoff_radius,
           PCB_standoff_hole_radius);
  
  standoff([0.7125,-0.95,Box_t], 
           PCB_standoff_height, 
           PCB_standoff_radius,
           PCB_standoff_hole_radius);
  
  standoff([-1.2375,-0.7,Box_t], 
           PCB_standoff_height, 
           PCB_standoff_radius,
           PCB_standoff_hole_radius);
  
  standoff([-1.2375,1.05,Box_t], 
           PCB_standoff_height, 
           PCB_standoff_radius,
           PCB_standoff_hole_radius);
  
  standoff([0.7125,1.05,Box_t], 
           PCB_standoff_height, 
           PCB_standoff_radius,
           PCB_standoff_hole_radius);
           
  // ****standoff for the PS  
  
  // have a cross bar to strengthen the PS standoffs
  difference() {
   translate([-2.2342, -1.2850, 0.4]) 
           cube(size=[1.5217, 0.735, 0.175], center = false);
    // rehole a standoff
    translate([-1.2375, -0.7, 0]) cylinder(h=3*Box_h, r=Box_screw_hole_r, center = true);
  }
            
  standoff([-0.8375, -1.55, 0.325],
           0.575,
           PCB_standoff_radius,
           PCB_standoff_hole_radius);
  difference(){
    translate([-0.9625, -1.55, 0]) 
           cube(size=[2*PCB_standoff_radius, 1.0, 0.575], center = false);
   
    translate([-1.0875, -1.65, 0]) 
           cube(size=[4*PCB_standoff_radius, 0.71, 0.4], center = false);
    
    // rehole the standoff
    translate([-0.8375, -1.55, 0]) cylinder(h=3*Box_h, r=Box_screw_hole_r, center = true);
    
  }  
  
  standoff([-2.1092, -1.55, 0.325],
           0.4,
           PCB_standoff_radius,
           PCB_standoff_hole_radius);
  difference(){
    translate([-2.2342, -1.55, 0]) 
           cube(size=[2*PCB_standoff_radius, 1.0, 0.575], center = false);
    
    translate([-2.3592, -1.65, 0]) 
           cube(size=[4*PCB_standoff_radius, 0.71, 0.4], center = false);
    
    // rehole the standoff
    translate([-2.1092, -1.55, 0]) cylinder(h=3*Box_h, r=Box_screw_hole_r, center = true);
                 
  }
  
  
  
  // standoffs for the front cover
  FC_standoff_radius = 0.2;
  FC_standoff_hole_radius = 0.0625;
  
  standoff([-4.0375, 2.30, Box_t], 
           Box_h, 
           FC_standoff_radius,
           FC_standoff_hole_radius);
           
  standoff([4.0375, 2.30, Box_t], 
           Box_h, 
           FC_standoff_radius,
           FC_standoff_hole_radius);
           
  standoff([4.0375, -2.30, Box_t], 
           Box_h, 
           FC_standoff_radius,
           FC_standoff_hole_radius);
           
  standoff([-4.0375, -2.30, Box_t], 
           Box_h, 
           FC_standoff_radius,
           FC_standoff_hole_radius);
           
   
}


module make_walls()
{
  
  difference() {
    translate([0,0,Box_t])
      roundedRect([Box_x - Box_round_r, Box_y - Box_round_r, Box_h], Box_round_r);
    
    translate([0,0,-Box_t])
      roundedRect([Box_x - Box_round_r - 2*Box_wall_t, /*2 times because there are 2 walls in the x and y directions*/
                   Box_y - Box_round_r - 2*Box_wall_t, 
                   1.5*Box_h], Box_round_r);
    
    // ******** re-hole the FC standoffs one more time
    translate([-4.0375, 2.30, 0]) cylinder(h=3*Box_h, r=Box_screw_hole_r, center = true);
  
    translate([-4.0375, -2.30, 0]) cylinder(h=3*Box_h, r=Box_screw_hole_r, center = true);
    
    translate([4.0375, -2.30, 0]) cylinder(h=3*Box_h, r=Box_screw_hole_r, center = true);
    
    translate([4.0375, 2.30, 0]) cylinder(h=3*Box_h, r=Box_screw_hole_r,  center = true); 
    
    // ******* make the crennelations
    // right crennalations
    CRANL_depth = 0.1;
    CRANL_length = 4.2127;
    CRANL_height = 0.0995;
    CRANL_sep = 0.2143;
    
    for(i=[0:6]){
      translate([4.1875, -2.1064, 0.125 + i*CRANL_sep]) 
             cube(size=[2*CRANL_depth, CRANL_length, CRANL_height], center = false);
    }
    // last one at the top will have to be a little bit bigger for the difference
    translate([4.1875, -2.1064, 0.125 + 7*CRANL_sep]) 
             cube(size=[2*CRANL_depth, CRANL_length, 2*CRANL_height], center = false);
    
    
    // left crennalations
    for(i=[0:6]){
      translate([-4.3875, -2.1064, 0.125 + i*CRANL_sep]) 
             cube(size=[2*CRANL_depth, CRANL_length, CRANL_height], center = false);
    }
    // last one at the top will have to be a little bit bigger for the difference
    translate([-4.3875, -2.1064, 0.125 + 7*CRANL_sep]) 
             cube(size=[2*CRANL_depth, CRANL_length, 2*CRANL_height], center = false);
    
    // front crennalations
    CRANL_length1 = 7.6877;
    for(i=[0:6]){
      translate([-3.8439, -2.65, 0.125 + i*CRANL_sep]) 
             cube(size=[CRANL_length1, 2*CRANL_depth, CRANL_height], center = false);
    }
    // last one at the top will have to be a little bit bigger for the difference 
    translate([-3.8439, -2.65, 0.125 + 7*CRANL_sep]) 
             cube(size=[CRANL_length1, 2*CRANL_depth, 2*CRANL_height], center = false);
   
    // back crennalations
    for(i=[0:6]){
      translate([-3.8439, 2.45, 0.125 + i*CRANL_sep]) 
             cube(size=[CRANL_length1, 2*CRANL_depth, CRANL_height], center = false);
    }
    // last one at the top will have to be a little bit bigger for the difference 
    translate([-3.8439, 2.45, 0.125 + 7*CRANL_sep]) 
             cube(size=[CRANL_length1, 2*CRANL_depth, 2*CRANL_height], center = false);
    
    
    // ****** make vent holes
    // right vent holes
    Vent_depth = 0.4;
    Vent_sep = 0.4291;
    Vent_height = 0.08;
    Vent_lengthA = 1.2;
    Vent_lengthB = 1.4;
    
    // rows with 3 vents
    for(i=[0:3]){
       
       translate([3.9875, -2.1064, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthA, Vent_height], center = false); 
      
      translate([3.9875, -0.7, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthB, Vent_height], center = false); 
      
      translate([3.9875, 0.9064, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthA, Vent_height], center = false);      
    }
    
   // rows with 4 vents
    Vent_lengthC = 0.4968;
    Vent_lengthD = 1.3;
    for(i=[0:2]){
       
       translate([3.9875, -2.1064, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthC, Vent_height], center = false); 
    
      translate([3.9875, -1.4032, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthD, Vent_height], center = false); 
      
      
      translate([3.9875, 0.1032, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthD, Vent_height], center = false); 
      
      translate([3.9875, 1.6095, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthC, Vent_height], center = false);
      
    } 
    
    // left vent holes  
    // rows with 3 vents
    for(i=[0:3]){
       
       translate([-4.3875, -2.1064, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthA, Vent_height], center = false); 
      
      translate([-4.3875, -0.7, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthB, Vent_height], center = false); 
      
      translate([-4.3875, 0.9064, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthA, Vent_height], center = false);      
    }
    
   // rows with 4 vents
    for(i=[0:2]){
       
       translate([-4.3875, -2.1064, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthC, Vent_height], center = false); 
    
      translate([-4.3875, -1.4032, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthD, Vent_height], center = false); 
      
      
      translate([-4.3875, 0.1032, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthD, Vent_height], center = false); 
      
      translate([-4.3875, 1.6095, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_depth, Vent_lengthC, Vent_height], center = false);
      
    }
    
    // back vent holes
    // row with 5 vent holes
    Vent_lengthE=1.3439;
    Vent_lengthF=1.4;
    for(i=[0:2]){
     translate([-3.8439, 2.15, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_lengthE, Vent_depth, Vent_height], center = false); 
      
     translate([-2.3, 2.15, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      translate([-0.7, 2.15, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      translate([0.9, 2.15, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      translate([2.5, 2.15, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
    }
    
    // row with 6 vent holes
    Vent_lengthG=0.5439;
    for(i=[0:3]){
     translate([-3.8439, 2.15, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthG, Vent_depth, Vent_height], center = false); 
      
      translate([-3.1, 2.15, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      translate([-1.5, 2.15, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      translate([0.1, 2.15, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      translate([1.7, 2.15, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      translate([3.3, 2.15, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthG, Vent_depth, Vent_height], center = false);
   
    }
    
    // front vent holes
    // row with 4 vent holes
    Vent_lengthH = 0.7;
    for(i=[0:2]){
      translate([-3.8439, -2.65, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_lengthE, Vent_depth, Vent_height], center = false);
      
      translate([-2.3, -2.65, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      translate([-0.7, -2.65, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      if(i != 2){
        translate([0.9, -2.65, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_lengthH, Vent_depth, Vent_height], center = false);
      }
      else {
        translate([0.9, -2.65, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
        translate([2.5, -2.65, 0.3570+i*Vent_sep]) 
             cube(size=[Vent_lengthE, Vent_depth, Vent_height], center = false);
      }
    
    }
    // another row with 4 vent holes
    for(i=[0:3]){
      translate([-3.8439, -2.65, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthG, Vent_depth, Vent_height], center = false);   
    
      translate([-3.1, -2.65, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      translate([-1.5, -2.65, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      translate([0.1, -2.5, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
      
      if(i>=2){
        translate([1.7, -2.5, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthF, Vent_depth, Vent_height], center = false);
        translate([3.3, -2.5, 0.1421+i*Vent_sep]) 
             cube(size=[Vent_lengthG, Vent_depth, Vent_height], center = false);
      }
      
    }
    
    // ***** make holes for the power input
    Power_plug_r = 0.25;    
    translate([2.6625, -2.45, 0.56]){
      rotate(a=90, v=[1,0,0] ) {
       cylinder(h=4*Box_wall_t, r=Power_plug_r, center = true);
      }
    }
    
    // left screw hole
    translate([2.2375, -2.45, 0.5125]){
      rotate(a=90, v=[1,0,0] ) {
       cylinder(h=4*Box_wall_t, r=Box_screw_hole_r, center = true);
      }
    }
    
    // right screw hole
    translate([3.0875, -2.45, 0.5125]){
      rotate(a=90, v=[1,0,0] ) {
       cylinder(h=4*Box_wall_t, r=Box_screw_hole_r, center = true);
      }
    }
    
    // left screw head
    Screw_head_r = 0.11;
    translate([2.2375, -2.45, 0.5125]){
      rotate(a=90, v=[1,0,0] ) {
       cylinder(h=4*Box_wall_t, r=Screw_head_r, center = false);
      }
    }
    
    // right screw head
    translate([3.0875, -2.45, 0.5125]){
      rotate(a=90, v=[1,0,0] ) {
       cylinder(h=4*Box_wall_t, r=Screw_head_r, center = false);
      }
    }
    
    
   } // difference
   
}

module make_feet()
{
  Feet_h = 0.125;
  Feet_r = Box_round_r;
  Feet_inner_r = Box_round_r - 0.06;
  translate([-4.0375, 2.30, -Feet_h]){
    difference(){
      cylinder(h=Feet_h, r=Feet_r, center = false);
      cylinder(h=4*Feet_h, r=Feet_inner_r, center=true);
    }
  }
  
  translate([4.0375, 2.30, -Feet_h]){
    difference(){
      cylinder(h=Feet_h, r=Feet_r, center = false);
      cylinder(h=4*Feet_h, r=Feet_inner_r, center=true);
    }
  }
  
  translate([4.0375, -2.30, -Feet_h]){
    difference(){
      cylinder(h=Feet_h, r=Feet_r, center = false);
      cylinder(h=4*Feet_h, r=Feet_inner_r, center=true);
    }
  }
  
  translate([-4.0375, -2.30, -Feet_h]){
    difference(){
      cylinder(h=Feet_h, r=Feet_r, center = false);
      cylinder(h=4*Feet_h, r=Feet_inner_r, center=true);
    }
  }
}

  union(){
    make_bottom();
    make_standoffs();
    make_walls();
    make_feet();
  }
