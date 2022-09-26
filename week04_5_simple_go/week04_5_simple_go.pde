void setup()
{
  size(500,500);
}
void draw()
{
   for(int x=100; x<=400;x+=50){
     for(int y=100;y<=400;y+=50){
       ellipse(x,y,50,50);
     }
   }
}
