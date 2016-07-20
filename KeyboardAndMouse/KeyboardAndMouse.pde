int xPos, yPos, mySize;
int leftX, leftY, rightX, rightY, size;
boolean onLeft, onRight;

void setup() {
  size(500, 500); // screen size
  textSize(20);
  noStroke();
  xPos = 225;
  yPos = 225;
  onLeft = false;
  onRight = false;
  leftX = 50;
  leftY = 200;
  rightX = 350;
  rightY = 200;
  size = 100;
  mySize = 50;
}

void draw() {
  // draw background
  background(100);

  fill(255);
  // display mouse location
  text("X: " + mouseX, 20, 30);
  text("Y: " + mouseY, 20, 50);

  // display key that was pressed
  if (key == CODED) {// for keys: UP, DOWN, LEFT, RIGHT, ALT, CONTROL, and SHIFT. 
    text(keyCode, 450, 30);
  } else if (key == ' ') {// for spacebar
    text("Space", 420, 30);
  } else {// other keys
    text(key, 450, 30);
  }

  // logic for moving the box
  if (keyPressed) {
    //if statement for UP
    if (keyCode == UP) {
      yPos = yPos - 5;
    }
    //if statement for DOWN
    if (keyCode == DOWN) {
      yPos = yPos + 5;
    }
    //if statement for LEFT
    if (keyCode == LEFT) {
      xPos = xPos - 5;
    }
    //if statement for RIGHT
    if (keyCode == RIGHT) {
      xPos = xPos + 5;
    }
  }

  // CODE: if mouse overlaps left box, change color and set onLeft
  fill(50);
  if (mouseX > leftX && mouseX < leftX + size && mouseY > leftY && mouseY < leftY + size) {
    fill(255);
    onLeft = true;
  }
  rect(leftX, leftY, size, size); // left box

  // CODE: if your box overlaps right box, change color and set onRight
  fill(50);
  if (xPos + mySize > rightX && xPos + mySize < rightX + size && yPos + mySize > rightY && yPos + mySize < rightY + size) {
    fill(255);
    onRight = true;
  }
  rect(rightX, rightY, size, size); // right box

  // CODE: if overlap both boxes, show text

  // your box
  fill(255, 0, 0);
  rect(xPos, yPos, 50, 50);

  if (onLeft == true && onRight == true) {
    fill(255);
    text("You win!", 200, 150);
  }
}