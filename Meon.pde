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

//sound
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
ArrayList<Pistol> pistols;
ArrayList<Rifle> rifles;
ArrayList<Bazuka> bazukas;

ArrayList<PUarmor> PUarmors;
ArrayList<PUfaid> PUfaids;
ArrayList<PUfinal> PUfinals;

PImage platI;
PImage platImg;
PImage bgI;
PImage mainMenuI;
PImage menuCredits;
PImage menuSettings;
PImage menuControls, menuItems;
PImage floorI;
PImage p1Still, p2Still, p1StillL, p2StillL;
PImage PUarmorI, PUfinalsI, PUfaidI;
PImage aki, bazookai, pistoli;

SoundFile punchHit, punchCritHit;
SoundFile mainTheme;
SoundFile shot;
SoundFile playingTheme;

int spawns;
int startTimer, PUstartTimer;
int p1startTimer, p2startTimer;
int p1Points, p2Points;

int p1fsTimer, p1armorTimer;
int p2fsTimer, p2armorTimer;

float p1tempHealth;
float p2tempHealth;

String p1TextWep, p2TextWep;

int gameState = 0;
final int stateMMenu = 0;
final int stateGame = 1;
final int stateMenuCredits = 2;
final int stateMenuSettings = 3;
final int stateMenuControls = 4;
final int stateMenuItems = 5;

void setup() {

  size(1280, 720);
  frameRate(60);

  //inicia o ControlIO (vai ver que comandos estao ligados)
  controlo = ControlIO.getInstance(this);

  //procura comandos compativeis
  comando = controlo.getMatchedDevice("playerControl");
  comando2 = controlo.getMatchedDevice("player2Control");

  //associa funçoes a botoes (Botão para Função)
  BpFp1(); //p1 = player 1
  BpFp2();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -90);
  box2d.listenForCollisions();

  player1 = new PlayerOne(280, 80, 39, 55);
  player2 = new PlayerTwo(1000, 80, 39, 55);

  player1.remainJump = 3;
  player2.remainJump = 3;

  p1fsTimer = -10000;

  p2fsTimer = -10000;
  p1armorTimer = -10000;
  p2armorTimer = -10000;

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
  pistols = new ArrayList<Pistol>();
  rifles = new ArrayList<Rifle>();
  bazukas = new ArrayList<Bazuka>();

  PUarmors = new ArrayList<PUarmor>();
  PUfaids = new ArrayList<PUfaid>();
  PUfinals = new ArrayList<PUfinal>();

  platI = loadImage("PlatBig.png");
  floorI = loadImage("floor.png");

  bgI = loadImage("Backg.png");
  mainMenuI = loadImage("mainMenu.png");
  menuCredits = loadImage("menuCredits.png");
  menuSettings = loadImage("menuSettings.png");
  menuControls = loadImage("menuControls.png");
  menuItems = loadImage("menuItems.png");

  PUfaidI = loadImage("PUfaid.png");
  PUfinalsI = loadImage("PUfinals.png");
  PUarmorI = loadImage("PUarmor.png");

  aki = loadImage("AK.png");
  bazookai = loadImage("Bazuka.png");
  pistoli = loadImage("Pistol.png");

  p1Still = loadImage("p1Still.png");
  p2Still = loadImage("p2Still.png");
  p1StillL = loadImage("p1StillL.png");
  p2StillL = loadImage("p2StillL.png");

  mainTheme = new SoundFile(this, "mainTheme.mp3");
  mainTheme.amp(0.9);
  mainTheme.loop();

  playingTheme = new SoundFile(this, "playingMusic.mp3");
  playingTheme.amp(0.3);

  punchHit = new SoundFile(this, "punchHit.mp3");
  punchHit.rate(0.5);

  punchCritHit = new SoundFile(this, "punchCritHit.mp3");
  punchCritHit.rate(0.5);

  shot = new SoundFile(this, "shot.mp3");
  shot.rate(0.5);
}

