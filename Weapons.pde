class Weapons {

  //float damage;
  //color weaponColor;
  int ammo;

  Weapons() {
  }

  void display() {

    rect(250, 500, 15, 15);
    // damage = 20;
  }
}

class Pistols extends Weapons {

  Pistols() {

    ammo = 6;
    //damage = 3;
    //weaponColor = color(30, 144, 255);
  }
}

//class Grenade extends Weapons {

//Grenade() {

//damage = 6;
//weaponColor = color(85, 107, 47);
//}
//}

//class Bazuka extends Weapons {

//Bazuka(){

//damage = 10;
// weaponColor = color(255, 140, 0);
// }
//}

//class Punch extends Weapons {

//Punch(){

//damage = 1;
//weaponColor = color(255, 215, 0);
// }
//}