void BpFp1() {

  comando.getButton("jump").plug(this, "salto", ControlIO.ON_PRESS);
  comando.getButton("punch").plug(this, "murro", ControlIO.ON_PRESS);
  comando.getButton("grabWep").plug(this, "Aarma", ControlIO.ON_PRESS);
  comando.getButton("useWep").plug(this, "Uarma", ControlIO.ON_PRESS);
  comando.getButton("startB").plug(this, "Bstart", ControlIO.ON_PRESS);
}

void BpFp2() {

  comando2.getButton("jump").plug(this, "p2salto", ControlIO.ON_PRESS);
  comando2.getButton("punch").plug(this, "p2murro", ControlIO.ON_PRESS);
  comando2.getButton("grapWep").plug(this, "p2Aarma", ControlIO.ON_PRESS);
  comando2.getButton("useWep").plug(this, "p2Uarma", ControlIO.ON_PRESS);
  comando2.getButton("startB").plug(this, "p2Bstart", ControlIO.ON_PRESS);
}

void salto() {

  println("saltos? check");
  player1.gJump();
}

void murro() {

  println("murro check");
}

void Aarma() {  

  println("apanhar/mudar armas? check");
}

void Uarma() {

  println("usar armas? check");
}

void Bstart() {

  println(str(fx1));
}

void p2salto() {

  println("saltos? check");
  player2.gJump();
}

void p2murro() {

  println("murro check");
}

void p2Aarma() {  

  println("apanhar/mudar armas? check");
}

void p2Uarma() {

  println("usar armas? check");
}

void p2Bstart() {

  println(str(fx2));
}