void draw() {

  if (mousePressed) {
    println("x: " + mouseX + "; y:" + mouseY);
  }

  switch(gameState) {

  case stateMMenu:
    background(mainMenuI);

    //jogar
    if (mousePressed && mouseX > 41 && mouseY > 36 && mouseX < 136 && mouseY < 99) {
      gameState = 1;
      startTimer = 0;
      PUstartTimer = 0;
      mainTheme.stop();
      playingTheme.loop();
    }

    //creditos
    if (mousePressed && mouseX > 43 && mouseY > 144 && mouseX < 218 && mouseY < 202) {
      gameState = 2;
    }

    //settings
    if (mousePressed && mouseX > 45 && mouseY > 232 && mouseX < 238 && mouseY < 302) {
      gameState = 3;
    }

    //quit
    if (mousePressed && mouseX > 41 && mouseY > 427 && mouseX < 141 && mouseY < 487) {
      exit();
    }
    break;

  case stateMenuCredits:
    background(menuCredits);
    if (mousePressed && mouseX > 28 && mouseY > 629 && mouseX < 138 && mouseY < 697) {
      gameState = 0;
    }
    break;
  case stateMenuSettings:
    background(menuSettings);
    if (mousePressed && mouseX > 28 && mouseY > 629 && mouseX < 138 && mouseY < 697) {
      gameState = 0;
    }

    if (mousePressed && mouseX > 30 && mouseY > 45 && mouseX < 224 && mouseY < 124) {
      gameState = 4;
    }

    if (mousePressed && mouseX > 35 && mouseY > 152 && mouseX < 287 && mouseY < 229) {
      gameState = 5;
    }
    break;
  case stateMenuControls:
    background(menuControls);
    if (mousePressed && mouseX > 28 && mouseY > 629 && mouseX < 138 && mouseY < 697) {
      gameState = 3;
    }
    break;
  case stateMenuItems:
    background(menuItems);
    if (mousePressed && mouseX > 28 && mouseY > 629 && mouseX < 138 && mouseY < 697) {
      gameState = 3;
    }
    break;
  case stateGame:
    background(bgI);
    box2d.step();

    fx1 = comando.getSlider("movX").getValue();
    fx2 = comando2.getSlider("movX").getValue();

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

    for (int i = 0; i<pistols.size(); i++) {
      pistols.get(i).display();
      pistols.get(i).destroy();
    }

    for (int i = 0; i<rifles.size(); i++) {
      rifles.get(i).display();
      rifles.get(i).destroy();
    }

    for (int i = 0; i<bazukas.size(); i++) {
      bazukas.get(i).display();
      bazukas.get(i).destroy();
    }

    for (int i = 0; i<PUfinals.size(); i++) {
      PUfinals.get(i).display();
      PUfinals.get(i).destroy();
    }

    for (int i = 0; i<PUarmors.size(); i++) {
      PUarmors.get(i).display();
      PUarmors.get(i).destroy();
    }

    for (int i = 0; i<PUfaids.size(); i++) {
      PUfaids.get(i).display();
      PUfaids.get(i).destroy();
    }

    if (player1.ammo <= 0) {
      p1TextWep = "Fists";
    }

    if (player2.ammo <= 0) {
      p2TextWep = "Fists";
    }

    if (millis() - p1armorTimer < 10000) {
      player1.hpoints = p1tempHealth;
    }

    if (millis() - p2armorTimer < 10000) {
      player2.hpoints = p2tempHealth;
    }

    texts();

    spawnSys();

    if (millis() - p1startTimer > 1000) {
      player1.pickEnable = false;
      println("yey");
    }

    if (millis() - p2startTimer > 1000) {
      player2.pickEnable = false;
      println("yey");
    }

    if (player2.hpoints < 0.5) {

      p1Points +=1;
      player2.destroy();
      player2 = new PlayerTwo(1000, 80, 39, 55);
      p2Pos = player2.playerbody.getPosition();
    } else if (player1.hpoints < 0.5) {
      p2Points +=1;
      player1.destroy();
      player1 = new PlayerOne(280, 80, 39, 55);
      p1Pos = player2.playerbody.getPosition();
    }
    break;
  }
}

void texts() {

  fill(255);
  textSize(16);
  textAlign(LEFT);
  text(p1TextWep + "  " + player1.ammo, 40+10*player1.hpoints, 39);
  textAlign(RIGHT);
  text(p2TextWep + "  " + player2.ammo, 1040+(200-10*player2.hpoints), 39);
  
  textAlign(CENTER);
  text(p1Points + "   |   " + p2Points, 640, 39);

  rectMode(CORNER);
  rect(30, 25, 10*player1.hpoints, 15);

  rectMode(CORNERS);
  rect(1050+(200-10*player2.hpoints), 25, 1250, 40);
}