//Box2D for Processing: biblioteca de physX (mais outra)
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

//Game Control Plus: biblioteca controlo (ps4 neste caso)
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

import processing.sound.*;

//Variaveis
ControlIO controlo;
ControlDevice comando;
ControlDevice comando2;

Box2DProcessing box2d;

float fx1;
float fx2;
float fx1dir, fx2dir;

Vec2 bulletDir;
Vec2 p1Pos, p2Pos;

PlayerOne player1;
PlayerTwo player2;

ArrayList<Bullet> bullets;
ArrayList<Platform> platforms;

PImage platI;
PImage platImg;
PImage bgI;
PImage floorI;

SoundFile mainTheme;
SoundFile punchHit, punchCritHit;

void setup() {

  size(1280, 720);
  frameRate(60);

  //inicia o ControlIO (vai ver que comandos estao ligados)
  controlo = ControlIO.getInstance(this);

  //procura comandos compativeis
  comando = controlo.getMatchedDevice("playerControl");
  //comando2 = controlo.getMatchedDevice("player2Control");

  //associa funçoes a botoes (Botão para Função)
  BpFp1(); //p1 = player 1
  //BpFp2();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -90);
  box2d.listenForCollisions();

  player1 = new PlayerOne(280, 80, 39, 55);
  player2 = new PlayerTwo(1000, 80, 39, 55);

  player1.remainJump = 3;
  player2.remainJump = 3;

  p1Pos = player1.playerbody.getPosition();
  p2Pos = player2.playerbody.getPosition();

  bulletDir = new Vec2(100, 0);

  Floor floor = new Floor(640, 720, 1300, 80);
  Platform sideLeft = new Platform(0, 360, 1, 3280);
  Platform sideRight = new Platform(1280, 360, 1, 3280);
  Platform ceiling = new Platform(640, 0, 3280, 1);
  Platform stleft = new Platform(60, 90, 240, 10);
  Platform smleft = new Platform(60, 340, 120, 10);
  Platform sbleft = new Platform(60, 590, 120, 10);
  Platform stright = new Platform(1220, 90, 240, 10);
  Platform smright = new Platform(1220, 340, 120, 10);
  Platform sbright = new Platform(1220, 590, 120, 10);
  Platform mbleft = new Platform(390, 520, 330, 10);
  Platform mtleft = new Platform(390, 270, 330, 10);
  Platform mbright = new Platform(890, 520, 330, 10);
  Platform mtright = new Platform(890, 270, 330, 10);
  Platform bbcenter = new Platform(640, 150, 500, 10);
  Platform btcenter = new Platform(640, 400, 500, 10);

  platforms = new ArrayList<Platform>();
  platforms.add(floor);
  platforms.add(sideLeft);
  platforms.add(sideRight);
  platforms.add(ceiling);
  platforms.add(stleft);
  platforms.add(stright);
  platforms.add(smright);
  platforms.add(sbright);
  platforms.add(mbleft);
  platforms.add(mtleft);
  platforms.add(smleft);
  platforms.add(sbleft);
  platforms.add(mbright);
  platforms.add(mtright);
  platforms.add(bbcenter);
  platforms.add(btcenter);

  bullets = new ArrayList<Bullet>();

  platI = loadImage("PlatBig.png");
  floorI = loadImage("floor.png");
  bgI = loadImage("Backg.png");

  mainTheme = new SoundFile(this, "mainSound.mp3");
  mainTheme.amp(0.15);
  mainTheme.loop();

  punchHit = new SoundFile(this, "punchHit.mp3");
  punchHit.rate(0.5);

  punchCritHit = new SoundFile(this, "punchCritHit.mp3");
  punchCritHit.rate(0.5);
}

void draw() {

  background(bgI);
  box2d.step();

  fx1 = comando.getSlider("movX").getValue();
  //fx2 = comando2.getSlider("movX").getValue();

  for (int i=0; i<platforms.size(); i++) {
    platforms.get(i).display();
  }

  player1.display();
  p1Move();

  player2.display();
  p2Move();

  for (int i = 0; i<bullets.size(); i++) {
    bullets.get(i).display();
    bullets.get(i).destroy();
  }

  texts();

  if (player2.hpoints < 0.5) {

    background(0);
    fill(255);
    textSize(36);
    textAlign(CENTER);
    text("Player 1 wins!!", 640, 250);
  } else if (player1.hpoints < 0.5) {
    background(0);
    fill(255);
    textSize(36);
    textAlign(CENTER);
    text("Player 2 wins!!", 640, 250);
  }
}

void texts() {

  fill(255);
  textSize(16);
  textAlign(LEFT);
  text("HP: "+round(player1.hpoints), 10, 20);
  textAlign(LEFT);
  text("HP: "+round(player2.hpoints), 1220, 20);
}