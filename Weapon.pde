class Weapon {

  float damage;
  int ammo;

  Weapon() {
  }
}

class Pistol extends Weapon {

  Pistol() {

    ammo = 6;
    damage = 1;
  }
}

class Rifle extends Weapon {

  Rifle() {

    ammo = 4;
    damage = 2;
  }
}

class Shotgun extends Weapon {

  Shotgun() {

    ammo = 2;
    damage = 8;
  }
}


class Grenade extends Weapon {

  Grenade() {

    ammo = 1;
    damage = 6;
  }
}


class Bazuka extends Weapon {

  Bazuka() {

    ammo = 1;
    damage = 14;
  }
}


class Punch extends Weapon {

  Punch() {

    float critHit = random(99);
    if (critHit < 1) {
      damage = 20;
    } else {
      damage = 0.5;
    }
  }
}