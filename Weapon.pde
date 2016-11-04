class Weapon {

  float damage;
  int ammo;

  Weapon() {
  }
}

class Pistol extends Weapon {

  Pistol() {

    ammo = 6;
    damage = 3;
  }
}


class Grenade extends Weapon {

  Grenade() {

    ammo = 1;
    damage = 4;
  }
}


class Bazuka extends Weapon {

  Bazuka() {

    ammo = 1;
    damage = 10;
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