void BpFp1() {

  comando.getButton("jump").plug(this, "salto", ControlIO.ON_PRESS);
  comando.getButton("punch").plug(this, "murro", ControlIO.ON_PRESS);
  comando.getButton("grabWep").plug(this, "Aarma", ControlIO.ON_PRESS);
  comando.getButton("useWep").plug(this, "Uarma", ControlIO.ON_PRESS);
}

void BpFp2() {

  comando2.getButton("jump").plug(this, "p2salto", ControlIO.ON_PRESS);
  comando2.getButton("punch").plug(this, "p2murro", ControlIO.ON_PRESS);
  comando2.getButton("grabWep").plug(this, "p2Aarma", ControlIO.ON_PRESS);
  comando2.getButton("useWep").plug(this, "p2Uarma", ControlIO.ON_PRESS);
}

void salto() {

  player1.gJump();
  if (player1.hpoints < 1 || player2.hpoints <1) {

    player1.destroy();
    player2.destroy();
    player1 = new PlayerOne(280, 80, 39, 55);
    player2 = new PlayerTwo(1000, 80, 39, 55);
    p1Pos = player1.playerbody.getPosition();
    p2Pos = player2.playerbody.getPosition();
  }
}

void murro() {

  println("murro check");
  float critHit = random(99);
  if (abs(p1Pos.x - p2Pos.x) < 5.5 && abs(p1Pos.y - p2Pos.y) < 3) {
    if (critHit < 24) {
      player2.hpoints -= 20;
      punchCritHit.play();
    } else {
      player2.hpoints -= 0.5;
      punchHit.play();
    }
  }
}

void Aarma() {  

  println("apanhar/mudar armas? check");
}

void Uarma() {

  println("usar armas? check");
  if (player1.ammo > 0) {
    player1.ammo -=1;
    if (fx1dir < 0) {
      bulletDir = new Vec2 (-100, 0);
      bullets.add(new Bullet(player1.playerPos.x - 35, player1.playerPos.y-10, 5, 5));
    } else {
      bulletDir = new Vec2 (100, 0);
      bullets.add(new Bullet(player1.playerPos.x + 35, player1.playerPos.y-10, 5, 5));
    }
  }
}

void p2salto() {

  player2.gJump();
  if (player1.hpoints < 1 || player2.hpoints <1) {

    player1.destroy();
    player2.destroy();
    player1 = new PlayerOne(280, 80, 39, 55);
    player2 = new PlayerTwo(1000, 80, 39, 55);
    p1Pos = player1.playerbody.getPosition();
    p2Pos = player2.playerbody.getPosition();
  }
}

void p2murro() {

  println("murro check");
  float critHit = random(99);
  if (abs(p1Pos.x - p2Pos.x) < 5.5 && abs(p1Pos.y - p2Pos.y) < 3) {
    if (critHit < 24) {
      player1.hpoints -= 20;
      punchCritHit.play();
    } else {
      player1.hpoints -= 0.5;
      punchHit.play();
    }
  }
}

void p2Aarma() {  

  println("apanhar/mudar armas? check");
}

void p2Uarma() {

  println("usar armas? check");

  if (player2.ammo > 0) {
    player2.ammo -=1;
    if (fx2dir < 0) {
      bulletDir = new Vec2 (-100, 0);
      bullets.add(new Bullet(player2.playerPos.x - 35, player2.playerPos.y -10, 5, 5));
    } else {
      bulletDir = new Vec2 (100, 0);
      bullets.add(new Bullet(player2.playerPos.x + 35, player2.playerPos.y -10, 5, 5));
    }
  }
}

void p1Move() {

  Vec2 speedVec = new Vec2(0, 0);
  Vec2 vel = player1.playerbody.getLinearVelocity();
  Vec2 force = new Vec2(speedVec.x-vel.x*10, 0); 

  if (fx1 > 0) {

    player1.playerbody.setLinearVelocity(new Vec2(25, vel.y));
    fx1dir = 1;
  }
  if (fx1 < 0) {

    player1.playerbody.setLinearVelocity(new Vec2(-25, vel.y));
    fx1dir = -1;
  }
  if (fx1 <= 0 && fx1 >= 0) {

    player1.playerbody.applyLinearImpulse(force, player1.playerbody.getPosition(), true);
  }
}

void p2Move() {

  Vec2 speedVec2 = new Vec2(0, 0);
  Vec2 vel2 = player2.playerbody.getLinearVelocity();
  Vec2 force2 = new Vec2(speedVec2.x-vel2.x*10, 0); 

  if (fx2 > 0) {

    player2.playerbody.setLinearVelocity(new Vec2(25, vel2.y));
    fx2dir = 1;
  }
  if (fx2 < 0) {

    player2.playerbody.setLinearVelocity(new Vec2(-25, vel2.y));
    fx2dir = -1;
  }
  if (fx2 <= 0 && fx2 >= 0) {

    player2.playerbody.applyLinearImpulse(force2, player2.playerbody.getPosition(), true);
  }
}