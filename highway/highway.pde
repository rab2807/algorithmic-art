particle[] p;
int num=1500;
float nScale=10, nInc=.001, xf=0, yf=0, angle;
int unit=5, i, j;

void setup()
{
  colorMode(HSB, 360, 100, 100);
  blendMode(SCREEN);
  smooth();
  size(1080, 1080);
  //fullScreen();
  p = new particle[num];
  background(180, 70, 2);
  for (int i=0; i<num; i++)
    p[i] = new particle(random(width), random(height));
}

void setVector(particle a)
{
  i = (int) (a.pos.x/unit);
  j = (int) (a.pos.y/unit);

  angle = noise(i*nInc, j*nInc) * 2 * PI * nScale;
  a.acc.x = cos(angle);
  a.acc.y = sin(angle);
}

void draw()
{    
  //fill(180, 70, 2, 40);
  //rect(0, 0, width, height);

  for (int i=0; i<num; i++) {
    setVector(p[i]);
    p[i].update();
    p[i].display();
  }
}
