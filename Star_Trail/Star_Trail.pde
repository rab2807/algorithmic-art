Particle[] p;
int num = 800;
float cx, cy;
float baseColor = 280;

void setup()
{
  //blendMode(SCREEN);
  smooth(8);
  colorMode(HSB, 360, 100, 100);
  size(1080, 1080);
  background((baseColor+200)%360, 90, 2);
  cx = random(width/6, width*5/6);
  cy = random(height/6, height*5/6);
  p = new Particle[num];
  for (int i=0; i<num; i++) {
    p[i] = new Particle(width>height ? random(width) : random(height), random(2*PI));
    p[i].setCenter(cx, cy);
  }
}

void draw()
{
  for (int i=0; i<num; i++) {
    p[i].move();
    p[i].display();
  }
}
