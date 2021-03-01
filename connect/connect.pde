Ball ball;
Line[] lines;
int unit = 10;
int num;

void setup()
{
  //blendMode(SCREEN);
  colorMode(HSB, 360, 100, 100);
  size(700, 700);
  ball = new Ball(width/2, height/2);
  num = 2*(int)(width/unit+ height/unit);
  lines = new Line[num];
  setLines();
}

void setLines()
{
  int i, j=0;
  for (i=0; i<width/unit; i++, j++)
    lines[j] = new Line(i*unit, 0);
  for (i=0; i<height/unit; i++, j++)
    lines[j] = new Line(width, i*unit);
  for (i=width/unit; i>0; i--, j++)
    lines[j] = new Line(i*unit, height);
  for (i=height/unit; i>0; i--, j++)
    lines[j] = new Line(0, i*unit);

  for (i=0; i<num; i++)
    lines[i].track(ball.pos);
}

void draw()
{
  //println(frameRate);
  background(0);
  ball.update();
  ball.display();

  for (int i=0; i<num; i++) {
    lines[i].track(ball.pos);
    lines[i].setHue(lines[(i+1)%num].head.x + lines[(i-1+num)%num].head.x  - 2*lines[i].head.x,unit);
    println(lines[50].hue);
    lines[i].display();
    strokeWeight(2);
    line(lines[i].head.x,lines[i].head.y,lines[(i+1)%num].head.x,lines[(i+1)%num].head.y);  
  }
}
