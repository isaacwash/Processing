void setup() {
  size(500,500);
}
void draw() {
  //shorthand for stroke(255,255,255);
  stroke(255);
  fill(255,0,0);
  ellipse(250,250,150,150);
  stroke(255);
  fill(255);
  ellipse(250,250,50,50);
triangle(18,18,81,360,360,360);
fill(0);
rect(100,100,300,100);
//...(x,y,w,h);
}