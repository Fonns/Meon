class P1 {
  
  Body p1;
  
  float w, h;
  
  P1(float x, float y) {
  
    w = 40;
    h = 80;

    //definir o corpo
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
  
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
  
  void display(){

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
  
}