void setup()
{
   size(500,500);
   background(#FFFFF2);
   stroke(255,0,0);
}

void draw()
{
   if(mousePressed)
   {
       line(mouseX,mouseY, pmouseX,pmouseY);
   }
}
void keyPressed()
{
   if(key=='1')stroke(#FA0834);
   if(key=='2')stroke(#11A7A4);
   if(key=='3')stroke(#A74111);
   if(key=='4')stroke(#D6E32C);
}
