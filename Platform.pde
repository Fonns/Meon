class Platform {

  Vec2 platPos;
  Body platbody;
  float dPlatLarg;
  float dPlatAlt;
  PImage platImg;

  Platform(float platX, float platY, float platLarg, float platAlt) {

    //definir o corpo
    BodyDef platbd = new BodyDef();
    platbd.type = BodyType.STATIC;
    platbd.position.set(box2d.coordPixelsToWorld(platX, platY));

    //criar o corpo
    platbody = box2d.createBody(platbd);

    //forma
    PolygonShape platps = new PolygonShape();
    platps.setAsBox(box2d.scalarPixelsToWorld(platLarg/2), box2d.scalarPixelsToWorld(platAlt/2));

    //o que cola a forma ao corpo
    FixtureDef platfd = new FixtureDef();
    platfd.shape = platps;

    //parametros que afetam a fisica do objeto
    platfd.density = 1;
    platfd.friction = 0.5;
    platfd.restitution = 0;

    //colar a forma ao corpo
    platbody.createFixture(platfd);

    dPlatLarg = platLarg;
    dPlatAlt = platAlt;

    platbody.setUserData(this);
  }

  void display() {

    platPos = box2d.getBodyPixelCoord(platbody);

    pushMatrix();
    translate(platPos.x, platPos.y);
    imageMode(CENTER);
    image(platI, 0, 0, dPlatLarg, dPlatAlt);
    popMatrix();
  }
}

class Floor extends Platform {

  Floor(float platX, float platY, float platLarg, float platAlt) {

    super(platX, platY, platLarg, platAlt);
  }

  void display() {

    platPos = box2d.getBodyPixelCoord(platbody);
    platImg = platI;

    pushMatrix();
    translate(platPos.x, platPos.y);
    imageMode(CENTER);
    image(floorI, 0, 0, dPlatLarg, dPlatAlt);
    popMatrix();
  }
}