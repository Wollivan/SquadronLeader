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
lid_length=box_length; //+ 0.5;  // inner lid lenght, add 0.2-0.5mm over box size
lid_width=box_width + 0.3;  // inner lid width, add 0.2-0.5mm over box size
lid_height=0.6 * box_height;  // lid height
lid_radius_in=box_radius_out;   // inner corner radius,the same or smaller as outer on box
lid_radius_out=2;  // outer corner radius
lid_wall_thickness=2;    // wall thickness
lid_thickness=lid_wall_thickness;  // top thickness
lid_cover_size=20; // y size of plane on cover

insert_thickness = 1;
insert_width = tokenWidth*2 + insert_thickness - tolerance;
insert_length = box_length - box_wall_thickness*2 - (tolerance*2);
insert_height = tokenWidth/2;
sideways_stacked_player = (tokenHeight*5) + 7; // 7 because 1mm for each gap between tokens, and an extra for good measure

module insertLong() {
  cube([insert_length,insert_thickness,insert_height]);
}
module insertLongShort() {
  cube([insert_thickness + sideways_stacked_player*2,insert_thickness,insert_height]);
}
module insertWide() {
  cube([insert_thickness,insert_width,insert_height]);
}
module insert() {
  translate([box_wall_thickness+tolerance, tokenWidth+box_wall_thickness, box_bottom_thickness])
    insertLongShort();

  translate([box_wall_thickness+tolerance,(tokenWidth*2)+box_wall_thickness + insert_thickness, box_bottom_thickness])
    insertLong();

  translate([box_wall_thickness + tolerance + sideways_stacked_player, box_wall_thickness + tolerance, box_bottom_thickness])
    insertWide();

  translate([box_wall_thickness + tolerance + insert_thickness + sideways_stacked_player*2, box_wall_thickness + tolerance, box_bottom_thickness])
    insertWide();
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
        #translate([lid_length*3/3.5, lid_width/1.6, -0.1])
            linear_extrude(height = lid_thickness/2) {
                resize([0, lid_cover_size, 0], auto=true)
                    import("icons/plane-model.svg", center=true);
            }
        translate([lid_length*1/20, lid_width/2, -0.1])
            linear_extrude(height = lid_thickness/4)
                mirror([0, 1, 0])
                    text("Squadron", valign="bottom");
        translate([lid_length*1/20, lid_width/2, -0.1])
            linear_extrude(height = lid_thickness/2)
                mirror([0, 1, 0])
                    text("Leader", valign="top");

        
    }
}


// Output
insert();
// box();
// translate([box_length+10, 0, 0])
// lid();