include <variables.scad>;

$fn=100;
extra_space=4;
tolerance = 0.8;
///// -- parameters -- /////////
// Box
box_wall_thickness=2;
box_length = templateLength + extra_space + box_wall_thickness*2 + 5; // 5 is for the extra length from the joints on the ruler
box_width = 52 + (tokenWidth/4) + extra_space; // manuever template plus the range ruler plus a bit
box_height=tokenWidth + tokenHeight + extra_space; // this is the players pieces plus the manuever template
box_radius_out=5;  // outer corner radius
box_radius_in=3;   // inner corner radius
box_bottom_thickness=box_wall_thickness;

// Lid
lid_length=box_length + (tolerance*2); //+ 0.5;  // inner lid lenght, add 0.2-0.5mm over box size
lid_width=box_width  + (tolerance*2);  // inner lid width, add 0.2-0.5mm over box size
lid_height=0.3 * box_height;  // lid height
lid_radius_in=box_radius_out;   // inner corner radius,the same or smaller as outer on box
lid_radius_out=2;  // outer corner radius
lid_wall_thickness=2;    // wall thickness
lid_thickness=lid_wall_thickness;  // top thickness
lid_cover_size=20; // y size of plane on cover


// Insert
token_stack_height = (tokenHeight*5)+3;
inside_box_width = box_length-box_wall_thickness*2;
token_stack_width = tokenWidth+tolerance*2;

module insert() {
  difference() {
    cube([inside_box_width, box_width-box_wall_thickness*2, tokenWidth/1.5]);

    cube([token_stack_width, token_stack_height, tokenWidth]);

    translate([token_stack_width+box_wall_thickness,0,0])
      cube([token_stack_width, token_stack_height, tokenWidth]);

    translate([0, token_stack_height+box_wall_thickness,0])
      cube([token_stack_width, token_stack_height, tokenWidth]);

    translate([token_stack_width+box_wall_thickness, token_stack_height+box_wall_thickness,0])
      cube([token_stack_width, token_stack_height, tokenWidth]);

    // dice section
    
    translate([(token_stack_width+box_wall_thickness)*2, 0,0])
      cube([inside_box_width-(token_stack_width+box_wall_thickness)*2, (token_stack_height*2)+box_wall_thickness, tokenWidth]);

    // ruler section
    translate([0, (token_stack_height+box_wall_thickness)*2, 0])
      cube([inside_box_width, box_width-box_wall_thickness*2-tolerance*2, tokenWidth/1.5]);
  }
  
}


// Create box
module box_outer_cylinder () {
    cylinder (r=box_radius_out,h=box_height); }

module box_inner_cylinder () {
    cylinder (r=box_radius_in,h=box_height); }

module box () {
    difference () {
        // Outer hull
        hull () {
            translate ([box_radius_out,box_radius_out,0])
              box_outer_cylinder();
            translate ([box_radius_out,box_width-box_radius_out,0])
              box_outer_cylinder();
            translate ([box_length-box_radius_out,box_width-box_radius_out,0])
              box_outer_cylinder();
            translate ([box_length-box_radius_out,box_radius_out,0])
              box_outer_cylinder();
        }

        // Inner hull
        hull () {
            translate ([box_wall_thickness+box_radius_in,box_radius_in+box_wall_thickness,box_bottom_thickness])
              box_inner_cylinder();
            translate ([box_wall_thickness+box_radius_in,box_width-box_wall_thickness-box_radius_in,box_bottom_thickness])
              box_inner_cylinder();
            translate ([box_length-box_wall_thickness-box_radius_in,box_width-box_wall_thickness-box_radius_in,box_bottom_thickness])
              box_inner_cylinder();
            translate ([box_length-box_wall_thickness-box_radius_in,box_wall_thickness+box_radius_in,box_bottom_thickness])
              box_inner_cylinder();
        }
    }
}

// Create lid
module lid_outer_cylinder () {
    cylinder (r=lid_radius_in,h=lid_height+lid_thickness); }

module lid_inner_cylinder () {
    cylinder (r=lid_radius_out,h=lid_height+lid_thickness); }

module lid () {
    difference () {
        // Inner hull
        hull () {
            translate ([lid_radius_out-lid_wall_thickness,lid_radius_out-lid_wall_thickness,0])
              lid_inner_cylinder();
            translate ([lid_radius_out-lid_wall_thickness,lid_width-lid_radius_out+lid_wall_thickness,0])
              lid_inner_cylinder();
            translate ([lid_length-lid_radius_out+lid_wall_thickness,lid_width-lid_radius_out+lid_wall_thickness,0])
              lid_inner_cylinder();
            translate ([lid_length-lid_radius_out+lid_wall_thickness,lid_radius_out-lid_wall_thickness,0])
              lid_inner_cylinder();
        }
        // Outer hull
        hull () {
        translate ([lid_radius_in,lid_radius_in,lid_thickness])
          lid_outer_cylinder();
        translate ([lid_radius_in,lid_width-lid_radius_in,lid_thickness])
          lid_outer_cylinder();
        translate ([lid_length-lid_radius_in,lid_width-lid_radius_in,lid_thickness])
          lid_outer_cylinder();
        translate ([lid_length-lid_radius_in,lid_radius_in,lid_thickness])
          lid_outer_cylinder();
        }
        
        // Cover design
        translate([lid_length*3/3.5, lid_width/1.6, -0.1])
            linear_extrude(height = lid_thickness/2) {
                resize([0, lid_cover_size, 0], auto=true)
        rotate([0,0,-90])
                    import("icons/plane-model.svg", center=true);
            }
        translate([box_wall_thickness, 10.5+box_wall_thickness*2, -0.1])
            linear_extrude(height = lid_thickness/2)
                mirror([0, 1, 0])
                    text("Squadron", valign="bottom");
        translate([box_wall_thickness, 10.5+box_wall_thickness*2, -0.1])
            linear_extrude(height = lid_thickness/2)
                mirror([0, 1, 0])
                    text("Leader", valign="top");

        translate([box_wall_thickness, lid_width-7, -0.1])
            linear_extrude(height = lid_thickness/2)
                mirror([0, 1, 0])
                    text("A Game by Tim Smith", valign="top", size=5);

        
    }
}
module boxWithInsert() {
  union() {
    translate([box_wall_thickness, box_wall_thickness,box_bottom_thickness])
      insert();
    
    box();
  }
}

// Output

boxWithInsert();
// translate([box_length+10, 0, 0]) 
// lid();