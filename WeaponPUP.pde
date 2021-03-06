class WeaponPUP {

  Vec2 weappupPos;
  Body weappupbody;
  float dWeappupLarg;
  float dWeappupAlt;
  int ammo, damage;
  boolean destroys;

  WeaponPUP(float weappupX, float weappupY, float weappupLarg, float weappupAlt) {

    //definir o corpo
    BodyDef weappupbd = new BodyDef();
    weappupbd.type = BodyType.DYNAMIC;
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
    weappupfd.friction = 1;
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

class PUfinal extends WeaponPUP {

  PUfinal(float weappupX, float weappupY, float weappupLarg, float weappupAlt) {

    super(weappupX, weappupY, weappupLarg, weappupAlt);
  }

  void display() {

    weappupPos = box2d.getBodyPixelCoord(weappupbody);

    pushMatrix();
    translate(weappupPos.x, weappupPos.y);
    imageMode(CENTER);
    image(PUfinalsI, 0, 0);
    popMatrix();
  }

  void destroy() {

    if (destroys == true) {
      PUfinals.remove(this);
      box2d.destroyBody(weappupbody);
    }
  }
}

class PUfaid extends WeaponPUP {

  PUfaid(float weappupX, float weappupY, float weappupLarg, float weappupAlt) {

    super(weappupX, weappupY, weappupLarg, weappupAlt);
    ammo = 6;
    damage = 1;
  }

  void display() {

    weappupPos = box2d.getBodyPixelCoord(weappupbody);

    pushMatrix();
    translate(weappupPos.x, weappupPos.y);
    imageMode(CENTER);
    image(PUfaidI, 0, 0);
    popMatrix();
  }

  void destroy() {

    if (destroys == true) {
      PUfaids.remove(this);
      box2d.destroyBody(weappupbody);
    }
  }
}

class PUarmor extends WeaponPUP {

  PUarmor(float weappupX, float weappupY, float weappupLarg, float weappupAlt) {

    super(weappupX, weappupY, weappupLarg, weappupAlt);
    ammo = 6;
    damage = 1;
  }

  void display() {

    weappupPos = box2d.getBodyPixelCoord(weappupbody);

    pushMatrix();
    translate(weappupPos.x, weappupPos.y);
    imageMode(CENTER);
    image(PUarmorI, 0, 0);
    popMatrix();
  }

  void destroy() {

    if (destroys == true) {
      PUarmors.remove(this);
      box2d.destroyBody(weappupbody);
    }
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
    imageMode(CENTER);
    image(pistoli, 0, 0);
    popMatrix();
  }

  void destroy() {

    if (destroys == true) {
      pistols.remove(this);
      box2d.destroyBody(weappupbody);
    }
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
    imageMode(CENTER);
    image(aki, 0, 0);
    popMatrix();
  }

  void destroy() {

    if (destroys == true) {
      rifles.remove(this);
      box2d.destroyBody(weappupbody);
    }
  }
}

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
    imageMode(CENTER);
    image(bazookai, 0, 0);
    popMatrix();
  }

  void destroy() {

    if (destroys == true) {
      bazukas.remove(this);
      box2d.destroyBody(weappupbody);
    }
  }
}