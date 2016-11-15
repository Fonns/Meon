class Bullet {

  Vec2 bulletPos;
  Body bulletbody;
  float dbulletLarg;
  float dbulletAlt;
  boolean destroys;

  Bullet(float bulletX, float bulletY, float bulletLarg, float bulletAlt) {

    //definir o corpo
    BodyDef bulletbd = new BodyDef();
    bulletbd.type = BodyType.DYNAMIC;
    bulletbd.bullet = true;
    bulletbd.position.set(box2d.coordPixelsToWorld(bulletX, bulletY));

    //criar o corpo
    bulletbody = box2d.createBody(bulletbd);

    //forma
    PolygonShape bulletps = new PolygonShape();
    bulletps.setAsBox(box2d.scalarPixelsToWorld(bulletLarg/2), box2d.scalarPixelsToWorld(bulletAlt/2));


    //o que cola a forma ao corpo
    FixtureDef bulletfd = new FixtureDef();
    bulletfd.shape = bulletps;

    //parametros que afetam a fisica do objeto
    bulletfd.density = 0;

    //colar a forma ao corpo
    bulletbody.createFixture(bulletfd);

    dbulletLarg = bulletLarg;
    dbulletAlt = bulletAlt;

    bulletbody.applyLinearImpulse(bulletDir, bulletbody.getWorldCenter(), true);
    //bulletbody.setLinearVelocity(new Vec2(25, 0));

    bulletbody.setUserData(this);
  }

  void display() {

    bulletPos = box2d.getBodyPixelCoord(bulletbody);

    pushMatrix();
    translate(bulletPos.x, bulletPos.y);
    rectMode(CENTER);
    rect(0, 0, dbulletLarg, dbulletAlt);
    popMatrix();
  }

  void destroy() {

    if (destroys == true) {
      println("pistola");
      bullets.remove(this);
      box2d.destroyBody(bulletbody);
    }
  }
}