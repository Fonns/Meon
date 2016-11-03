class Bullets{
  
  float x;
  float y;
  
  Bullets(float bulletX, float bulletY){
    x = bulletX;
    y = bulletY;
  }
  
  void display(){
    
    fill(0);
    ellipse(x, y, 5, 5);
    x += 5;
  }
}

//class Pistolb extends Bullets{
//}