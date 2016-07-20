float x, y, xSpd, ySpd, ballW, ballH;
void setup() {
  size(500, 500);
  textSize(20);
  ballW = ballH = 50;
  xSpd = 5;
  ySpd = 5;
  x = (int)random(ballW/2, width - ballW/2);
  y = (int)random(ballH/2, height - ballH/2);
}
void draw() {
  background(150);
  x = x + xSpd;
  y = y + ySpd;
  rect(x, y, ballW, ballH);
  if (x >= width - ballW) {
    xSpd = -3;
  }
  if (x <= 0) {
    xSpd = 3;
  }
  if (y >= height - ballH) {
    ySpd = -3;
  }
  if (y <= 0) {
    ySpd = 3;
  }
  /* color of square...
   changes color if mouse overlaps left box */
  fill(50);
  if (mousePressed && mouseX > x && mouseX < x + ballW && mouseY > y && mouseY < y + ballW) {
    x = random(width);
    y = random(height);
    fill(255);
  }
}