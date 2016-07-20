class Bullet {
  float x = 100;
  float y = 100;
  boolean shot = false;
  void show() {
    ellipse (x, y, 10, 10);
  }
  void move() {
    x = x + 10;
  }
}