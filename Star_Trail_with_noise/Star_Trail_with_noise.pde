float r, a, a2, z = 0;
float cx, cy, h=30;

void setup()
{
  smooth();
  blendMode(SCREEN);
  colorMode(HSB, 360, 100, 100);
  size(1080, 1080);
  cx = width/2;
  cy = height/2;
  noStroke();
  background(0, 0, 0);
  fill(h, 60, 70, 5);
  start();
  fill((h+180)%360, 40, 50, 10);  
  start();
}

void draw()
{
}

void start()
{
  float r1 = 1;
  float inc = .05;
  for (int i=0; i<250; i++, r1 += inc, z += .015, inc += .0001) {
    //
    drawCircle(r1, .45, 50);
  }
}

void drawCircle(float r1, float nScale, float h)
{    
  //fill(random(30, 60), random(40, 70), 100, 3);
  a = 0;
  float inc = 4/(2*PI*r);
  while (a <= 2*PI)
  {  
    r = r1 + (r1-1)*h*noise(500+nScale*cos(a), 500+nScale*sin(a), z);
    circle(cx+r*cos(a), cy+r*sin(a), 3);
    a += inc;
  }
}

void keyPressed()
{
  if (key == 'r')
  {  
    background(0, 0, 0);
    fill(h, 60, 70, 5);
    start();
    fill((h+180)%360, 40, 50, 10);  
    start();
  }

  if (keyCode == ENTER)
    saveFrame("####.jpg");
}
