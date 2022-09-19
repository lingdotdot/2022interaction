void setup()
{
   size(500,500); 
   PFont font=createFont("標楷體",40);
   textFont(font);
   myShuffle();
}
void myShuffle()
{
   String [] flower={"黑桃","紅心","方塊","梅花"};
   face1=flower[int(random(4))]+int(random(13)+1);
   face2=flower[int(random(4))]+int(random(13)+1);
   face3=flower[int(random(4))]+int(random(13)+1);
   face4=flower[int(random(4))]+int(random(13)+1);
}
void mousePressed()
{
  myShuffle();
}
String face1,face2,face3,face4;
void draw()
{
    drawPokerCard(100,100, face1);
    drawPokerCard(130,150, face2);
    drawPokerCard(160,200, face3);
    drawPokerCard(190,250, face4);
}
void drawPokerCard(int x,int y,String face)
{
  int W=25;
  fill(255);
  rect(x-W/2,y-W/2,150+W,250+W,20);
  fill(#0D8B84);
  rect(x,y,150,250,10);
  fill(0);
  if(face.indexOf("黑桃")==-1 && face.indexOf("梅花")==-1)fill(#FF0000);
  textSize(40);
  text(face,x,y+40);
}
