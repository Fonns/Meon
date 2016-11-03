//Sprites: biblioteca de sprites (arte do jogo)
import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

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

//Variaveis
ControlIO controlo;
ControlDevice comando;
ControlDevice comando2;

Box2DProcessing box2d;

float fx1;
float fx2;

Player player1;
Player player2;

Platforms floor;
Platforms sideRight;
Platforms sideLeft;
Platforms ceiling;

WeaponPUP weaponpup;

Bullets bullet;

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

  player1 = new Player(280, 80, 39, 55);
  player2 = new Player(1000, 80, 39, 55);

  floor = new Platforms(640, 720, 1300, 80);
  sideLeft = new Platforms(0, 360, 1, 3280);
  sideRight = new Platforms(1280, 360, 1, 3280);
  ceiling = new Platforms(640, 0, 3280, 1);

  weaponpup = new WeaponPUP(450, 570, 20, 20);
}

void draw() {

  background(0);
  box2d.step();

  fx1 = comando.getSlider("movX").getValue();
  //fx2 = comando2.getSlider("movX").getValue();

  floor.display();

  player1.display();
  p1Move();

  player2.display();
  p2Move();

  texts();

  weaponpup.display();
  
  //BULLET!!
  if(bullet != null){
    bullet.display();
  }
}

//SUPER IMPORTANTE!!! (bulet stuff))


void beginContact(Contact c) {
  Body bA = c.getFixtureA().getBody();
  Body bB = c.getFixtureB().getBody();

  Object oA = bA.getUserData();
  Object oB = bB.getUserData();
  if (oA == null || oB == null) {
    return;
  }
  if (oA.getClass() == Player.class && oB.getClass() == WeaponPUP.class) {
    Player p = (Player)oA;
    WeaponPUP w = (WeaponPUP)oB;
    p.addweapon();
  }
  if (oB.getClass() == Player.class && oA.getClass() == WeaponPUP.class) {
    Player p = (Player)oB;
    WeaponPUP w = (WeaponPUP)oA;
    p.addweapon();
  }
}

void endContact(Contact c) {
}

void texts() {

  fill(255);
  textSize(16);
  textAlign(LEFT);
  text("HP: "+round(player1.hpoints), 10, 20);
  textAlign(LEFT);
  text("HP: "+round(player2.hpoints), 1220, 20);
}