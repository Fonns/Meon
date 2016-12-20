class Player {

  Vec2 playerPos;
  float hpoints;
  Body playerbody;
  float dPlayerLarg;
  float dPlayerAlt;
  int remainJump;
  int damage, ammo;

  Player(float playerX, float playerY, float playerLarg, float playerAlt) {

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

    hpoints = 100;
    damage = 0;
    ammo = 0;

    playerbody.setUserData(this);
  }

  void display() {

    playerPos = box2d.getBodyPixelCoord(playerbody);

    pushMatrix();
    fill(255);
    translate(playerPos.x, playerPos.y);
    rectMode(CENTER);
    rect(0, 0, dPlayerLarg, dPlayerAlt);
    popMatrix();
  }

  void gJump () {

    remainJump -= 1;

    if (remainJump > 0) {
      playerbody.applyLinearImpulse(new Vec2(0, playerbody.getMass()*34), playerbody.getPosition(), true);
    }
  }

  void destroy() {

    box2d.destroyBody(playerbody);
  }
}

class PlayerOne extends Player {

  PlayerOne(float playerX, float playerY, float playerLarg, float playerAlt) {

    super(playerX, playerY, playerLarg, playerAlt);
  }

  void display() {

    playerPos = box2d.getBodyPixelCoord(playerbody);

    pushMatrix();
    translate(playerPos.x, playerPos.y);
    imageMode(CENTER);
    if (fx1dir < 0) {
      image(p1StillL, 0, 0, dPlayerLarg, dPlayerAlt);
    } else {
      image(p1Still, 0, 0, dPlayerLarg, dPlayerAlt);
    }
    popMatrix();
  }
}

class PlayerTwo extends Player {

  PlayerTwo(float playerX, float playerY, float playerLarg, float playerAlt) {

    super(playerX, playerY, playerLarg, playerAlt);
  }

  void display() {

    playerPos = box2d.getBodyPixelCoord(playerbody);

    pushMatrix();
    translate(playerPos.x, playerPos.y);
    imageMode(CENTER);
    if (fx2dir < 0) {
      image(p2StillL, 0, 0, dPlayerLarg, dPlayerAlt);
    } else {
      image(p2Still, 0, 0, dPlayerLarg, dPlayerAlt);
    }
    popMatrix();
  }
}