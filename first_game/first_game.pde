float x, y, xSpd, ySpd, ballW, ballH;
int timeStart, timeEnd, totalTime, timeLeft, score;
void setup() {
  size(500, 500);
  textSize(20);
  cursor(CROSS);
  ballW = ballH = 50;
  xSpd = 5;
  ySpd = 5;
  x = (int)random(ballW/2, width-ballW/2);
  y = (int)random(ballH/2, height-ballH/2);
  timeStart = millis();
  totalTime = 10000;
  timeEnd = timeStart + totalTime;
  score = 0;
}

void draw() {
  //update times
  timeLeft = timeEnd - millis();

  background(150);
  x = x + xSpd;
  y = y + ySpd;
  rect(x, y, ballW, ballH);
  if (x >= width - ballW) {
    xSpd = -5;
  }
  if (x <= 0) {
    xSpd = 5;
  }
  if (y <= 0) {
    ySpd = 5;
  }
  if (y >= height - ballH) {
    ySpd = -5;
  }

  /* color of square...
   changes color if box is clicked */
  fill(55);
  if (mousePressed && mouseX > x && mouseX < x + ballW && mouseY > y && mouseY < y + ballW) {
    x = random(width);
    y = random(height);
    fill(255);
    score = score + 1;
  }

  if (timeLeft < 0) {
    timeLeft = 0;
  }

  //show text: timer + score
  text("Time left: " + timeLeft, 20, 30);
  text("Score: " + score, 400, 30);
  //game over
  if (timeLeft <= 0) {
    fill(0);
    text("GAME OVER!", 200, 200);
    text("Press space to play again.", 130, 230);
    noLoop(); //stops draw from looping
  }
}

void keyPressed() {
  if (key == ' ') {
    setup();
    loop(); //continue draw loop
  }
}