class Player {

  Vec2 playerPos;
  Body playerbody;
  float dPlayerLarg;
  float dPlayerAlt;
  
  Player(float playerX, float playerY, float playerLarg, float playerAlt){
    
    //definir o corpo
    BodyDef playerbd = new BodyDef();
    playerbd.type = BodyType.DYNAMIC;
    playerbd.position.set(box2d.coordPixelsToWorld(playerX,playerY));
  
    //criar o corpo
    playerbody = box2d.createBody(playerbd);

    //forma
    PolygonShape playerps = new PolygonShape();
    playerps.setAsBox(box2d.scalarPixelsToWorld(playerLarg/2), box2d.scalarPixelsToWorld(playerAlt/2));
    
    //o que cola a forma ao corpo
    FixtureDef playerfd = new FixtureDef();
    playerfd.shape = playerps;
    //parametros que afetam a fisica do objeto
    playerfd.density = 1;
    playerfd.friction = 0;
    playerfd.restitution = 0;
  
    //colar a forma ao corpo
    playerbody.createFixture(playerfd);
    
    dPlayerLarg = playerLarg;
    dPlayerAlt = playerAlt;
    
  }
  
  void display(){
  
    playerPos = box2d.getBodyPixelCoord(playerbody);
  
    pushMatrix();
    translate(playerPos.x,playerPos.y);
    fill(127);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0,0,dPlayerLarg,dPlayerAlt);
    popMatrix();
  
  }
  
}