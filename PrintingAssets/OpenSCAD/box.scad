$fn=100;

///// -- parameters -- /////////
// Box
box_length=108;
box_width=83;
box_height=25.4;
box_radius_out=5;  // outer corner radius
box_radius_in=3;   // inner corner radius
box_wall_thickness=2;
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
        translate([lid_length*3/4, lid_width/2, -0.1])
            linear_extrude(height = lid_thickness/2) {
                resize([0, lid_cover_size, 0], auto=true)
                    import("plane-model.svg", center=true);
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
box();
translate([box_length+10, 0, 0])
lid();