import processing.sound.*;
int score;
int gameState; //0 = start, 1 = running, 2 = over
Player me;
Pipe pipeOne;
SoundFile themeSong;
SoundFile pip;
PImage img;

void setup() {
  size(590, 422);
  img = loadImage("Xerus_Default_Wallpaper-750x422.jpg");
  textAlign(CENTER);
  score = 0;
  gameState = 0;
  me = new Player();
  pipeOne = new Pipe(1);
  themeSong = new SoundFile(this, "Comic Game Loop - Mischief.mp3");
  themeSong.loop(0.5);
}

void draw() {
  if (gameState == 0) {
    //game start
    background(img);
    fill(255);
    textSize(30);
    text("Flappy Dog", width/2, 200);
    textSize(18);
    text("Quite possibly the world's\nsimplest Flappy Bird clone", width/2, 250);
    textSize(24);
    text("Press the spacebar to start.", width/2, 380);
    me.show();
  }
  else if (gameState == 1) {
    //game running
    background(img);
    me.move();
    pipeOne.move();
    fill(255);
    text(score, width/2, 60);
    //check if player if offscreen
    if (me.yPos < 0 || me.yPos + me.objHeight > height) {
      gameState = 2;
    }
    //check if player hits pipe
    if (me.xPos <= pipeOne.xPos + pipeOne.objWidth
      && me.xPos + me.objWidth >= pipeOne.xPos
      && me.yPos <= pipeOne.yPos + pipeOne.objHeight
      && me.yPos + me.objHeight >= pipeOne.yPos) {
      gameState = 2;
    }
    //count score, play sound
    if (pipeOne.counted == false && pipeOne.xPos <= me.xPos) {
      score = score + 1;
      pip = new SoundFile(this, "pip.wav");
      pipeOne.counted = true;
      pip.play();
    }
  }

  //else
  if (gameState == 2) {//gameState == 2
    //game over
    fill(255);
    text("Game over.\nPress the spacebar to restart.", width/2, 250);
    themeSong.stop();
  }

  //graphics
  me.show();
  pipeOne.show();
}

void keyPressed() {
  if (key == ' ' && gameState == 0) {
    gameState = 1;
  }
  if (key == ' ' && gameState == 1) {
    me.jump();
  }
  if (key == ' ' && gameState == 2) {
    gameState = 0;
    setup(); //restarts game
  }
} 

void mousePressed() {
  if (key == ' ' && gameState == 1) {
    me.jump();
  }
}