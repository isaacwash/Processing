float x, y, xSpd, ySpd, ballW, ballH;
void setup(){
  size(500,500);
  ballW = ballH = 50;
  xSpd = 5;
  ySpd = 5;
  x = (int)random(ballW/2, width-ballW/2);
  y = (int)random(ballH/2, height-ballH/2);
}
void draw(){
  x = x + xSpd;
  y = y + ySpd;
  ellipse(x, y, ballW, ballH);
  if(x >= width){
    xSpd = -5;
  }
  if(x <= 0){
    xSpd = 5;
  }
  if(y >= height){
    ySpd = -5;
  }
  if(y <= 0){
    ySpd = 5;
  }
}