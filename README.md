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

# Week05
今日目標:象棋&暗棋
```
實作程式1:利用迴圈畫出象棋的棋盤
size(500,550);
for(int x=50;x<=450;x+=50)
{
  line(x,50,x,250);
  line(x,300,x,500);
}
for(int y=50;y<=500;y+=50)
{
  line(50,y,450,y);
}
```
```
實作程式2:利用陣列並顯示數字(棋子)
int [][]board=
{
  {4,5,6,2,1,2,3,5,4},
  {0,0,0,0,0,0,0,0,0},
  {0,6,0,0,0,0,0,0,0},
  {1,0,1,0,1,0,1,0,1},
};
void setup()
{
  size(500,550);
}
void draw()
{
  for(int x=50;x<=450;x+=50)
  {
    line(x,50,x,250);
    line(x,300,x,500);
  }
  for(int y=50;y<=500;y+=50)
  {
    line(50,y,450,y);
  }
  for(int i=0;i<4;i++)
  {
    for(int j=0;j<9;j++)
    {
      text(board[i][j],50+j*50, 50+i*50);
    }
  }
}
```
```
實作程式3:寫出棋子的中文字
int [][]board=
{
  {4,5,6,2,1,2,3,5,4},
  {0,0,0,0,0,0,0,0,0},
  {0,6,0,0,0,0,0,0,0},
  {7,0,7,0,7,0,7,0,7},
};
String[]name={"將","士","象","車","馬","包","卒"};
void setup()
{
  size(500,550);
  PFont font =createFont("標楷體",30);
  textFont(font);
  textAlign(CENTER,CENTER);
}
void draw()
{
  for(int x=50;x<=450;x+=50)
  {
    line(x,50,x,250);
    line(x,300,x,500);
  }
  for(int y=50;y<=500;y+=50)
  {
    line(50,y,450,y);
  }
  for(int i=0;i<4;i++)
  {
    for(int j=0;j<9;j++)
    {
      int id = board[i][j];
      if(id==0)continue;
      text(name[id-1],50+j*50, 50+i*50);
    }
  }
}
```
實作程式4:寫出完整的紅棋和黑棋(棋陣)
```
實作程式5:利用mousePressed，寫出滑鼠按下並下棋的動作(只能下"將"，很奇怪的版本)
int [][]board=
  {
  {4, 5, 6, 2, 1, 2, 3, 5, 4},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 6, 0, 0, 0, 0, 0, 6, 0},
  {7, 0, 7, 0, 7, 0, 7, 0, 7},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {-7, 0, -7, 0, -7, 0, -7, 0, -7},
  {0, -6, 0, 0, 0, 0, 0, -6, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {-4, -5, -3, -2, -1, -2, -3, -5, -4},
};
String[]name={"將", "士", "象", "車", "馬", "包", "卒"};
String[]name2={"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void setup()
{
  size(500, 550);
  PFont font =createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw()
{
  background(#F0B82C);
  for (int x=50; x<=450; x+=50)
  {
    line(x, 50, x, 250);
    line(x, 300, x, 500);
  }
  for (int y=50; y<=500; y+=50)
  {
    line(50, y, 450, y);
  }
  for (int i=0; i<10; i++)
  {
    for (int j=0; j<9; j++)
    {
      int id = board[i][j];
      if (id==0)continue;
      if(id>0)
      {
        fill(255);
        ellipse(50+j*50, 50+i*50,40,40);
        fill(0);
        text(name[id-1], 50+j*50, 50+i*50);
      }
      else if(id<0)
      {
        fill(255);
        ellipse(50+j*50, 50+i*50,40,40);
        fill(255,0,0);
        text(name2[-id-1], 50+j*50, 50+i*50-3);        
      }
    }
  }
}
void mousePressed()
{
  for(int i=0;i<10;i++)
  {
    for(int j=0;j<9;j++)
    {
      if(dist(mouseX,mouseY,50+j*50,50+i*50)<20){
        board[i][j]=1;
      }
    }
  }
}
```
```
實作程式6:再寫一個mouseReleased程式，去做把棋子拿到手上的動作，然後拖曳去改變棋子的位置
int [][]board=
  {
  {4, 5, 6, 2, 1, 2, 3, 5, 4},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 6, 0, 0, 0, 0, 0, 6, 0},
  {7, 0, 7, 0, 7, 0, 7, 0, 7},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {-7, 0, -7, 0, -7, 0, -7, 0, -7},
  {0, -6, 0, 0, 0, 0, 0, -6, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {-4, -5, -3, -2, -1, -2, -3, -5, -4},
};
String[]name={"將", "士", "象", "車", "馬", "包", "卒"};
String[]name2={"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void setup()
{
  size(500, 550);
  PFont font =createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw()
{
  background(#F0B82C);
  for (int x=50; x<=450; x+=50)
  {
    line(x, 50, x, 250);
    line(x, 300, x, 500);
  }
  for (int y=50; y<=500; y+=50)
  {
    line(50, y, 450, y);
  }
  for (int i=0; i<10; i++)
  {
    for (int j=0; j<9; j++)
    {
      int id = board[i][j];
      if (id==0)continue;
      if(id>0)
      {
        fill(255);
        ellipse(50+j*50, 50+i*50,40,40);
        fill(0);
        text(name[id-1], 50+j*50, 50+i*50);
      }
      else if(id<0)
      {
        fill(255);
        ellipse(50+j*50, 50+i*50,40,40);
        fill(255,0,0);
        text(name2[-id-1], 50+j*50, 50+i*50-3);        
      }
    }
  }
  if(handChess!=0)ellipse(mouseX,mouseY,40,40);
}
int handChess=0;
void mousePressed()
{
  for(int i=0;i<10;i++)
  {
    for(int j=0;j<9;j++)
    {
      if(dist(mouseX,mouseY,50+j*50,50+i*50)<20){
        handChess=board[i][j];
        board[i][j]=0;
      }
    }
  }
}
void mouseReleased()
{
  int i=(mouseY+25-50)/50;
  int j=(mouseX+25-50)/50;
  board[i][j]=handChess;
  handChess=0;
}
```
```
實作程式8:寫出暗棋的基本排列與棋盤
int [][]board={
  { 1, 2, 2, 3, 3, 4, 4, 5},
  { 5, 6, 6, 7, 7, 7, 7, 7},
  {-1,-2,-2,-3,-3,-4,-4,-5},
  {-5,-6,-6,-7,-7,-7,-7,-7}
}; //暗棋的格子,比較少 4x8=32個棋子
void setup(){
  size(500,400);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw(){
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
  }
  for (int y=50; y<=250; y+=50) {
    line( 50, y, 450, y);
  }  
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      int id = board[i][j];
      drawChess(50+25+j*50, 50+25+i*50, id);
    }
  }
}
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void drawChess(int x, int y, int id){
    fill(255);
    ellipse( x, y, 40, 40);
    if(id>0){//黑
      fill(0);
      text( name2[id-1], x, y-3);
    }else{//紅
      fill(255,0,0);
      text( name2[-id-1], x, y-3);
    }
}
```
THE END

