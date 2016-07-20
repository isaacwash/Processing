Bullet bullet;
boolean shot;
ArrayList<Bullet> bullets;

void setup() {
  size(500, 500); // screen size
  bullet = new Bullet();
  shot = false;
  bullets = new ArrayList<Bullet>();
}

void draw() {
  background(0);
  int x = 100;
  int y = 100;
  rect (x, y, 10, 10);
  if (keyPressed) {
    if (key == ' ') {
      bullets.add(new Bullet());
      for (int i=0; i < bullets.size(); i++) {
        bullets.get(i).shot = true;
      }
    }
  }
  for (int i=0; i < bullets.size(); i++) {
    bullets.get(i).show();
    bullets.get(i).move();
  }
}