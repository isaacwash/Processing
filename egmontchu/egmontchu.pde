import processing.sound.*;
PImage img;
SoundFile themeSong, pikachuSound;
boolean playSong;

void setup() {
  size(500, 500);
  img = loadImage("025Pikachu_OS_anime_10.png");
  themeSong = new SoundFile(this, "Also Sprach Zarathustra.mp3");
  pikachuSound = new SoundFile(this, "MacStartUp.mp3");
  themeSong.play();
  playSong = true;
}

void draw() {
  image(img, 0, 0, width, height);
  fill(128);
  text("Also Sprach Zarathustra-Kevin MacLeod (incompetech.com)-Licensed under Creative Commons: By Attribution 3.0", 6, 40);
}

void keyPressed() {
  //stops song or piece
  if (key == ' ') {
    if (playSong == true) {
      themeSong.stop();
      playSong = false;
    }
    //restarts song or piece
    else { //if(playSong == false)
      themeSong.play();
      playSong = true;
    }
  }
  if (key == '1') {
    pikachuSound.play();
  }
}