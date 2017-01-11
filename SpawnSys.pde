//fix temporario
void spawnSys() {

  float gen;
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
}