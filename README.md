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
