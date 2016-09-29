//Sprites: biblioteca de sprites (arte do jogo)
import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

//Box2D for Processing: biblioteca de physX
import shiffman.box2d.*;

//Game Control Plus: biblioteca controlo (ps4 neste caso)
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;


//variaveis
ControlIO controlo;
ControlDevice comando;
ControlDevice comando2;

void setup(){
  
  //tamanho janela
  size(1280, 720);
  
  //inicia o ControlIO (vai ver que comandos estao ligados)
  controlo = ControlIO.getInstance(this);
  
  //procura comandos compativeis
  comando = controlo.getMatchedDevice("playerControl");
  comando2 = controlo.getMatchedDevice("player2Control");
  
}

void draw(){
  
  
  
}