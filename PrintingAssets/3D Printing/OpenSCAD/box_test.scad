include <variables.scad>;
include <box.scad>;
include <maneuver_template.scad>;
include <range_ruler.scad>;
include <modules.scad>;

// translate([templateLength+2,0,tokenWidth+2])
// rotate([0, 0, 90]) 
//   singleManoeuvre();

translate([3,tokenWidth/2+2,tokenWidth/2+2])
rotate([0,90,0]) token();


translate([3,tokenWidth/2+2+tokenWidth,tokenWidth/2+2])
rotate([0,90,0]) token();


translate([4+tokenHeight,tokenWidth/2+2+tokenWidth,tokenWidth/2+2])
rotate([0,90,0]) token();

translate([5+tokenHeight*2,tokenWidth/2+2+tokenWidth,tokenWidth/2+2])
rotate([0,90,0]) token();

translate([6+tokenHeight*3,tokenWidth/2+2+tokenWidth,tokenWidth/2+2])
rotate([0,90,0]) token();

translate([7+tokenHeight*4,tokenWidth/2+2+tokenWidth,tokenWidth/2+2])
rotate([0,90,0]) token();

translate([box_length-3,tokenHeight-2-2-2-2+box_width,box_height-10])
rotate([0,-90,90]) rangeTwo();