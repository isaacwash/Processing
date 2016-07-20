class Bullet {
  float x = shooter.xPos + 100;
  float y = shooter.yPos + shooter.objHeight/2;
  boolean shot;
  boolean hit;
  boolean bulletIsLeft = shooter.isLeft;

  Bullet() {
    shot = false;
    hit = false;
  }
  void show() {
    fill(255, 0, 0);
    ellipse (x, y, 10, 10);
  }
  void move() {
    if (bulletIsLeft == false) {
      x = x + 10;
    }
    if (bulletIsLeft == true) {
      x = x - 10;
    }
  }
}