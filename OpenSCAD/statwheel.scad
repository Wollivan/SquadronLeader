$t = 1;

$fn=100;
wheelWidth = 10;
wheelDia = 30;

wheelHolderWidth = wheelWidth*0.8;
wheelHolderDia = wheelDia*1.2;

axelDia= wheelDia/3;
axelLength = wheelWidth*4+(wheelWidth/2);

textHeight = 5;

magnetDia = 5;
magnetHeight = 5;


springLength = wheelDia*0.8; // determined impirically
springWidth = 1.2; // chosen arbitrarily, adjust for feel
springOffset = axelDia/2*sin(2*360/10);


wheelTotal = 10; //the nunber of sides on the wheel (and thus the nubmber of numbers

axelWall = 2;

module axel(mod){
    difference(){
        cylinder(h=axelLength, d=axelDia, $fn=10);
    
        translate([0,0,1])
        cylinder(h=axelLength+2, d=axelDia-axelWall, $fn=10);
    }
}

module axelInner(mod){
        cylinder(h=axelLength, d=axelDia-axelWall, $fn=10);
    
}
module axelHoleDif(){
    cylinder(h=axelLength, d=axelDia*2);
}

module axelHoleEnd(){
    cylinder(h=wheelWidth/2, d=axelDia, $fn=10);
}
module springs(){
    translate([-springLength/2.5,springOffset,0])
        cube([springLength/1.25,springWidth,wheelWidth]);

    rotate([0,0,36*4])
        translate([-springLength/2.5,springOffset,0])
            cube([springLength/1.25,springWidth,wheelWidth]);
    
    
    rotate([0,0,36*7])
        translate([-springLength/2.5,springOffset,0])
            cube([springLength/1.25,springWidth,wheelWidth]);
    
    
}

module numbersyy(tranXMod,tranZMod,angle, startNum,statName) {
    rotate([0,0,18])
        for (n=[startNum:startNum+9])
        rotate ([0,0,(n-1)*360/9])
            translate([wheelDia/tranXMod-2,-wheelWidth/3-wheelWidth/2,wheelWidth*tranZMod])
            //translate([wheelDia/tranXMod-2,-wheelWidth/3-wheelWidth/2,wheelWidth])
                rotate([0,90,0])
                    linear_extrude(2)
                        text(str(n), size=8);
        
            /*rotate([0,0,18])
        for (n=[0:9])
        rotate ([0,0,(n-1)*360/10])
            translate([wheelDia/tranXMod-2,-wheelWidth/3+wheelWidth,wheelWidth*tranZMod*1.05])
                rotate([0,90,0])
                    linear_extrude(2)
                        text(str(statName), size=4);*/
}

module numbers(tranXMod,tranZMod,angle, type) {
    
    rotate([0,0,18])
        for (n=[1:9])
        rotate ([0,0,(n-1)*360/10])
            translate([wheelDia/tranXMod,-wheelWidth/3,wheelWidth*tranZMod])
                rotate([0,angle,0])
                    linear_extrude(2)
                        text(str(n), size=8);
        
        
        //type
        rotate ([0,0,-18])
            translate([wheelDia/tranXMod,-wheelWidth/3,wheelWidth*tranZMod+0.75])
                rotate([0,angle,0])
                    linear_extrude(2)
                        text(type, size=8);
}

module sides(tranZ, triRot, tranTri){
    translate([0,0,tranZ])
        difference(){
            union(){
                hull(){
                    cylinder($fn=100, h=wheelHolderWidth, d=wheelHolderDia);
                    
                        translate([-wheelHolderDia/2,wheelHolderDia/2,0])
                            cube([wheelHolderDia,wheelHolderDia/8,wheelHolderWidth]);
                    
                    
                }

                translate([0,-wheelHolderDia/2+1.5,wheelHolderWidth/2+tranTri])
                    rotate([90,triRot,0])
                        cylinder($fn=3, h=1, r=3);
            }
            
            hull(){
                translate([0,wheelHolderDia/1.5,-1])
                    cylinder(d=wheelHolderDia/1.75, h=wheelHolderWidth+2);
                
                
                translate([-wheelHolderDia/3.5,wheelHolderDia/2,-1])
                    cube([wheelHolderDia/1.75,wheelHolderDia/1.75,wheelHolderWidth+2]);
            }
            
            
        }
}

module statWheel(type){
//Health Wheel #1
rotate([0,0,45])
translate([0,0,0])
    union() {
        difference(){
            color("yellow") cylinder($fn=wheelTotal, h=wheelWidth, d2=wheelHolderDia, d1=wheelHolderDia);
            
            axelHoleDif();
            
        }
//        rotate([0,0,27])
        springs();
        //numbers(2.2,0.8,70, 3, "He");
        numbers(1.9,0.8,90, type);
    }
}

module sideAxis(){
//Side #1
union() {
    sides(-wheelHolderWidth,-90,1);

        translate([0,0,-wheelWidth*0.5])
    axel();
}
}

module sideHoleOld(){
//Side #2
translate([0,0,wheelWidth*2])
    difference() {
        sides(wheelWidth*2,90,-1);
        translate([0,0,wheelWidth*2])
            axelHoleEnd();
    }
}

module sideHole(){
//Side #2
translate([0,0,wheelWidth*2.5])
        sides(wheelWidth*2,90,-1);
        //translate([0,0,wheelWidth*2])
            axelInner();
    
}

translate([0,0,0]) statWheel("H");
translate([0,0,wheelWidth]) statWheel("S");
translate([0,0,wheelWidth*2]) statWheel("D");
translate([0,0,wheelWidth*3]) statWheel("A");


sideAxis();
translate([0,0,50]) sideHole();