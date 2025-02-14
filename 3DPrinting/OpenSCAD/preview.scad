include <variables.scad>;

basicAssets();
// boxV2Set();
// bigBoxSet();
// translate([0,90,0]) smallBoxSet();

module bigBoxSet() {
  color("#f0a843") import("../STLs/individual_models/v1/box_base.stl");
  translate([3+tokenWidth/2,3,0]) rotate([-90,0,0]) color("#16c2d9") playerStack();
  translate([4+tokenWidth/2+tokenWidth,3,0]) rotate([-90,0,0]) color("#fffb4a") playerStack();
  translate([3+tokenWidth/2,2+tokenWidth,0]) rotate([-90,0,0]) color("#1cad43") playerStack();
  translate([4+tokenWidth/2+tokenWidth,2+tokenWidth,0]) rotate([-90,0,0]) color("#f8903a") playerStack();

  translate([100,12,13]) rotate([0,-90,0]) rotate([0,0,90]) statDialSet("#16c2d9");
  translate([100,12+17.5+2,13]) rotate([0,-90,0]) rotate([0,0,90]) statDialSet("#fffb4a");
  translate([100,12+17.5*2+4,13]) rotate([0,-90,0]) rotate([0,0,90]) statDialSet("#1cad43");
  translate([100,12+17.5*3+6,13]) rotate([0,-90,0]) rotate([0,0,90]) statDialSet("#f8903a");

  // translate([4,76,30]) rotate([0,0,-90]) color("#f0a843",0.1) rangeFlat();
  // translate([4,55,30]) rotate([0,0,-90]) color("#f0a843",0.1) import("../STLs/manoeuvre_template.stl");
}

module smallBoxSet() {
  color("#f0a843") import("../STLs/individual_models/v1/box_base_small.stl");
  translate([3+tokenWidth/2,3,0]) rotate([-90,0,0]) color("#16c2d9") playerStack();
  translate([6+tokenWidth/2+tokenWidth,3,0]) rotate([-90,0,0]) color("#fffb4a") playerStack();
  translate([3+tokenWidth/2,2+tokenWidth,0]) rotate([-90,0,0]) color("#1cad43") playerStack();
  translate([6+tokenWidth/2+tokenWidth,2+tokenWidth,0]) rotate([-90,0,0]) color("#f8903a") playerStack();

  translate([3,60,0]) rotate([0,0,-90]) color("#f0a843") rangeStack();
  translate([4,55,30]) rotate([0,0,-90]) color("#f0a843", 0.1) import("../STLs/manoeuvre_template.stl");
}

module boxV2Set() {
  color("#b8956c") import("../STLs/box.stl");
  translate([3+tokenWidth/2,2+tokenWidth*2,0]) color("#16c2d9") playerStack();
  translate([2+tokenWidth/2+tokenWidth,2+tokenWidth*2,0]) color("#fffb4a") playerStack();
  translate([3+tokenWidth/2,2+tokenWidth,0]) color("#1cad43") playerStack();
  translate([2+tokenWidth/2+tokenWidth,2+tokenWidth,0]) color("#f8903a") playerStack();

  translate([3,65,0]) rotate([0,0,-90]) color("#b8956c", 0.1) rangeStack();
  translate([4,55,21.6]) rotate([0,0,-90]) color("#b8956c", 0.1) import("../STLs/manoeuvre_template.stl");
}

module playerStack() {
  translate([0,0,16.4]) import("../STLs/individual_models/player_plane.stl");
  translate([0,tokenWidth+5.2,12.3]) import("../STLs/individual_models/player_altitude.stl");
  translate([0,tokenWidth+5.2,8.2]) import("../STLs/individual_models/player_altitude.stl");
  translate([0,tokenWidth+5.2,4.1]) import("../STLs/individual_models/player_altitude.stl");
  translate([0,tokenWidth+5.2,0]) import("../STLs/individual_models/player_altitude.stl");
}

module statDialSet(col) {
  color("#f0a843") import("../STLs/individual_models/v1/stat_side_one.stl");
  color("#f0a843") rotate([0,0,-35]) import("../STLs/v1/stat_wheel_axel.stl");
  translate([0,0,4]) rotate([0,0,-75]) color(col) import("../STLs/individual_models/v1/stat_wheel_manoeuvrability.stl");
  translate([0,0,12.3]) rotate([0,0,-75]) color(col) import("../STLs/individual_models/v1/stat_wheel_health.stl");
  translate([0,0,20.6]) rotate([0,0,-75]) color(col) import("../STLs/individual_models/v1/stat_wheel_defence.stl");
  translate([0,0,29]) rotate([0,0,-75]) color(col) import("../STLs/individual_models/v1/stat_wheel_health.stl");
  color("#f0a843") translate([0,0,41]) mirror([0,0,1]) import("../STLs/individual_models/v1/stat_side_one.stl");
}



module rangeStack() {
  rotate([0,90,0]) translate([-8,0,4]) import("../STLs/individual_models/range_ruler_1_only.stl");
  rotate([0,90,0]) translate([-30,0,4]) import("../STLs/individual_models/range_ruler_2_only.stl");
  rotate([0,90,0]) translate([-52,0,4]) import("../STLs/individual_models/range_ruler_3_only.stl");
} 

module rangeFlat() {
  import("../STLs/individual_models/range_ruler_1_only.stl");
  translate([-8,0,0]) import("../STLs/individual_models/range_ruler_2_only.stl");
  translate([-16,0,0]) import("../STLs/individual_models/range_ruler_3_only.stl");
} 

module basicAssets() {
  rangeFlat();
  translate([125,13,0]) rotate([0,0,90]) import("../STLs/player.stl");
  translate([26,0,0]) import("../STLs/manoeuvre_template.stl");
}