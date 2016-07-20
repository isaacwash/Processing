class Player {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  float jumpImpulse;
  float gravity;
  float yVelocity;
  PImage img;

  Player() {
    jumpImpulse = -9;
    gravity = 0.5;
    objWidth = 50;
    objHeight = 32;
    xPos = 50;
    yPos = (height/2) - objHeight;
    yVelocity = 0;
  }

  // Shows player
  void show() {
    img = loadImage("beagle.jpg");
    fill(255);
    image(img, xPos, yPos);
    //rect(xPos, yPos, objWidth, objHeight);
  }

  // Moves player down
  void move() {
    yVelocity = yVelocity + gravity;
    yPos = yPos + yVelocity;
  }

  // Moves player up
  void jump() {
    yVelocity = jumpImpulse;
  }
}