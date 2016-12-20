void beginContact(Contact cp) {

  Fixture fix1 = cp.getFixtureA();
  Fixture fix2 = cp.getFixtureB();

  Body body1 = fix1.getBody();
  Body body2 = fix2.getBody();

  Object obj1 = body1.getUserData();
  Object obj2 = body2.getUserData();

  //bullet collision
  if (obj1.getClass() == Bullet.class && obj2.getClass() == Platform.class) {

    Bullet bullet = (Bullet) obj1;
    bullet.destroys = true;
  }

  if (obj2.getClass() == Bullet.class && obj1.getClass() == Platform.class) {

    Bullet bullet = (Bullet) obj2;
    bullet.destroys = true;
  }

  if (obj1.getClass() == Bullet.class && obj2.getClass() == PlayerOne.class) {

    Bullet bullet = (Bullet) obj1;
    bullet.destroys = true;
    player1.hpoints -= player2.damage;
  }

  if (obj2.getClass() == Bullet.class && obj1.getClass() == PlayerOne.class) {

    Bullet bullet = (Bullet) obj2;
    bullet.destroys = true;
    player1.hpoints -= player2.damage;
  }

  if (obj1.getClass() == Bullet.class && obj2.getClass() == PlayerTwo.class) {

    Bullet bullet = (Bullet) obj1;
    bullet.destroys = true;
    player2.hpoints -= player1.damage;
  }

  if (obj2.getClass() == Bullet.class && obj1.getClass() == PlayerTwo.class) {

    Bullet bullet = (Bullet) obj2;
    bullet.destroys = true;
    player2.hpoints -= player1.damage;
  }
  
  if (obj1.getClass() == Bullet.class && obj2.getClass() == Pistol.class) {

    Bullet bullet = (Bullet) obj1;
    bullet.destroys = true;
  }
  
  if (obj2.getClass() == Bullet.class && obj1.getClass() == Pistol.class) {

    Bullet bullet = (Bullet) obj2;
    bullet.destroys = true;
  }
  
  if (obj1.getClass() == Bullet.class && obj2.getClass() == Rifle.class) {

    Bullet bullet = (Bullet) obj1;
    bullet.destroys = true;
  }
  
  if (obj1.getClass() == Bullet.class && obj2.getClass() == Rifle.class) {

    Bullet bullet = (Bullet) obj2;
    bullet.destroys = true;
  }
  
  if (obj1.getClass() == Bullet.class && obj2.getClass() == Bazuka.class) {

    Bullet bullet = (Bullet) obj1;
    bullet.destroys = true;
  }
  
  if (obj2.getClass() == Bullet.class && obj1.getClass() == Bazuka.class) {

    Bullet bullet = (Bullet) obj2;
    bullet.destroys = true;
  }

  //doubleJump
  if (obj1.getClass() == PlayerOne.class && obj2.getClass() == Platform.class) {

    player1.remainJump = 3;
  }

  if (obj2.getClass() == Platform.class && obj1.getClass() == PlayerOne.class) {

    player1.remainJump = 3;
  }

  if (obj1.getClass() == PlayerOne.class && obj2.getClass() == Floor.class) {

    player1.remainJump = 3;
  }

  if (obj2.getClass() == Floor.class && obj1.getClass() == PlayerOne.class) {

    player1.remainJump = 3;
  }

  if (obj1.getClass() == PlayerTwo.class && obj2.getClass() == Platform.class) {

    player2.remainJump = 3;
  }

  if (obj2.getClass() == Platform.class && obj1.getClass() == PlayerTwo.class) {

    player2.remainJump = 3;
  }

  if (obj1.getClass() == PlayerTwo.class && obj2.getClass() == Floor.class) {

    player2.remainJump = 3;
  }

  if (obj2.getClass() == Floor.class && obj1.getClass() == PlayerTwo.class) {

    player2.remainJump = 3;
  }

  //pistolPU
  if (obj1.getClass() == Pistol.class && obj2.getClass() == PlayerOne.class) {
    if (player1.ammo <= 0) {
      Pistol pistol = (Pistol) obj1;
      pistol.destroys = true;
      player1.ammo = 6;
      player1.damage = 1;
      p1TextWep = "Pistol";
      spawns -=1;
    }
  }

  if (obj2.getClass() == Pistol.class && obj1.getClass() == PlayerOne.class) {
    if (player1.ammo <= 0) {
      Pistol pistol = (Pistol) obj2;
      pistol.destroys = true;
      player1.ammo = 6;
      player1.damage = 1;
      p1TextWep = "Pistol";
      spawns -=1;
    }
  }

  if (obj1.getClass() == Pistol.class && obj2.getClass() == PlayerTwo.class) {
    if (player2.ammo <= 0) {
      Pistol pistol = (Pistol) obj1;
      pistol.destroys = true;
      player2.ammo = 6;
      player2.damage = 1;
      p2TextWep = "Pistol";
      spawns -=1;
    }
  }

  if (obj2.getClass() == Pistol.class && obj1.getClass() == PlayerTwo.class) {
    if (player2.ammo <= 0) {
      Pistol pistol = (Pistol) obj2;
      pistol.destroys = true;
      player2.ammo = 6;
      player2.damage = 1;
      p2TextWep = "Pistol";
      spawns -=1;
    }
  }

  //riflePU
  if (obj1.getClass() == Rifle.class && obj2.getClass() == PlayerOne.class) {
    if (player1.ammo <= 0) {
      Rifle rifle = (Rifle) obj1;
      rifle.destroys = true;
      player1.ammo = 4;
      player1.damage = 2;
      p1TextWep = "Rifle";
      spawns -=1;
    }
  }

  if (obj2.getClass() == Rifle.class && obj1.getClass() == PlayerOne.class) {
    if (player1.ammo <= 0) {
      Rifle rifle = (Rifle) obj2;
      rifle.destroys = true;
      player1.ammo = 4;
      player1.damage = 2;
      p1TextWep = "Rifle";
      spawns -=1;
    }
  }

  if (obj1.getClass() == Rifle.class && obj2.getClass() == PlayerTwo.class) {
    if (player2.ammo <= 0) {
      Rifle rifle = (Rifle) obj1;
      rifle.destroys = true;
      player2.ammo = 4;
      player2.damage = 2;
      p2TextWep = "Rifle";
      spawns -=1;
    }
  }

  if (obj2.getClass() == Rifle.class && obj1.getClass() == PlayerTwo.class) {
    if (player2.ammo <= 0) {
      Rifle rifle = (Rifle) obj2;
      rifle.destroys = true;
      player2.ammo = 4;
      player2.damage = 2;
      p2TextWep = "Rifle";
      spawns -=1;
    }
  }

  //bazukaPU
  if (obj1.getClass() == Bazuka.class && obj2.getClass() == PlayerOne.class) {
    if (player1.ammo <= 0) {
      Bazuka bazuka = (Bazuka) obj1;
      bazuka.destroys = true;
      player1.ammo = 1;
      player1.damage = 14;
      p1TextWep = "Bazuka";
      spawns -=1;
    }
  }

  if (obj2.getClass() == Bazuka.class && obj1.getClass() == PlayerOne.class) {
    if (player1.ammo <= 0) {
      Bazuka bazuka = (Bazuka) obj2;
      bazuka.destroys = true;
      player1.ammo = 1;
      player1.damage = 14;
      p1TextWep = "Bazuka";
      spawns -=1;
    }
  }

  if (obj1.getClass() == Bazuka.class && obj2.getClass() == PlayerTwo.class) {
    if (player2.ammo <= 0) {
      Bazuka bazuka = (Bazuka) obj1;
      bazuka.destroys = true;
      player2.ammo = 1;
      player2.damage = 14;
      p2TextWep = "Bazuka";
      spawns -=1;
    }
  }

  if (obj2.getClass() == Bazuka.class && obj1.getClass() == PlayerTwo.class) {

    if (player2.ammo <= 0) {
      Bazuka bazuka = (Bazuka) obj2;
      bazuka.destroys = true;
      player2.ammo = 1;
      player2.damage = 14;
      p2TextWep = "Bazuka";
      spawns -=1;
    }
  }
  
  
}

void endContact(Contact cp) {
}