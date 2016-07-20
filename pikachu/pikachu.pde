PImage i;

void setup() {
  size(500, 500);
  img = loadImage("pikachu.png");
}

void draw() {
  image(img, 0, 0, width, height);
}