import processing.sound.*;

int gameState; // 0 = start, 1 = running, 2 = over
int score;
int random;
Player shooter;
PImage background;
SoundFile bgMusic;
SoundFile bgMusic2;
SoundFile bgMusic3;
Bullet bullet;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;

void setup() {
  size(500, 500);
  textAlign(CENTER);
  gameState = 0;
  score = 0;
  shooter = new Player();
  bullet = new Bullet();
  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList<Bullet>();
  background = loadImage("backg.jpg");
  bgMusic = new SoundFile(this, "Secret Box - Original SpongeBob Dubstep Remix (Free!).mp3");
  bgMusic2 = new SoundFile(this, "Geometry Dash lvl 15 - Electrodynamix (100%).mp3");
  bgMusic3 = new SoundFile(this, "Muffoxx - CL4P-TP (Original Mix) [Borderlands 2 Dubstep].mp3");
  random = (int)random(1, 4);
  if (random == 1) {
    bgMusic.play();
    bgMusic.loop();
  }
  if (random == 2) {
    bgMusic2.play();
    bgMusic2.loop();
  }
  if (random == 3) {
    bgMusic3.play();
    bgMusic3.loop();
  }
}

void draw() {
  image(background, 0, 0, width, height);
  //Game start
  if (gameState == 0) {
    shooter.show();
    textSize(30);
    fill(255);
    text("Kirby Survival\nPress the spacebar to begin.", width/2, 110);
  }
  //Game running
  else if (gameState == 1) {
    shooter.show();
    shooter.checkBounds();
    //Show score
    fill(255);
    textSize(30);
    text(score, width/2, 60);
    //Makes enemies appear
    for (int i=0; i < 10; i++) {
      enemies.add(new Enemy());
      enemies.get(i).show();
      enemies.get(i).move();
    }
    //Show bullets
    for (int i=0; i < bullets.size(); i++) {
      if (bullets.get(i).hit == false) {
        bullets.get(i).show();
        bullets.get(i).move();
      }
      for (int j = 0; j < enemies.size(); j++) {
        if (bullets.get(i).hit == false &&
          bullets.get(i).x > enemies.get(j).xPos &&
          bullets.get(i).x < enemies.get(j).xPos + enemies.get(j).objWidth &&
          bullets.get(i).y > enemies.get(j).yPos &&
          bullets.get(i).y < enemies.get(j).yPos + enemies.get(i).objHeight) {
          score++;
          enemies.get(j).respawn();
          bullets.get(i).hit = true;
        }
      }
      //check if player hits enemy
      for (int k=0; k < enemies.size(); k++) {
        if (shooter.xPos <= enemies.get(k).xPos + enemies.get(k).objWidth
          && shooter.xPos + shooter.objWidth >= enemies.get(k).xPos
          && shooter.yPos <= enemies.get(k).yPos + enemies.get(k).objHeight
          && shooter.yPos + shooter.objHeight >= enemies.get(k).yPos) {
          gameState = 2;
        }
      }
    }
  }
  //else
  if (gameState == 2) {//gameState == 2
    //game over
    fill(255);
    textSize(30);
    text("Game over.\nPress the spacebar to restart.", width/2, 150);
    bgMusic.stop();
  }
}

void keyPressed() {
  if (key == ' ' && gameState == 0) {
    gameState = 1;
  }
  if (key == ' ' && gameState == 1) {
    bullets.add(new Bullet());
    for (int i=0; i < bullets.size(); i++) {
      bullets.get(i).shot = true;
    }
  }
  if (key == ' ' && gameState == 2) {
    score = 0;
    gameState = 0;
    shooter = new Player ();
    enemies = new ArrayList<Enemy>();
    bullets = new ArrayList<Bullet>();
  }
  if (keyCode == RIGHT) {
    shooter.moveRight();
  }
  if (keyCode == LEFT) {
    shooter.moveLeft();
  }
  if (keyCode == UP) {
    shooter.moveUp();
  }
  if (keyCode == DOWN) {
    shooter.moveDown();
  }
}