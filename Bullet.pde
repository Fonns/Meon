class Bullet {

  float dbulletX;
  float dbulletY;

  Bullet(float bulletX, float bulletY) {
    dbulletX = bulletX;
    dbulletY = bulletY;
  }

  void display() {

    fill(0);
    rect(dbulletX, dbulletY, 5, 5);
  }
}