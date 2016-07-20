class Player {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  float yVelocity;
  PImage kirby;
  PImage kirby2;
  boolean isLeft;

  Player() {
    kirby = loadImage("kirby.png");
    kirby2 = loadImage("kirby2.png");
    yVelocity = 0;
    objWidth = kirby.width;
    objHeight = kirby.height;
    xPos = 30;
    yPos = 350;
    isLeft = false;
  }

  //Shows player
  void show() {
    image(kirby, xPos, yPos, objWidth, objHeight);
    if (isLeft == true) {
      image(kirby2, xPos, yPos, objWidth, objHeight);
    } else if (isLeft == false) {
      image(kirby, xPos, yPos, objWidth, objHeight);
    }
  }
  //Moves player right
  void moveRight() {
    xPos += 20;
    isLeft = false;
  }
  //Moves player left
  void moveLeft() {
    xPos -= 20;
    isLeft = true;
  }
  //Moves player up
  void moveUp() {
    yPos -= 20;
  }
  //moves player down
  void moveDown() {
    yPos += 20;
  }
  void checkBounds() {
    // kirby stays on grass
    if (yPos <= 250) {
      yPos = 250;
    }
    if (yPos >= 430) {
      yPos = 430;
    }
    //kirby does not go off screen
    if (xPos >= 430) {
      xPos = 430;
    }
    if (xPos <= 0) {
      xPos = 0;
    }
  }
}