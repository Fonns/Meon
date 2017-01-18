//fix temporario
void spawnSys() {

  float gen, PUgen;
  if (millis() - startTimer > 5000) {
    println(millis()-startTimer);
    if (spawns < 3) {

      gen = random(99);
      if (gen < 39) {
        pistols.add(new Pistol(random(7, 1272), random(7, 680), 25, 25));
        spawns +=1;
      }

      if (gen > 39 && gen < 74) {
        rifles.add(new Rifle(random(7, 1272), random(7, 680), 25, 25));
        spawns +=1;
      }

      if (gen > 74) {
        bazukas.add(new Bazuka(random(7, 1272), random(7, 680), 25, 25));
        spawns +=1;
      }

      startTimer = millis();
    } else {
      startTimer = millis();
    }
  }

  if (millis() - PUstartTimer > 20000) {
    PUgen = random(99);
    if (PUgen < 19) {
      PUfinals.add(new PUfinal(random(7, 1272), random(7, 680), 25, 25));
    }

    if (PUgen > 18 && PUgen < 66) {
      PUfaids.add(new PUfaid(random(7, 1272), random(7, 680), 25, 25));
    }

    if (PUgen > 65) {
      PUarmors.add(new PUarmor(random(7, 1272), random(7, 680), 25, 25));
    }
    
    PUstartTimer = millis();
  }
}