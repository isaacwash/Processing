class Enemy {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  float velocity;
  PImage Enemy;
  PImage Enemy2;

  Enemy() {
    Enemy = loadImage("zombiepatrick.png");
    Enemy2 = loadImage("zombiepatrick2.png");
    velocity = 0;
    int a = (int)random(0, 2);
    if (a == 0) {
      xPos = (float)random(550, 900);
      velocity = -10;
    } else {
      xPos = (float)random(-250, 0);
      velocity = 10;
    }
    xPos = (float)random(550, 900);
    yPos = (float)random(250, 430);
    objWidth = Enemy.width;
    objHeight = Enemy.height;
  }
  //Shows enemies
  void show() {
    image(Enemy, xPos, yPos, objWidth, objHeight);
  }
  //Moves enemies
  void move() {
    xPos = xPos + velocity;
    if (xPos < 0) {
      respawn();
    }
  }
  void respawn() {
    xPos = (float)random(550, 900);
    yPos = (float)random(250, 430);
  }
}