void beginContact(Contact contPoint) {

  Fixture fix1 = contPoint.getFixtureA();
  Fixture fix2 = contPoint.getFixtureB();

  Body body1 = fix1.getBody();
  Body body2 = fix2.getBody();

  Object obj1 = body1.getUserData();
  Object obj2 = body2.getUserData();
  
  if(obj1 == null || obj2 == null){
  
    return;
  }

  if (obj1.getClass() == Bullet.class && obj2.getClass() == Platform.class) {

    Bullet bullet = (Bullet) obj1;
    bullet.destroy();
  }

  if (obj2.getClass() == Bullet.class && obj1.getClass() == Platform.class) {

    Bullet bullet = (Bullet) obj2;
    bullet.destroy();
  }
}

void endContact(Contact contPoint) {
}