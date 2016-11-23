//isto não se faz mas medidas drásticas tiveram de ser tomadas

class PlayerOne {

  Vec2 playerPos;
  float hpoints;
  Body playerbody;
  float dPlayerLarg;
  float dPlayerAlt;
  int remainJump;

  //criar uma lista para as armas
  ArrayList<Weapon> weapons;

  PlayerOne(float playerX, float playerY, float playerLarg, float playerAlt) {

    //definir o corpo
    BodyDef playerbd = new BodyDef();
    playerbd.type = BodyType.DYNAMIC;
    playerbd.position.set(box2d.coordPixelsToWorld(playerX, playerY));

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

    hpoints = 5;

    playerbody.setUserData(this);

    weapons = new ArrayList<Weapon>();
  }

  void display() {

    playerPos = box2d.getBodyPixelCoord(playerbody);

    pushMatrix();
    translate(playerPos.x, playerPos.y);
    rectMode(CENTER);
    rect(0, 0, dPlayerLarg, dPlayerAlt);
    popMatrix();
  }

  void addweapon() {

    //weapons.add(new Pistol());
    println("pistola");
  }

  void gJump () {

    remainJump -= 1;
    
    if(remainJump > 0){
      playerbody.applyLinearImpulse(new Vec2(0, playerbody.getMass()*34), playerbody.getPosition(), true);
    }
  }
  
  void destroy(){
  
    box2d.destroyBody(playerbody);
  }
}

class PlayerTwo{

  Vec2 playerPos;
  float hpoints;
  Body playerbody;
  float dPlayerLarg;
  float dPlayerAlt;
  int remainJump;

  //criar uma lista para as armas
  ArrayList<Weapon> weapons;

  PlayerTwo(float playerX, float playerY, float playerLarg, float playerAlt) {

    //definir o corpo
    BodyDef playerbd = new BodyDef();
    playerbd.type = BodyType.DYNAMIC;
    playerbd.position.set(box2d.coordPixelsToWorld(playerX, playerY));

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

    hpoints = 5;

    playerbody.setUserData(this);

    weapons = new ArrayList<Weapon>();
  }

  void display() {

    playerPos = box2d.getBodyPixelCoord(playerbody);

    pushMatrix();
    translate(playerPos.x, playerPos.y);
    rectMode(CENTER);
    rect(0, 0, dPlayerLarg, dPlayerAlt);
    popMatrix();
  }

  void addweapon() {

    //weapons.add(new Pistol());
    println("pistola");
  }

  void gJump () {

    remainJump -= 1;
    
    if(remainJump > 0){
      playerbody.applyLinearImpulse(new Vec2(0, playerbody.getMass()*34), playerbody.getPosition(), true);
    }
  }
  
  void destroy(){
  
    box2d.destroyBody(playerbody);
  }
}