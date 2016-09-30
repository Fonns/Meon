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
ArrayList<P1> players;

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
  
  /*for(P1 b: players){
    b.display();
  }*/
  
}

void BpFp1(){
  
  comando.getButton("jump").plug(this, "salto", ControlIO.ON_PRESS);
  comando.getButton("punch").plug(this, "murro", ControlIO.ON_PRESS);
  comando.getButton("grabWep").plug(this, "Aarma", ControlIO.ON_PRESS);
  comando.getButton("useWep").plug(this, "Uarma", ControlIO.ON_PRESS);
  
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

  println("murros? check");

}

void Aarma(){

  println("apanhar/mudar armas? check");

}

void Uarma(){

  println("usar armas? check");

}