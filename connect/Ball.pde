class Ball
{
  float bound = 160, x = 1.5;
  PVector pos, vel = new PVector(3*x, 4*x);
  
  Ball(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void update()
  {
    pos.add(vel);
    if(pos.x<bound || pos.x>width-bound)
      vel.x *= -1;
    if(pos.y<bound || pos.y>height-bound)
      vel.y *= -1;
  }
  
  void display()
  {
    noStroke();
    fill(210, 20, 100);
    circle(pos.x, pos.y, 20);
  }
    
}
