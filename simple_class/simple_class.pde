import processing.sound.*;
BouncingBox theBox;
BouncingBall theBall;
SoundFile mySound1;

void setup() {
  size(500, 500);
  theBox = new BouncingBox();
  mySound1 = new SoundFile(this, "1.mp3");
  theBall = new BouncingBall();
}

void draw() {
  background(100);
  theBox.show();
  theBox.move();
  theBox.bounce();
  theBox.clicked();
  theBall.show();
  theBall.move();
  theBall.bounce();
  theBall.clicked();
}

class BouncingBox {
  float x, y, size, xSpeed, ySpeed;
  BouncingBox() {
    x = (int)random(width-size);
    y = (int)random(height-size);
    xSpeed = 5;//(int)random(-10, 10);
    ySpeed = 5;//(int)random(-10, 10);
    fill(255);
    size = 50;
  }

  //Draws the box
  void show() {
    rect(x, y, size, size);
  }

  //Code that shows the box 
  void move() {
    x = x + xSpeed;
    y = y + ySpeed;
  }

  //Code that handles the bouncing mechanics
  void bounce() {
    if (x >= width - size) { //bouncing right side
      xSpeed = -xSpeed;
    }
    if (x <= 0) { //bouncing left side
      xSpeed = -xSpeed;
    }
    if (y <= height - size) { //bouncing bottom side
      ySpeed = -ySpeed;
    }
    if (y >= 0) { //bouncing top side
      ySpeed = -ySpeed;
    }
  }

  //Sound plays when box is clicked
  void clicked() {
    if (mousePressed && mouseX >= x && mouseX <= x + size && mouseY >= y && mouseY <= y + size) {
      mySound1.play();
    }
  }

  //Restart program when any key is pressed
  void keyPressed() {
    setup();
  }
}

class BouncingBall extends BouncingBox {
  void show() {
    ellipse(x, y, size, size);
  }
}