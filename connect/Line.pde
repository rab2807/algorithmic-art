class Line
{
  PVector base, head = new PVector(0,0);
  float h = 150, hue;
  
  Line(float x, float y) {
    base = new PVector(x, y);
  }
  
  void track(PVector t) {
    head.x = base.x + h*cos(atan2(t.y - base.y, t.x - base.x)); 
    head.y = base.y + h*sin(atan2(t.y - base.y, t.x - base.x)); 
  }
  
  void setHue(float d, float unit)
  {
    hue = map(d, 0, unit*2, 180, 360);
  }
  
  void display()
  {
    strokeWeight(1);
    stroke(hue, 90, 100, 100);
    line(base.x, base.y, head.x, head.y);
  }
}
