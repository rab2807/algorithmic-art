float ctr = 0, inc = 0, r, pre = random(TWO_PI);
float xf = random(100);
boolean t;
float value;
color c;

void setup()
{
  smooth();
  colorMode(HSB, 360, 100, 100);
  size(1080, 1080);
  background(0, 0, 100);
  drawCircle();
}

void draw()
{
}

void shade(float r, float angle, float h, int n, color c)
{
  for (int i = 0; i<n; i++) {
    stroke(c, 3*(i+1)/n);
    strokeWeight(1);
    line(width/2+r*cos(angle) +5*noise(xf+100)-2.5, height/2 + r*sin(angle) + 5*noise(xf+100)-2.5, width/2 + (r - h + h*1.5*noise(xf + i*100))*cos(angle), height/2 + (r - h + h*1.5*noise(xf + i*100))*sin(angle));
  }
  xf+=.01;
}

void drawCircle()
{
  for (int i=0; i<7; i++) {
    reset();
    r = 50 + 55*i;
    inc = 1/r;
    pre = random(2*PI);
    t = false;
    for (float j=0; j<2*PI; j+=inc) {
      if (t) {
        shade(r, j+pre, 150, 40, c);
        shade(r, j+pre, 20, 20, color((hue(c)+180)%360, 70, 30));
      }
      ctr += inc;
      if (ctr>=value) {
        reset();
      }
    }
  }
}

//color pickColor()
//{
//  float x = random(99);
//  if (x<33)
//    return color(310, 50, 80);
//  else if (x<66)
//    return color(170, 40, 75);
//  else
//    return color(65, 23, 60);
//}

color pickColor()
{
  float x = random(99);
  if (x<33)
    return color(210, 40, 80);
  else if (x<66)
    return color(140, 45, 75);
  else
    return color(30, 50, 70);
}

void reset()
{
  ctr = 0;
  value = random(PI/8, PI/3);
  t = !t;
  c = pickColor();
}

void keyPressed()
{
  if (keyCode == ENTER)
    saveFrame("####.jpg");
  if (key == 'r') {
    background(0, 0, 100);
    drawCircle();
  }
}