# Week07
今日上課目標:1.複習暗棋2.記憶卡片遊戲3.打字遊戲,水果忍者/鍵盤忍者

主題一:暗棋
Step1:先去老師的github網址:github.com/jsyeh/2022interaction，把上上週(第五週)
，最後一個暗棋程式碼複製貼上。
```
Step2:更改三個地方:改中文，加入亂數洗牌，翻牌迴圈有錯誤。
int [][]show={
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0}
};//翻牌前, 0 都不會秀哦! 
int [][]board={
  { 1, 2, 2, 3, 3, 4, 4, 5},
  { 5, 6, 6, 7, 7, 7, 7, 7},
  {-1,-2,-2,-3,-3,-4,-4,-5},
  {-5,-6,-6,-7,-7,-7,-7,-7}
}; //暗棋的格子,比較少 4x8=32個棋子
void setup(){
  size(500,300);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
  for(int k=0;k<1000;k++)
  {
    int i1=int(random(4)),j1=int(random(8));
    int i2=int(random(4)),j2=int(random(8));
    int temp=board[i1][j1];
    board[i1][j1]=board[i2][j2];
    board[i2][j2]=temp;
  }
}
void draw(){
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
  }
  for (int y=50; y<=250; y+=50) {
    line( 50, y, 450, y);
  }  
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      if(show[i][j]==0){
        fill(255);
        ellipse( 50+25+j*50, 50+25+i*50, 40, 40);        
      }else{
        int id = board[i][j];
        drawChess(50+25+j*50, 50+25+i*50, id);
      }
    }
  }
}
void mousePressed(){
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      if(dist(mouseX,mouseY,50+25+j*50,50+25+i*50)<20){
        if( show[i][j]==0 ) show[i][j] = 1; //沒秀? 秀它
        //之後再加棋子的移動
      }
    }
  }
}
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void drawChess(int x, int y, int id){
    fill(255);
    ellipse( x, y, 40, 40);
    if(id>0){//黑
      fill(0);
      text( name[id-1], x, y-3);
    }else{//紅
      fill(255,0,0);
      text( name2[-id-1], x, y-3);
    }
}
```
```
Step3:加上棋子移動+吃棋。
-按下已翻牌的棋子，棋子顏色會變綠色，代表選擇這個棋子(待移動中的棋子)。
-移動的棋子，底棋會變透明的綠色。
-移動棋子並吃棋。移動後，原本位置的棋子不會再顯示。
int [][]show={
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0}
};//翻牌前, 0 都不會秀哦! 
int [][]board={
  { 1, 2, 2, 3, 3, 4, 4, 5},
  { 5, 6, 6, 7, 7, 7, 7, 7},
  {-1,-2,-2,-3,-3,-4,-4,-5},
  {-5,-6,-6,-7,-7,-7,-7,-7}
}; //暗棋的格子,比較少 4x8=32個棋子
void setup(){
  size(500,300);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
  for(int k=0;k<1000;k++)
  {
    int i1=int(random(4)),j1=int(random(8));
    int i2=int(random(4)),j2=int(random(8));
    int temp=board[i1][j1];
    board[i1][j1]=board[i2][j2];
    board[i2][j2]=temp;
  }
}
void draw(){
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
  }
  for (int y=50; y<=250; y+=50) {
    line( 50, y, 450, y);
  }  
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      if(show[i][j]==0){
        fill(255);
        ellipse( 50+25+j*50, 50+25+i*50, 40, 40);        
      }else{
        int id = board[i][j];
        drawChess(50+25+j*50, 50+25+i*50, id);
      }
    }
  }
  if(moving)
  {
       fill(0,255,0,128);
       ellipse(50+25+moveJ*50,50+25+moveI*50,40,40);
       
       drawChess(mouseX,mouseY,moveID);    
  }
}
int moveI=-1,moveJ=-1,moveID=-1;
boolean moving=false;
void mousePressed(){
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      if(dist(mouseX,mouseY,50+25+j*50,50+25+i*50)<20){
        if( show[i][j]==0 ) show[i][j] = 1; //沒秀? 秀它
        //之後再加棋子的移動
        else{
          moveI=i;
          moveJ=j;
          moveID=board[i][j];
          moving=true;
        }
      }
    }
  }
}
void mouseReleased()
{
  for(int i=0;i<4;i++){
    for(int j=0;j<8;j++){
         if(dist(mouseX,mouseY,50+25+j*50,50+25+i*50)<20){
           if(moving){
             board[moveI][moveJ]=0;
             board[i][j]=moveID;
             moving=false;
           }
         }
      }
  }
}
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void drawChess(int x, int y, int id){
    if(id==0)return;
    fill(255);
    ellipse( x, y, 40, 40);
    if(id>0){//黑
      fill(0);
      text( name[id-1], x, y-3);
    }else{//紅
      fill(255,0,0);
      text( name2[-id-1], x, y-3);
    }
}
```

