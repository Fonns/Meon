void beginContact(Contact playerPupColl) {

  Body bodyA = playerPupColl.getFixtureA().getBody();
  Body bodyB = playerPupColl.getFixtureB().getBody();

  Object objectA = bodyA.getUserData();
  Object objectB = bodyB.getUserData();
  if (objectA == null || objectB == null) {
    return;
  }
  if (objectA.getClass() == Player.class && objectB.getClass() == WeaponPUP.class) {
    Player player = (Player)objectA;
    WeaponPUP weaponPUP = (WeaponPUP)objectB;
    player.addweapon();
  }
  if (objectB.getClass() == Player.class && objectA.getClass() == WeaponPUP.class) {
    Player player = (Player)objectB;
    WeaponPUP weaponPUP = (WeaponPUP)objectA;
    player.addweapon();
  }
}

void endContact(Contact playerPupColl) {
}