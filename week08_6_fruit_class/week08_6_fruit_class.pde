class Fruit{
  float x,y,vx,vy;
  boolean flying;
  PApplet sketch;
  Fruit(PApplet _sketch){
    sketch=_sketch;
    reset();
  }
  void reset()
  {
    x=sketch.random(100.0,300.0);
    y=300;
    vx=sketch.random(-2,+2);
    vy=-13;
    flying=true;
  }
  void update(){
    x+=vx;
    y+=vy;
    vy+=0.98/3;
  }
}
Fruit fruit;
void setup()
{
  size(400,300);
  fruit=new Fruit(this);
}
void draw()
{
  background(255,255,0);
  ellipse(fruit.x,fruit.y,50,50);
  fruit.update();
}
void keyPressed()
{
  fruit.reset();
}