主題二:水果忍者
-下載音樂檔:moodle上第二個網址為整個遊戲程式碼，打開js檔案Ctrl+F搜尋框內輸入mp3，改變moodle上的第三個網址的檔名去做下載。
-把音樂檔拖拉至程式碼檔案內(Ctrl+K看檔案，data裡會有音檔)
-程式碼要能播音檔前，要先把外掛裝起來(Sketch-Library-Manage Libraries，找sound開頭的下載。
```
-使用SoundFile播放音樂:程式碼開始播放音樂，按下滑鼠變換音樂。
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
```
```
-利用鍵盤互動去做很多音樂檔的播放。
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
```
The End

# Week08
目標:繼續做上週的水果忍者:先把上週播放音樂前的設定步驟做一做。
```
1.寫個簡單的播音樂程式。
import processing.sound.*;
SoundFile sound1,sound2,sound3;
void setup()
{
  size(400,300);
  sound1=new SoundFile(this,"In Game Music.mp3");
  sound1.play();
}
void draw()
{
  
}
```
```
2.利用一個變數，搭配滑鼠偵測，用if判斷stage，做相對的音樂切換。
import processing.sound.*;
SoundFile sound1,sound2,sound3;
void setup()
{
  size(400,300);
  textSize(50);
  fill(255,0,0);
  sound1=new SoundFile(this,"In Game Music.mp3");
  sound2=new SoundFile(this,"Intro Song_Final.mp3");
  sound1.play();
}
int stage=1;
void draw()
{
  background(255);
  if(stage==1){
     text("stage 1",100,100);
  }else if(stage==2){
     text("stage 2",100,100);
  }
}
void mousePressed()
{
   if(stage==1){
     stage=2;
     sound1.stop();
     sound2.play();
   }else if(stage==2){
     stage=1;
     sound2.stop();
     sound1.play();
   }
}
```
```
3.太複雜了!所以不加音樂，再做一次stage切換的程式。
void setup()
{
  size(400,300);
}
int stage=1;
void draw()
{
  background(255,255,0);
  fill(255,0,0);
  textSize(80);
  if(stage==1){
    text("stage 1",100,100);
  }else if(stage==2){
    text("stage 2",100,100);
  }
}
void mousePressed()
{
  if(stage==1)stage=2;
  else if (stage==2)stage=1;
}
```
```
4.水果飛起來，按下鍵盤，水果暫停。

void setup()
{
  size(400,300);
}
float fruitX=200,fruitY=150;
float fruitVX=1,fruitVY=-1;
boolean flying=true;
void draw()
{
  background(255,255,0);
  
  ellipse(fruitX,fruitY,50,50);
  if(flying){
    fruitX+=fruitVX;
    fruitY+=fruitVY;
  }
}
void keyPressed()
{
  flying=false;
}
```
```
5.水果加上重力，然後改變每次的位置。
void setup()
{
  size(400,300);
}
float fruitX=200,fruitY=300;
float fruitVX=2,fruitVY=-13;
boolean flying=true;
void draw()
{
  background(255,255,0);
  
  ellipse(fruitX,fruitY,50,50);
  if(flying){
    fruitX+=fruitVX;
    fruitY+=fruitVY;
    fruitVY+=0.98/3;
  }
}
void keyPressed()
{
  flying=false;
  fruitReset();
}
void fruitReset()
{
  fruitX=random(100,300);
  fruitY=300;
  fruitVX=random(-2,+2);
  fruitVY=-13;
  flying=true;
}
```
```
6.把全部水果寫成一個class，更高階的寫法。
class Fruit{
  float x,y,vx,vy;
  boolean flying;
  PApplet sketch;
  Fruit(PApplet _sketch){
    sketch=_sketch;
    reset();
  }
  void reset()
  {
    x=sketch.random(100.0,300.0);
    y=300;
    vx=sketch.random(-2,+2);
    vy=-13;
    flying=true;
  }
  void update(){
    x+=vx;
    y+=vy;
    vy+=0.98/3;
  }
}
Fruit fruit;
void setup()
{
  size(400,300);
  fruit=new Fruit(this);
}
void draw()
{
  background(255,255,0);
  ellipse(fruit.x,fruit.y,50,50);
  fruit.update();
}
void keyPressed()
{
  fruit.reset();
}
```
```
7.如果按對水果上的字母，會再跑出一個水果。
Fruit [] fruits;
void setup()
{
  size(400,300);
  fruits=new Fruit[3];
  for(int i=0;i<3;i++)
  {
    fruits[i]=new Fruit(this);
  }
}
void draw()
{
  background(255,255,0);
  for(int i=0;i<3;i++){
    fill(255);ellipse(fruits[i].x,fruits[i].y,50,50);
    textSize(30);
    textAlign(CENTER,CENTER);
    fill(0);text(fruits[i].c,fruits[i].x,fruits[i].y);
    fruits[i].update();
  }
}
void keyPressed()
{
  for(int i=0;i<3;i++)
  {
    if(keyCode==fruits[i].c)
    {
      fruits[i].reset();
    }
  }
}
```
```
//Fruit Class
String line="ABCDEFGHIJKLMNOPQRSTUVWXY";
class Fruit{
  float x,y,vx,vy;
  boolean flying;
  PApplet sketch;
  char c;
  Fruit(PApplet _sketch){
    sketch=_sketch;
    reset();
  }
  void reset()
  {
    x=sketch.random(100.0,300.0);
    y=300;
    vx=sketch.random(-2,+2);
    vy=-13;
    flying=true;
    int i=int(random(26));
    c=line.charAt(i);
  }
  void update(){
    x+=vx;
    y+=vy;
    vy+=0.98/3;
  }
}
```
The End

# Week10
老師講解期中報告及示範幾種類型遊戲的程式碼。
爆爆王version 1。
The End

# Week11
爆爆王version 2。
The End

# Week12
老師有教網路連線的方法。
爆爆王version 3。
The End

# Week13
爆爆王version 4。
問題:程式碼排版問題。
The End
