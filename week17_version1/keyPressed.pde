void keyPressed(){
  if(stage==2){
  if(keyCode==RIGHT && notBlock1(1,0)) {
    playerJ1++;
    image(img1, playerJ1*50, playerI1*50-15,55,55);
  }
  if(keyCode==LEFT && notBlock1(-1,0)) {
    playerJ1--;
    image(img1, playerJ1*50, playerI1*50-15,55,55);
  }
  if(keyCode==DOWN && notBlock1(0,1) ) {
    playerI1++;
    image(img1, playerJ1*50, playerI1*50-5,55,55);
  }
  if(keyCode==UP && notBlock1(0,-1) ) {
    playerI1--;
  }
  if(key=='d' && notBlock2(1,0) ) {
    playerJ2++;
    image(img2, playerJ2*50, playerI2*50-15,55,55);  
  }
  if(key=='a' && notBlock2(-1,0)) {
    playerJ2--;
    image(img2, playerJ2*50, playerI2*50-15,55,55);  
  }
  if(key=='s' && notBlock2(0,1) ) {
    playerI2++;
    image(img2, playerJ2*50, playerI2*50-5,55,55);
  }
  if(key=='w' && notBlock2(0,-1) ) playerI2--;
  if(waitTime1==0){
    if(key==' ') {
      map[playerI1][playerJ1]=-1;//炸彈
      bombT1[playerI1][playerJ1]=60;//等60frame,1秒
      waitTime1=1;
    }
  }
  if(waitTime2==0){
    if(key=='q') {
      map[playerI2][playerJ2]=6;//炸彈
      bombT2[playerI2][playerJ2]=60;//等60frame,1秒
      waitTime2=1;
    }
  }
  }
}
