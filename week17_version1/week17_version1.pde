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
int Score1_1=0;
int Score2_1=0;
int waitTime1=0;
int waitTime2=0;
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
PImage img1 ,img2 ,img3 ,img4 ,img5,img6,img7,img8,img9,img10,img11,img12,img13,img14,img15,img16; 
void setup(){
  size(750, 550);
  sound1=new SoundFile(this,"1.mp3");
  sound2=new SoundFile(this,"2.mp3");
  sound3=new SoundFile(this,"3.mp3");
  sound1.loop();
  PFont font=createFont("標楷體",20);
  textFont(font);
  img1 = loadImage("turtlefront.png");//角色1
  img2 = loadImage("pikafront.png");//角色2
  img3 = loadImage("h1.png");//房子
  img4 = loadImage("g1.png");//草地
  img5 = loadImage("bomb1.png");//bomb
  img6 = loadImage("bomb2.png");//bomb
  img7 = loadImage("stone.png");//stone
  img8 = loadImage("bigpicture.jpg");//stone
  img9 = loadImage("logo.png");//logo
  img10 = loadImage("turtleback.png");
  img11 = loadImage("bomb1_2.png");
  img12 = loadImage("bomb2_2.png");
  img13 = loadImage("wood.png");
  img14 = loadImage("victory.png");
  img15 = loadImage("scorewood1.png");
  img16 = loadImage("victory.jpg");
}
void mousePressed(){
  if(mouseX>=380 && mouseX<=430 && mouseY>=450 && mouseY<=500){
    if(stage==1){
      stage=4;
    }
  }
  else if(stage==4){
     stage=2;
     startTime=millis();
  }
  else if(stage==2){//要刪掉
     stage=3;
     counting();
  }
}
void draw(){
  if(stage==1){
    background(img8);
    image(img9,400,0,200,100);
    textSize(100);
    fill(0);
    text("爆爆王",450,150);
    
    fill(#1145F7);
    ellipse(380,450,100,100);
    if(mouseX>=380 && mouseX<=430 && mouseY>=450 && mouseY<=500){
       fill(0);
       ellipse(380,450,100,100);
       fill(#13EDC3);
       textSize(25);
       text("按下開始遊戲!",mouseX,mouseY);
    }
    fill(255);
    textSize(45);
    text("開始",335,460);
    
    fill(#1145F7);
    noStroke();
    fill(#F51414);
    textSize(50);
    //text("遊戲故事",230,325);
  }
  if(stage==4){
     background(#537889);
     fill(255);
     textSize(30);
     text("按下滑鼠遊戲開始!",240,500);
  }
  if(stage==2){
    background(#29982E);
      for(int i=0; i<11; i++){
        for(int j=0; j<15; j++){
          if(map[i][j]==0){
            image(img4,j*50,i*50,55,55);
          }
          if(map[i][j]==1){
            image(img3,j*50,i*50,55,55);
          }else if(map[i][j]==2){
            image(img7,j*50,i*50,50,50);
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
              waitTime1=0;
            }
          }else if(map[i][j]==-2){
            if(bombT1[i][j]>0) bombT1[i][j]--;
            else{ //時間到,就畫地盤的色彩
              map[i][j]=-3;
              counting();
              Score1=0;
              Score2=0;
            }
          }else if(map[i][j]==6){
            if(bombT2[i][j]>0) bombT2[i][j]--;
            else{ //時間到,就炸
              explode2(i,j, 7);//可殺人
              waitTime2=0;
            }
          }else if(map[i][j]==7){
            if(bombT2[i][j]>0) bombT2[i][j]--;
            else{ //時間到,就畫地盤的色彩
              map[i][j]=8;
              counting();
              Score1=0;
              Score2=0;
            }        
          }
        }
      }
      image(img13,-30,-10,200,100);
      image(img15,-50,150,200,100);
      image(img15,-50,250,200,100);
      fill(0);
      textSize(50);
      text(Score1_1,50,220);
      fill(0);
      textSize(50);
      text(Score2_1,50,320);
      //rect(0,500,150,50);
      //fill(255);
      //textSize(30);
      //text("暫停遊戲",20,540);
      int playerX1=playerJ1*50+25;
      int playerY1=playerI1*50+25;
      image(img1, playerX1-25, playerY1-25,50,50);
      int playerX2=playerJ2*50+25;
      int playerY2=playerI2*50+25;
      image(img2 , playerX2-25, playerY2-25,45,45);
      int m = (120-((millis()/1000)-(startTime/1000)))/60%60;
      int s = (120-((millis()/1000)-(startTime/1000)))%60;
      String mm = nf(m, 2);
      String ss = nf(s, 2);
      String line1 = "剩下"+":"+mm+":"+ss;
     if(millis()-startTime>=120000){
       stage=3;
       counting();
     }else if(millis()-startTime<=120000){
       fill(0);
       textSize(28);
       text(line1,5,45);
     }
  }
  if(stage==3){
    background(img16);
    if(Score1>Score2){
      image(img1 ,40,180,300,300);
      image(img2 ,430,160,300,300);
      image(img14,80,50,230,130);
    }
    if(Score2>Score1){
      image(img1 ,40,180,300,300);
      image(img2 ,430,160,300,300);
      image(img14,450,50,230,130);
    }
    if(Score2==Score1){
      image(img1 ,40,180,300,300);
      image(img2 ,430,160,300,300);
      textSize(100);
      text("平手",270,150);
    }
  }
}
void counting(){
    for(int i=0;i<11;i++){
    for(int j=0;j<15;j++){
        if(map[i][j]==-3){Score1++;}
        if(map[i][j]==8){Score2++;}
        Score1_1=Score1;
        Score2_1=Score2;
      }
    }
}
boolean notBlock1(int x, int y){
  if(playerI1+y<0 || playerI1+y>=11) return false;//超過界線
  if(playerJ1+x<0 || playerJ1+x>=15) return false;//超過界線
  if(map[playerI1+y][playerJ1+x]==1 || map[playerI1+y][playerJ1+x]==2 || map[playerI1+y][playerJ1+x]==10 || map[playerI1+y][playerJ1+x]==6) return false;//不可以走
  if(playerI1+y==playerI2 && playerJ1+x==playerJ2)return false;
  else return true;//可以走
}
boolean notBlock2(int x, int y){
  if(playerI2+y<0 || playerI2+y>=11) return false;//超過界線
  if(playerJ2+x<0 || playerJ2+x>=15) return false;//超過界線
  if(map[playerI2+y][playerJ2+x]==1 || map[playerI2+y][playerJ2+x]==2 || map[playerI2+y][playerJ2+x]==10 || map[playerI2+y][playerJ2+x]==-1) return false;//不可以走
  if(playerI2+y==playerI1 && playerJ2+x==playerJ1) return false;
  else return true;//可以走
}
void player2died(){
  sound3.play();
  for(int i=0;i<11;i++){
   for(int j=0;j<15;j++){
     if(map[i][j]!=-3){
       if(map[i][j]==8){
           map[i][j]=0;
             counting();
             Score1=0;
             Score2=0;
       }
     }
   }
  }
}
void player1died(){
  sound3.play();
  for(int i=0;i<11;i++){
   for(int j=0;j<15;j++){
     if(map[i][j]!=8){
       if(map[i][j]==-3){
           map[i][j]=0;
             counting();
             Score1=0;
             Score2=0;
       }
     }
   }
  }
}
