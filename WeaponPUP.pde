class WeaponPUP {

  Vec2 weappupPos;
  Body weappupbody;
  float dWeappupLarg;
  float dWeappupAlt;
  int ammo, damage;

  WeaponPUP(float weappupX, float weappupY, float weappupLarg, float weappupAlt) {

    //definir o corpo
    BodyDef weappupbd = new BodyDef();
    weappupbd.type = BodyType.STATIC;
    weappupbd.position.set(box2d.coordPixelsToWorld(weappupX, weappupY));

    //criar o corpo
    weappupbody = box2d.createBody(weappupbd);

    //forma
    PolygonShape weappupps = new PolygonShape();
    weappupps.setAsBox(box2d.scalarPixelsToWorld(weappupLarg/2), box2d.scalarPixelsToWorld(weappupAlt/2));


    //o que cola a forma ao corpo
    FixtureDef weappupfd = new FixtureDef();
    weappupfd.shape = weappupps;

    //parametros que afetam a fisica do objeto
    weappupfd.density = 1;
    weappupfd.friction = 0;
    weappupfd.restitution = 0;

    //colar a forma ao corpo
    weappupbody.createFixture(weappupfd);

    dWeappupLarg = weappupLarg;
    dWeappupAlt = weappupAlt;

    weappupbody.setUserData(this);
  }

  void display() {

    weappupPos = box2d.getBodyPixelCoord(weappupbody);

    pushMatrix();
    translate(weappupPos.x, weappupPos.y);
    rectMode(CENTER);
    rect(0, 0, dWeappupLarg, dWeappupAlt);
    popMatrix();
  }
}

class Pistol extends WeaponPUP {

  Pistol(float weappupX, float weappupY, float weappupLarg, float weappupAlt) {

    super(weappupX, weappupY, weappupLarg, weappupAlt);
    ammo = 6;
    damage = 1;
  }

  void display() {

    weappupPos = box2d.getBodyPixelCoord(weappupbody);

    pushMatrix();
    translate(weappupPos.x, weappupPos.y);
    rectMode(CENTER);
    rect(0, 0, dWeappupLarg, dWeappupAlt);
    popMatrix();
  }
}

class Rifle extends WeaponPUP {

  Rifle(float weappupX, float weappupY, float weappupLarg, float weappupAlt) {

    super(weappupX, weappupY, weappupLarg, weappupAlt);
    ammo = 4;
    damage = 2;
  }

  void display() {

    weappupPos = box2d.getBodyPixelCoord(weappupbody);

    pushMatrix();
    translate(weappupPos.x, weappupPos.y);
    rectMode(CENTER);
    rect(0, 0, dWeappupLarg, dWeappupAlt);
    popMatrix();
  }
}

class Shotgun extends WeaponPUP {

  Shotgun(float weappupX, float weappupY, float weappupLarg, float weappupAlt) {

    super(weappupX, weappupY, weappupLarg, weappupAlt);
    ammo = 2;
    damage = 8;
  }

  void display() {

    weappupPos = box2d.getBodyPixelCoord(weappupbody);

    pushMatrix();
    translate(weappupPos.x, weappupPos.y);
    rectMode(CENTER);
    rect(0, 0, dWeappupLarg, dWeappupAlt);
    popMatrix();
  }
}

/*class Grenade extends WeaponPUP {
 
 Grenade(float weappupX, float weappupY, float weappupLarg, float weappupAlt){
 
 super(weappupX, weappupY, weappupLarg, weappupAlt);
 ammo = 1;
 damage = 6;
 }
 
 void display() {
 
 weappupPos = box2d.getBodyPixelCoord(weappupbody);
 
 pushMatrix();
 translate(weappupPos.x, weappupPos.y);
 rectMode(CENTER);
 rect(0, 0, dWeappupLarg, dWeappupAlt);
 popMatrix();
 }
 }*/

class Bazuka extends WeaponPUP {

  Bazuka(float weappupX, float weappupY, float weappupLarg, float weappupAlt) {

    super(weappupX, weappupY, weappupLarg, weappupAlt);
    ammo = 1;
    damage = 14;
  }

  void display() {

    weappupPos = box2d.getBodyPixelCoord(weappupbody);

    pushMatrix();
    translate(weappupPos.x, weappupPos.y);
    rectMode(CENTER);
    rect(0, 0, dWeappupLarg, dWeappupAlt);
    popMatrix();
  }
}