void beginContact(Contact contPoint) {

  Body bodyA = contPoint.getFixtureA().getBody();
  Body bodyB = contPoint.getFixtureB().getBody();

  Object objectA = bodyA.getUserData();
  Object objectB = bodyB.getUserData();
  if (objectA == null || objectB == null) {
    return;
  } else if (objectA.getClass() == Player.class && objectB.getClass() == WeaponPUP.class) {

    Player player = (Player)objectA;
    WeaponPUP weaponPUP = (WeaponPUP)objectB;
    player.addweapon();
  } else if (objectB.getClass() == Player.class && objectA.getClass() == WeaponPUP.class) {

    Player player = (Player)objectB;
    WeaponPUP weaponPUP = (WeaponPUP)objectA;
    player.addweapon();
  } else if (objectA.getClass() == Platform.class && objectB.getClass() == Bullet.class) {

    Platform platform = (Platform)objectA;
    Bullet bullet = (Bullet)objectB;
    bullet.destroy();
  } else if (objectB.getClass() == Platform.class && objectA.getClass() == Bullet.class) {

    Platform platform = (Platform)objectB;
    Bullet bullet = (Bullet)objectA;
    bullet.destroy();
  }
}

void endContact(Contact contPoint) {
}