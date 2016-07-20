void setup(){
size(500,500);
background(255);
}
void draw(){
strokeWeight(5);
fill(0,0);
//rings and colors
for(int i=0; i<=2; i++){
  ellipse(100+90*i,100,75,75);
  if(i==0)
  stroke(0);
  if(i==1)
  stroke(225,14,73);
  if(i==2)
  stroke(255,203,8);
}
//more rings and colors
for(int i=3; i<=4; i++){
  ellipse(-125+90*i,140,75,75);
  if(i==3)
  stroke(0,172,78);
  if(i==4)
  stroke(0,125,185);
}
}