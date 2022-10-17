import processing.sound.*;
void setup()
{
   SoundFile file=new SoundFile(this,"Intro Song_Final.mp3");
   file.play();
}
void draw()
{
  
}
void mousePressed()
{
   SoundFile file=new SoundFile(this,"In Game Music.mp3");
   file.play();  
}
