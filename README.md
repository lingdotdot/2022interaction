# 2022interaction
2022互動技術 上課程式

# Week01
2022/09/05 開學日

上課重點:
-這門課要學Processing程式語言
-Processing是一種開源程式語言，專門為電子藝術和視覺互動設計而創建
-Teams & Moodle有上課教學錄影與截圖
-學期成績:Blog 20%，期中作品40%，期末作品40%
-加入FB社團:2022互動技術
-介紹Processing介面(切換p5.js to java)介面
-程式實作1:調整視窗大小
  size(長，寬);
-程式實作2:調整視窗背景顏色
  background(#顏色代碼);
-程式實作3:畫四邊形&填充四邊形顏色
  rect(x,y,長,寬);
-程式實作4:互動四邊形(小卡片遊戲)
  rect(mouseX,mouseY,長,寬);
-程式實作5:小畫家
  line(mouseX,mouseY,pmouseX,pmouseY);
The End

# Week02
2022/09/12 天氣大雨

今日目標:完成一個卡片互動程式。
實作程式1:製作一張卡片(靜態程式)
```
size(500,500);
rect(100,100, 170,270 ,20);
fill(#0D8B84);
rect(110,110, 150,250 ,20);
```
實作程式2:製作多張卡片(動態程式)
```
void setup()
{
   size(500,500); 
}
int W=25;
void draw()
{
    drawCard(100,100);
    drawCard(140,140);
    drawCard(180,180);
}
void drawCard(int x,int y)
{
  fill(255);
  rect(x-W/2,y-W/2,150+W,250+W,20);
  fill(#0D8B84);
  rect(x,y,150,250,20);
}
```
實作程式3:打字+製作撲克牌(四種花紋)
```
void setup()
{
   size(500,500); 
}
int W=25;
void draw()
{
    drawPokerCard(100,100, "S4");
    drawPokerCard(130,150, "H3");
    drawPokerCard(160,200, "D5");
    drawPokerCard(190,250, "CJ");
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
```
實作程式4:打出中文字的相關設定
```
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
```
實作程式5:做花紋的字體顏色調整
```
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
  if(face.indexOf("黑桃")==-1 && face.indexOf("梅花")==-1)fill(#FF0000);
  textSize(40);
  text(face,x,y+40);
}
```
實作程式6:利用亂數隨機抽牌
補充1:按滑鼠一下，就隨機抽牌一次
```
void setup()
{
   size(500,500); 
   PFont font=createFont("標楷體",40);
   textFont(font);
   String [] flower={"黑桃","紅心","方塊","梅花"};
   face1=flower[int(random(4))]+int(random(13)+1);
   face2=flower[int(random(4))]+int(random(13)+1);
   face3=flower[int(random(4))]+int(random(13)+1);
   face4=flower[int(random(4))]+int(random(13)+1);
}
void mousePressed()
{
   String [] flower={"黑桃","紅心","方塊","梅花"};
   face1=flower[int(random(4))]+int(random(13)+1);
   face2=flower[int(random(4))]+int(random(13)+1);
   face3=flower[int(random(4))]+int(random(13)+1);
   face4=flower[int(random(4))]+int(random(13)+1);
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
```
The End

# Week03
-上禮拜最後一個程式複製貼上，做複習
```
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
```
-加上按滑鼠就做洗牌動作的功能
-開始一步步寫出交換洗牌的程式碼
  ```
  -寫出撲克牌的框框
    void setup()
  {
    size(700,700);
  }
  void draw()
  {
   background(#FFFFF2);
   for(int i=0;i<52;i++)
   {
     int x=(i%10)*60;
     int y=int(i/10)*120;
     rect(x,y,60,120);
   }
  }
  ```
  ```
  -寫出撲克牌的牌面
  void setup()
{
  size(700,700);
  PFont font = createFont("標楷體",10);
  textFont(font);
}
String [] faces={
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
};
void draw()
{
 background(#FFFFF2);
 for(int i=0;i<52;i++)
 {
   int x=(i%10)*60;
   int y=int(i/10)*120;
   rect(x,y,60,120);
   fill(255);rect(x,y,60,120);
   fill(0);text(faces[i],x+25,y+80);
 }
}
  ```
  ```
  -寫出更好的撲克牌畫面
  void setup()
{
  size(800,600);
  PFont font = createFont("標楷體",16);
  textFont(font);
}
String [] faces={
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K",
};
void draw()
{
 background(#FFFFF2);
 for(int i=0;i<52;i++)
 {
   int x=(i%13)*60;
   int y=int(i/13)*120;
   rect(x,y,60,120);
   fill(255);rect(x,y,60,120);
   if(faces[i].indexOf("紅心")==-1 && faces[i].indexOf("方塊")==-1)fill(0);
   else fill(255,0,0);
   text(faces[i],x+10,y+60);
 }
}
  ```
  ```
  -寫出洗牌交換的動作
  void setup()
{
  size(800,600);
  PFont font = createFont("標楷體",16);
  textFont(font);
}
String [] faces={
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K",
};
void draw()
{
 background(#FFFFF2);
 for(int i=0;i<52;i++)
 {
   int x=(i%13)*60;
   int y=int(i/13)*120;
   rect(x,y,60,120);
   fill(255);rect(x,y,60,120);
   if(faces[i].indexOf("紅心")==-1 && faces[i].indexOf("方塊")==-1)fill(0);
   else fill(255,0,0);
   text(faces[i],x+10,y+60);
 }
}
void mouseDragged()
{
  int a =int(random(52));
  int b =int(random(52));
  String temp=faces[a];
  faces[a]=faces[b];
  faces[b]=temp;
}
  ```
-今日目標:week02 & week03程式做合併(交換洗牌後，只顯示四張牌)
```
void setup()
{
   size(500,500); 
   PFont font=createFont("標楷體",40);
   textFont(font);
   myShuffle();
}
String [] faces={
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K",
};
void myShuffle()
{
  for(int k=0;k<10000;k++){
    int a =int(random(52));
    int b =int(random(52));
    String temp=faces[a];
    faces[a]=faces[b];
    faces[b]=temp;
  }
  
  face1=faces[0];
  face2=faces[1];
  face3=faces[2];
  face4=faces[3];
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
```
The End

# Week04
今日目標:
-iPhone 14 動態島的打彈珠遊戲
-圍棋遊戲
```
主題一:動態島
```
```
實作程式1:物理學家(牛頓):x(位置)，v(速度)，a(加速度)
void setup()
{
  size(500,500);
}
int x=250,y=250;
void draw()
{
   ellipse(x,y,10,10);
   x=x+1;
   y=y-1;
}
```
```
實作程式2:橢圓碰到四周，會做反彈的動作
void setup()
{
  size(500,500);
}
float x=250,y=250;
float vx=1.0,vy=-0.5;
void draw()
{
   ellipse(x,y,10,10);
   x=x+vx;
   y=y+vy;
   if(x>500)vx=-vx;
   if(y<0)vy=-vy;
   if(x<0)vx=-vx;
   if(y>500)vy=-vy;
}
```
```
實作程式3:板板隨著滑鼠移動，碰到板板回彈
void setup()
{
  size(500,500);
}
float x=250,y=250;
float vx=2.0,vy=-1.5;
void draw()
{
   background(#FFFFF2);
   int boardX=mouseX;
   rect(boardX,470,100,20);
   ellipse(x,y,10,10);
   x=x+vx;
   y=y+vy;
   if(x>500)vx=-vx;
   if(y<0)vy=-vy;
   if(x<0)vx=-vx;
   if(y>470 && x>boardX && x<boardX+100)vy=-vy;
}
```
```
實作程式4:板板做得更精緻，加上滑鼠按左鍵板板會變大，滑鼠按右鍵板板會變小
void setup()
{
  size(500,500);
}
float x=250,y=250;
float vx=2.0,vy=-2.5;
float boardX,boardY=470,boardW=100,boardH=20;
void draw()
{
   boardX=mouseX-boardW/2;
   background(#FFFFF2);
   rect(boardX,boardY,boardW,boardH);
   ellipse(x,y,10,10);
   x=x+vx;
   y=y+vy;
   if(x>500)vx=-vx;
   if(y<0)vy=-vy;
   if(x<0)vx=-vx;
   if((y>boardY && y<boardY+boardH) && (x>boardX && x<boardX+boardW))
   {
     vy=-vy;
     vx+=(mouseX-pmouseX)/2;
   }
   if(mousePressed && mouseButton==LEFT)boardW*=1.01;
   if(mousePressed && mouseButton==RIGHT)boardW*=0.99;
}
```
```
主題二:圍棋
```
```
實作程式5:利用迴圈做圍棋的棋子排列
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
```
```
實作程式6:利用陣列做圍棋排列，利用陣列裡的數字，去改變圍棋的顏色為黑色
void setup()
{
  size(500,500);
}
int [][] go ={
   {0,0,0,0,0,0,0,0,1},
   {0,0,0,0,0,0,0,0,1},
   {0,0,0,0,0,0,0,0,1},
   {0,0,0,0,0,0,0,0,1},
   {0,0,1,0,0,0,0,0,1},
   {0,0,0,0,0,0,0,0,1},
   {0,0,0,0,0,0,0,0,1},
   {0,0,0,0,0,0,0,0,1},
   {0,0,0,0,0,0,0,0,1},
};
void draw()
{
   for(int i=0; i<9; i++){
     for(int j=0; j<9; j++){
       if(go[i][j]==1)fill(0);
       else fill(255);
       ellipse(50+j*50,50+i*50,50,50);
     }
   }
}
```
```
實作程式7:做出棋盤的顏色和棋盤的格子線&陣列裡的數字去做白色或黑色棋子的顯示
void setup()
{
  size(500,500);
}
int [][] go ={
   {0,0,0,0,0,0,0,0,1},
   {0,0,0,0,0,0,0,0,1},
   {0,0,0,2,0,0,0,0,1},
   {0,0,0,0,0,0,0,0,1},
   {0,0,1,0,0,0,0,0,1},
   {0,0,0,0,0,2,0,0,1},
   {0,0,0,0,0,0,0,0,1},
   {0,0,0,0,0,0,0,0,1},
   {0,0,0,0,0,0,0,0,1},
};
void draw()
{
  background(246,194,108);
  for(int i=1;i<=9;i++)
  {
    line(50,50*i,450,50*i);
    line(50*i,50,50*i,450);
  }
   for(int i=0; i<9; i++){
     for(int j=0; j<9; j++){
       if(go[i][j]==1){
         fill(0);
         ellipse(50+j*50,50+i*50,40,40);
       }
       else if(go[i][j]==2){
         fill(255);
         ellipse(50+j*50,50+i*50,40,40);         
       }
     }
   }
}
```
```
實作程式8:按下滑鼠就可以下棋，黑白色棋子輪流下
void setup()
{
  size(500,500);
}
int [][] go ={
   {0,0,0,0,0,0,0,0,0},
   {0,0,0,0,0,0,0,0,0},
   {0,0,0,0,0,0,0,0,0},
   {0,0,0,0,0,0,0,0,0},
   {0,0,0,0,0,0,0,0,0},
   {0,0,0,0,0,0,0,0,0},
   {0,0,0,0,0,0,0,0,0},
   {0,0,0,0,0,0,0,0,0},
   {0,0,0,0,0,0,0,0,0},
};
int N=0;
void mousePressed()
{
  int j=(mouseX-25)/50;
  int i=(mouseY-25)/50;
  go[i][j]=(N%2==0)?1:2;
  N++;
}
void draw()
{
  background(246,194,108);
  for(int i=1;i<=9;i++)
  {
    line(50,50*i,450,50*i);
    line(50*i,50,50*i,450);
  }
   for(int i=0; i<9; i++){
     for(int j=0; j<9; j++){
       if(go[i][j]==1){
         fill(0);
         ellipse(50+j*50,50+i*50,40,40);
       }
       else if(go[i][j]==2){
         fill(255);
         ellipse(50+j*50,50+i*50,40,40);         
       }
     }
   }
}
```
The End
