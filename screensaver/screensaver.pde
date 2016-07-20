float x, y, xSpd, ySpd, ballW, ballH;
void setup(){
  size(1440,900);
  ballW = ballH = 50;
  xSpd = random(5);
  ySpd = random(5);
  x = (int)random(ballW/2, width-ballW/2);
  y = (int)random(ballH/2, height-ballH/2);
}
void draw(){
  x = x + xSpd;
  y = y + ySpd;
  ellipse(x, y, ballW, ballH);
  if(x >= width - ballW/2){
    xSpd = -random(5);
  }
  if(x <= ballW/2){
    xSpd = random(5);
  }
  if(y >= height - ballH){
    ySpd = -random(5);
  }
  if(y <= ballH/2){
    ySpd = random(5);
  }
}