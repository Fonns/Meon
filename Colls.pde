void beginContact(Contact cp) {

  Fixture fix1 = cp.getFixtureA();
  Fixture fix2 = cp.getFixtureB();

  Body body1 = fix1.getBody();
  Body body2 = fix2.getBody();

  Object obj1 = body1.getUserData();
  Object obj2 = body2.getUserData();

  if (obj1.getClass() == Bullet.class && obj2.getClass() == Platform.class) {

    Bullet bullet = (Bullet) obj1;
    bullet.destroys = true;
  }

  if (obj2.getClass() == Bullet.class && obj1.getClass() == Platform.class) {

    Bullet bullet = (Bullet) obj2;
    bullet.destroys = true;
  }
  
  if(obj1.getClass() == Bullet.class && obj2.getClass() == PlayerOne.class){
  
    Bullet bullet = (Bullet) obj1;
    bullet.destroys = true;
    player1.hpoints -= 1;
    
  }
  
  if(obj2.getClass() == Bullet.class && obj1.getClass() == PlayerOne.class){
  
    Bullet bullet = (Bullet) obj2;
    bullet.destroys = true;
    player1.hpoints -= 1;
  }
  
  if(obj1.getClass() == Bullet.class && obj2.getClass() == PlayerTwo.class){
  
    Bullet bullet = (Bullet) obj1;
    bullet.destroys = true;
    player2.hpoints -= 1;
    
  }
  
  if(obj2.getClass() == Bullet.class && obj1.getClass() == PlayerTwo.class){
  
    Bullet bullet = (Bullet) obj2;
    bullet.destroys = true;
    player2.hpoints -= 1;
  }
  
  if(obj1.getClass() == PlayerOne.class && obj2.getClass() == Platform.class){
  
    player1.remainJump = 3;
  }
  
  if(obj2.getClass() == Platform.class && obj1.getClass() == PlayerOne.class){
  
    player1.remainJump = 3;
  }
  
  if(obj1.getClass() == PlayerTwo.class && obj2.getClass() == Platform.class){
  
    player2.remainJump = 3;
  }
  
  if(obj2.getClass() == Platform.class && obj1.getClass() == PlayerTwo.class){
  
    player2.remainJump = 3;
  }
}

void endContact(Contact cp) {
}