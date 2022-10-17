import processing.sound.*;
SoundFile file1,file2,file3,file4;
void setup()
{
   file1=new SoundFile(this,"Intro Song_Final.mp3");
   file2=new SoundFile(this,"In Game Music.mp3");
   file3=new SoundFile(this,"Cannon Blast.mp3");
   file4=new SoundFile(this,"sword slash.mp3");
   
   file1.play();
}
void draw()
{
  
}
void mousePressed()
{
   file2.play();  
}
void keyPressed()
{
  file3.play();
}
