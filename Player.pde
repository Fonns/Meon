class Player {
  
  float w = 40;
  float h = 80;

  Player(){
    
    //definir o corpo
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(playerIx,playerIy));
  
    //criar o corpo
    playerbody = box2d.createBody(bd);

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
    playerbody.createFixture(fd);
    
  }
  
  void display(){
  
    pos = box2d.getBodyPixelCoord(playerbody);
  
    pushMatrix();
    translate(pos.x,pos.y);
    fill(127);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  
  }
  
}