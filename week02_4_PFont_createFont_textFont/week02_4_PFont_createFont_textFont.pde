void setup()
{
   size(500,500); 
   PFont font=createFont("標楷體",40);
   textFont(font);
}
int W=25;
void draw()
{
    drawPokerCard(100,100, "黑桃4");
    drawPokerCard(130,150, "紅心3");
    drawPokerCard(160,200, "方塊5");
    drawPokerCard(190,250, "梅花J");
}
void drawPokerCard(int x,int y,String face)
{
  fill(255);
  rect(x-W/2,y-W/2,150+W,250+W,20);
  fill(#0D8B84);
  rect(x,y,150,250,10);
  fill(0);
  textSize(40);
  text(face,x,y+40);
}
