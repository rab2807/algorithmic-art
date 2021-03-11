class Particle
{
  float r, angle, pAngle, dA = .001;
  float cx, cy;
  float baseColor = 270;
  color c;

  Particle(float r, float angle)
  {
    this.r = r;
    this.angle = pAngle = angle;
    c = color(random(baseColor-30, baseColor+30), random(50, 90), random(70, 90), 50);
    strokeWeight(1.5);
  }

  void setCenter(float x, float y)
  {
    cx = x;
    cy = y;
  }

  void move()
  {
    pAngle = angle;
    angle += dA;
  }

  void display()
  {
    noStroke();
    fill(c);
    circle(cx+r*cos(angle), cy+r*sin(angle), 2);
  }
}
