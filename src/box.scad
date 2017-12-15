/*
# License

## Attribution-ShareAlike 4.0 International

*  License: CC BY-SA 4.0
*  Human Readable License: https://creativecommons.org/licenses/by-sa/4.0/
*  Complete Legal Terms: https://creativecommons.org/licenses/by-sa/4.0/legalcode

# Authors
*  Štěpán Škorpil (stopka@skorpils.cz)

*/

include <logo.scad>;

w=100;
h=50;
o=10;
e=0.2;
ee=0.01;
wall_w=3;
$fn = 100;
module body(iw=w,ih=h){
  minkowski(){
    cylinder(r=(iw-o)/2, h=ih-o);
    sphere(o/2);
  }
}

module half(iw=w,ih=h){
  difference(){
    body(iw,ih);
    translate([0,0,ih-o])
    cylinder(r=(iw/2)+ee, h=(o/2)+ee);
  }
}

module bottom(){
  difference(){
    half(w,h-o/2);
    translate([0,0,h/2])
    difference(){
      cylinder(r=w/2+ee, h=h/2-o+ee);
      cylinder(r=w/2-wall_w-e, h=h/2-o+2*ee);
    }
    translate([0,0,o/2])
    half(w-(4*wall_w+e),h-o/2+ee);
  }
}

module top(){
  difference(){
    half(w,h/2);
    translate([0,0,o/2])
    half(w-(4*wall_w+e),h-o/2+ee);
    translate([0,0,o/2])
    cylinder(r=w/2-wall_w, h=h-o-o/2+2*ee);
  }
}

module pic(){
  translate([0,0,-o/2-ee+wall_w/2])
  resize([0,0,wall_w/2])
  resize([w-2*o,0,0],auto=true)
  rotate([180,0,0])
  logo(wall_w/2);
}

module box(bottom=true, color=true){
  difference(){
    if(color){
      if(bottom){
        bottom();
      }else{
        top();
      }
    }
    pic();
  }
}

box(false,true);