import processing.sound.*;
SoundFile sound1,sound2,sound3;
int stage=1;
int startTime;int Time;
int playerJ1=4, playerI1=2;
int playerJ2=14,playerI2=8;
int playerX1;int playerY1;
int playerX2;int playerY2;
int winner;
int Score1=0;
int Score2=0;
int [][] bombT1 = new int[11][15];//0:沒有, 倒數計時frame
int [][] bombT2 = new int[11][15];
int [][] map = { //0: 路(可走), 1:房子(卡住), -1:紅色炸彈(卡住), -2: 會殺玩家的範圍(殺人) -3:紅色炸開後佔的範圍(可走)
                // 6: 綠色炸彈(卡住), 7:會殺玩家的範圍(殺人)  8:綠色炸開後佔的範圍(可走)
  {10,10,10,0,0,0,0,0,0,0,0,0,0,0,0},
  {10,10,10,0,0,1,0,2,0,1,0,2,0,1,0}, //1: 房子
  {10,10,10,0,0,0,0,0,0,0,0,0,0,0,0},
  {10,10,10,0,0,2,0,1,0,2,0,1,0,2,0}, //1: 房子
  {10,10,10,0,0,0,0,0,0,0,0,0,0,0,0},
  {10,10,10,0,0,1,0,2,0,1,0,2,0,1,0}, //1: 房子
  {10,10,10,0,0,0,0,0,0,0,0,0,0,0,0},  
  {10,10,10,0,0,2,0,1,0,2,0,1,0,2,0},
  {10,10,10,0,0,0,0,0,0,0,0,0,0,0,0},  
  {10,10,10,0,0,1,0,2,0,1,0,2,0,1,0},
  {10,10,10,0,0,0,0,0,0,0,0,0,0,0,0},
};
PImage img1 ,img2 ,img3 ,img4 ,img5,img6,img7,img8; 
void setup(){
  size(750, 550);
  sound1=new SoundFile(this,"1.mp3");
  sound2=new SoundFile(this,"2.mp3");
  sound3=new SoundFile(this,"3.mp3");
  sound1.loop();
  PFont font=createFont("標楷體",20);
  textFont(font);
  img1 = loadImage("1.png");//角色1
  img2 = loadImage("2.png");//角色2
  img3 = loadImage("h1.png");//房子
  img4 = loadImage("g1.png");//草地
  img5 = loadImage("bomb1.png");//bomb
  img6 = loadImage("bomb2.png");//bomb
  img7 = loadImage("stone.jpeg");//stone
  img8 = loadImage("bigpicture.jpg");//stone
}
void mousePressed(){
  if(stage==1){
    stage=2;
    startTime=millis();
  }
}
void explode1(int i, int j, int c){
  sound2.play();
  map[i][j]=c;
  bombT1[i][j]=30;
  if(i+1<11 && (map[i+1][j]!=1 && map[i+1][j]!=-1 && map[i+1][j]!=10) ) {map[i+1][j]=c; bombT1[i+1][j]=30;}
  if(i-1>=0 && (map[i-1][j]!=1 && map[i-1][j]!=-1 && map[i-1][j]!=10) ) {map[i-1][j]=c; bombT1[i-1][j]=30;}
  if(j+1<15 && (map[i][j+1]!=1 && map[i][j+1]!=-1 && map[i][j+1]!=10) ) {map[i][j+1]=c; bombT1[i][j+1]=30;}
  if(j-1>=2 && (map[i][j-1]!=1 && map[i][j-1]!=-1 && map[i][j-1]!=10) ) {map[i][j-1]=c; bombT1[i][j-1]=30;}
  if(i+1<11 && map[i+1][j]==map[playerI2][playerJ2] && map[i+1][j]!=10) {
      player2died();
  }
  if(i-1>=0 && map[i-1][j]==map[playerI2][playerJ2] ) {
      player2died();
  }
  if(j+1<15 && map[i][j+1]==map[playerI2][playerJ2] ) {
      player2died();
  }
  if(j-1>=2 && map[i][j-1]==map[playerI2][playerJ2] ) {
      player2died();
  }
}
void explode2(int i, int j, int c){
  sound2.play();
  map[i][j]=c;
  bombT2[i][j]=30;
  if(i+1<11 && (map[i+1][j]!=1 && map[i+1][j]!=-1 && map[i+1][j]!=10) ) {map[i+1][j]=c; bombT2[i+1][j]=30;}
  if(i-1>=0 && (map[i-1][j]!=1 && map[i-1][j]!=-1 && map[i-1][j]!=10) ) {map[i-1][j]=c; bombT2[i-1][j]=30;}
  if(j+1<15 && (map[i][j+1]!=1 && map[i][j+1]!=-1 && map[i][j+1]!=10) ) {map[i][j+1]=c; bombT2[i][j+1]=30;}
  if(j-1>=2 && (map[i][j-1]!=1 && map[i][j-1]!=-1 && map[i][j-1]!=10) ) {map[i][j-1]=c; bombT2[i][j-1]=30;}
  if(i+1<11 && map[i+1][j]==map[playerI1][playerJ1] ) {
      player1died();
  }
  if(i-1>=0 && map[i-1][j]==map[playerI1][playerJ1] ) {
      player1died();
  }
  if(j+1<15 && map[i][j+1]==map[playerI1][playerJ1] ) {
      player1died();
  }
  if(j-1>=2 && map[i][j-1]==map[playerI1][playerJ1] ) {
      player1died();
  }
}
void draw(){
  if(stage==1){
    background(img8);
    image(img1, 350,100,80,80);
    image(img2 ,650,100,80,80);
    textSize(100);
    fill(0);
    text("爆爆王",400,100);
    
    fill(#1145F7);
    ellipse(380,450,200,100);
    noStroke();
    fill(255);
    textSize(45);
    text("開始",340,460);
    
    fill(#1145F7);
    //ellipse(50,300,50,50);
    noStroke();
    fill(#F51414);
    textSize(50);
    //text("遊戲故事",230,325);
  }
  if(stage==2){
     background(#E3C219);
      for(int i=0; i<11; i++){
        for(int j=0; j<15; j++){
          if(map[i][j]==0){
            image(img4,j*50,i*50,55,55);
          }
          if(map[i][j]==1){
            image(img3,j*50,i*50,55,55);
          }else if(map[i][j]==2){
            image(img7,j*50,i*50,55,55);
          }else if(map[i][j]==-1){
            image(img3,j*50,i*50,55,55);
            fill(#2FF711);
            rect(j*50, i*50, 50, 50);   
            noStroke();
            image(img5,j*50,i*50,50,50);
          }else if(map[i][j]==-2){
            fill(255);
            rect(j*50, i*50, 50, 50);   
            noStroke();
          }else if(map[i][j]==-3){
            fill(#34E9F7);
            rect(j*50, i*50, 50, 50);  
            noStroke();
          }else if(map[i][j]==6){
            //fill(#F21111);
            //rect(j*50, i*50, 50, 50); 
            //noStroke();
            fill(#2FF711);
            rect(j*50, i*50, 50, 50);   
            noStroke();
            image(img6,j*50,i*50,50,50);
          }else if(map[i][j]==7){
            fill(255);
            rect(j*50, i*50, 50, 50);  
            noStroke();
          }else if(map[i][j]==8){
            fill(#FA7C8F);
            rect(j*50, i*50, 50, 50);
            noStroke();
          }
        }
      }
      ///以上畫圖, 以下程式的執行判斷
      for(int i=0; i<11; i++){
        for(int j=0; j<15; j++){
          if(map[i][j]==1){
          }else if(map[i][j]==-1){
            if(bombT1[i][j]>0) bombT1[i][j]--;
            else{ //時間到,就炸
              explode1(i,j, -2);//可殺人
            }
          }else if(map[i][j]==-2){
            if(bombT1[i][j]>0) bombT1[i][j]--;
            else{ //時間到,就畫地盤的色彩
              map[i][j]=-3;
            }
          }else if(map[i][j]==6){
            if(bombT2[i][j]>0) bombT2[i][j]--;
            else{ //時間到,就炸
              explode2(i,j, 7);//可殺人
            }
          }else if(map[i][j]==7){
            if(bombT2[i][j]>0) bombT2[i][j]--;
            else{ //時間到,就畫地盤的色彩
              map[i][j]=8;
            }        
          }
        }
      }
      int playerX1=playerJ1*50+25;
      int playerY1=playerI1*50+25;
      image(img1, playerX1-25, playerY1-25,45,45);
      //ellipse(playerX1, playerY1, 50,50);
      int playerX2=playerJ2*50+25;
      int playerY2=playerI2*50+25;
      image(img2 , playerX2-25, playerY2-25,45,45);
      //ellipse(playerX2,playerY2,50,50);
      
      int m = (120-((millis()/1000)-(startTime/1000)))/60%60;
      int s = (120-((millis()/1000)-(startTime/1000)))%60;
      String mm = nf(m, 2);
      String ss = nf(s, 2);
      String line1 = "剩下"+":"+mm+":"+ss;
     if(millis()-startTime>=120000){
       stage=3;
       counting();
     }else if(millis()-startTime<=120000){
       fill(255);
       textSize(30);
       text(line1,380,30);
     }
  }
  if(stage==3){
    background(#F2D020);
    fill(0);
    text("贏家是:",200,200);
    if(Score1>Score2)text("player1",250,250);
    if(Score2>Score1)text("player2",250,250);
    if(Score2==Score1)text("平手",250,250);
  }
}
void keyPressed(){
  if(stage==2){
  if(keyCode==RIGHT && notBlock1(1,0)) playerJ1++;
  if(keyCode==LEFT && notBlock1(-1,0)) playerJ1--;
  if(keyCode==DOWN && notBlock1(0,1) ) playerI1++;
  if(keyCode==UP && notBlock1(0,-1) ) playerI1--;
  if(key=='d' && notBlock2(1,0) ) playerJ2++;
  if(key=='a' && notBlock2(-1,0)) playerJ2--;
  if(key=='s' && notBlock2(0,1) ) playerI2++;
  if(key=='w' && notBlock2(0,-1) ) playerI2--;
  if(key==' ') {
    map[playerI1][playerJ1]=-1;//炸彈
    bombT1[playerI1][playerJ1]=60;//等60frame,1秒
  }
  if(key=='q') {
    map[playerI2][playerJ2]=6;//炸彈
    bombT2[playerI2][playerJ2]=60;//等60frame,1秒
  }
  }
}
void counting(){
    for(int i=0;i<11;i++){
    for(int j=0;j<15;j++){
        if(map[i][j]==-3)Score1++;
        if(map[i][j]==8)Score2++;
      }
    }
}
boolean notBlock1(int x, int y){
  if(playerI1+y<0 || playerI1+y>=11) return false;//超過界線
  if(playerJ1+x<0 || playerJ1+x>=15) return false;//超過界線
  if(map[playerI1+y][playerJ1+x]==1 || map[playerI1+y][playerJ1+x]==2 || map[playerI1+y][playerJ1+x]==10) return false;//不可以走
  if(playerI1+y==playerI2 && playerJ1+x==playerJ2)return false;
  else return true;//可以走
}
boolean notBlock2(int x, int y){
  if(playerI2+y<0 || playerI2+y>=11) return false;//超過界線
  if(playerJ2+x<0 || playerJ2+x>=15) return false;//超過界線
  if(map[playerI2+y][playerJ2+x]==1 || map[playerI2+y][playerJ2+x]==2 || map[playerI2+y][playerJ2+x]==10 ) return false;//不可以走
  if(playerI2+y==playerI1 && playerJ2+x==playerJ1) return false;
  else return true;//可以走
}
void player2died(){
  sound3.play();
  for(int i=0;i<11;i++){
   for(int j=0;j<15;j++){
     if(map[i][j]!=-3){
       if(map[i][j]==8)map[i][j]=0;
     }
   }
  }
}
void player1died(){
  sound3.play();
  for(int i=0;i<11;i++){
   for(int j=0;j<15;j++){
     if(map[i][j]!=8){
       if(map[i][j]==-3)map[i][j]=0;
     }
   }
  }
}
