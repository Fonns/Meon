class Platforms {
  
  Platforms(){
    
    //definir o corpo
    BodyDef platbd = new BodyDef();
    platbd.type = BodyType.STATIC;
    platbd.position.set(box2d.coordPixelsToWorld(platX,platY));
  
    //criar o corpo
    platbody = box2d.createBody(platbd);

    //forma
    PolygonShape platps = new PolygonShape();
    platps.setAsBox(box2d.scalarPixelsToWorld(platlarg/2), box2d.scalarPixelsToWorld(platalt/2));
    
    //o que cola a forma ao corpo
    FixtureDef platfd = new FixtureDef();
    platfd.shape = platps;
    //parametros que afetam a fisica do objeto
    platfd.density = 1;
    platfd.friction = 0.5;
    platfd.restitution = 0;
  
    //colar a forma ao corpo
    playerbody.createFixture(platfd);
    
  }
  
  void display(){
    
    platpos = box2d.getBodyPixelCoord(platbody);
    
    pushMatrix();
    translate(platpos.x,platpos.y);
    fill(127);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0,0,platlarg,platalt);
    popMatrix();
  
  }
  
}