//Sprites: biblioteca de sprites (arte do jogo)
import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

//Box2D for Processing: biblioteca de physX (mais outra)
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

//Game Control Plus: biblioteca controlo (ps4 neste caso)
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;


//variaveis
ControlIO controlo;
ControlDevice comando;
ControlDevice comando2;
Box2DProcessing box2d;
float fx1;
float fx2;
float w, h;
Body p1;

void setup(){
  
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
  
  player1();
  
}

void draw(){
   
  background(255);
  box2d.step();
  
  fx1 = comando.getSlider("movX").getValue();
  //fx2 = comando2.getSlider("movX").getValue();
  
  //so para testar
  if(keyPressed){
    println(str(fx1));
    println(key);
  }
  
  Vec2 pos = box2d.getBodyPixelCoord(p1);
  
  pushMatrix();
  translate(pos.x,pos.y);    // Using the Vec2 position            
  fill(127);
  stroke(0);
  strokeWeight(2);
  rectMode(CENTER);
  rect(0,0,w,h);
  popMatrix();
  
}

void BpFp1(){
  
  comando.getButton("jump").plug(this, "salto", ControlIO.ON_PRESS);
  comando.getButton("punch").plug(this, "murro", ControlIO.ON_PRESS);
  comando.getButton("grabWep").plug(this, "Aarma", ControlIO.ON_PRESS);
  comando.getButton("useWep").plug(this, "Uarma", ControlIO.ON_PRESS);
  comando.getButton("startB").plug(this, "Bstart", ControlIO.ON_PRESS);
  
}

void BpFp2(){
  
  comando2.getButton("jump").plug(this, "salto", ControlIO.ON_PRESS);
  comando2.getButton("punch").plug(this, "murro", ControlIO.ON_PRESS);
  comando2.getButton("grapWep").plug(this, "Aarma", ControlIO.ON_PRESS);
  comando2.getButton("useWep").plug(this, "Uarma", ControlIO.ON_PRESS);
  
}

void salto(){

  println("saltos? check");
  
}

void murro(){

  println("murro check");

}

void Aarma(){  println("apanhar/mudar armas? check");

}

void Uarma(){

  println("usar armas? check");

}

void Bstart(){

 
}

void player1(){
  
  w = 40;
  h = 80;

  //definir o corpo
  BodyDef bd = new BodyDef();
  bd.type = BodyType.DYNAMIC;
  bd.position.set(box2d.coordPixelsToWorld(1040,360));
  
  //criar o corpo
  p1 = box2d.createBody(bd);

  //forma
  PolygonShape ps = new PolygonShape();
  ps.setAsBox(box2d.scalarPixelsToWorld(w/2), box2d.scalarPixelsToWorld(h/2));
  
  //o que cola a forma ao corpo
  FixtureDef fd = new FixtureDef();
  fd.shape = ps;
  //parametros que afetam a fisica do objeto
  fd.density = 1;
  fd.friction = 0.3;
  fd.restitution = 0;
  
  //colar a forma ao corpo
  p1.createFixture(fd);
  
}