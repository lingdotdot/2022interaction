int playerJ1=0, playerI1=2;
int playerJ2=10,playerI2=4;
int [][] bombT1 = new int[8][11];//0:沒有, 倒數計時frame
int [][] bombT2 = new int[8][11];
int [][] map = { //0: 路(可走), 1:房子(卡住), -1:紅色炸彈(卡住), -2: 會殺玩家的範圍(殺人) -3:紅色炸開後佔的範圍(可走)
                // 6: 綠色炸彈(卡住), 7:會殺玩家的範圍(殺人)  8:綠色炸開後佔的範圍(可走)
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0}, //1: 房子
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0}, //1: 房子
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0}, //1: 房子
  {0,0,0,0,0,0,0,0,0,0,0},  
  {0,0,0,0,0,0,0,0,0,0,0},
};
void setup(){
  size( 550, 400);
}
void explode1(int i, int j, int c){
  map[i][j]=c;
  bombT1[i][j]=30;
  if(i+1<8 && (map[i+1][j]!=1 && map[i+1][j]!=-1) ) {map[i+1][j]=c; bombT1[i+1][j]=30;}
  if(i-1>=0 && (map[i-1][j]!=1 && map[i-1][j]!=-1) ) {map[i-1][j]=c; bombT1[i-1][j]=30;}
  if(j+1<11 && (map[i][j+1]!=1 && map[i][j+1]!=-1) ) {map[i][j+1]=c; bombT1[i][j+1]=30;}
  if(j-1>=0 && (map[i][j-1]!=1 && map[i][j-1]!=-1) ) {map[i][j-1]=c; bombT1[i][j-1]=30;}
}
void explode2(int i, int j, int c){
  map[i][j]=c;
  bombT2[i][j]=30;
  if(i+1<8 && (map[i+1][j]!=1 && map[i+1][j]!=-1) ) {map[i+1][j]=c; bombT2[i+1][j]=30;}
  if(i-1>=0 && (map[i-1][j]!=1 && map[i-1][j]!=-1) ) {map[i-1][j]=c; bombT2[i-1][j]=30;}
  if(j+1<11 && (map[i][j+1]!=1 && map[i][j+1]!=-1) ) {map[i][j+1]=c; bombT2[i][j+1]=30;}
  if(j-1>=0 && (map[i][j-1]!=1 && map[i][j-1]!=-1) ) {map[i][j-1]=c; bombT2[i][j-1]=30;}
}
void draw(){
  background(#8E7B11);
  for(int i=0; i<8; i++){
    for(int j=0; j<11; j++){
      if(map[i][j]==1){
        fill(#62E376);
        rect(j*50, i*50, 50, 50);
      }else if(map[i][j]==-1){
        fill(#0F8FB4);
        rect(j*50, i*50, 50, 50);        
      }else if(map[i][j]==-2){
        fill(255);
        rect(j*50, i*50, 50, 50);   
      }else if(map[i][j]==-3){
        fill(#34E9F7);
        rect(j*50, i*50, 50, 50);   
      }else if(map[i][j]==6){
        fill(#F21111);
        rect(j*50, i*50, 50, 50);        
      }else if(map[i][j]==7){
        fill(255);
        rect(j*50, i*50, 50, 50);   
      }else if(map[i][j]==8){
        fill(#FA7C8F);
        rect(j*50, i*50, 50, 50);   
      }
    }
  }
  ///以上畫圖, 以下程式的執行判斷
  for(int i=0; i<8; i++){
    for(int j=0; j<11; j++){
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
      }else{
        noFill();
        rect(j*50, i*50, 50, 50);
      }
    }
  }
  fill(255);
  int playerX1=playerJ1*50+25;
  int playerY1=playerI1*50+25;
  ellipse(playerX1, playerY1, 50,50);
  fill(#151313);
  int playerX2=playerJ2*50+25;
  int playerY2=playerI2*50+25;
  ellipse(playerX2,playerY2,50,50);
}
void keyPressed(){
  if(keyCode==RIGHT && notBlock1(1,0) ) playerJ1++;
  if(keyCode==LEFT && notBlock1(-1,0) ) playerJ1--;
  if(keyCode==DOWN && notBlock1(0,1) ) playerI1++;
  if(keyCode==UP && notBlock1(0,-1) ) playerI1--;
  if(key=='f' && notBlock2(1,0) ) playerJ2++;
  if(key=='s' && notBlock2(-1,0) ) playerJ2--;
  if(key=='d' && notBlock2(0,1) ) playerI2++;
  if(key=='e' && notBlock2(0,-1) ) playerI2--;
  if(key==' ') {
    map[playerI1][playerJ1]=-1;//炸彈
    bombT1[playerI1][playerJ1]=60;//等60frame,1秒
  }
  if(key=='1') {
    map[playerI2][playerJ2]=6;//炸彈
    bombT2[playerI2][playerJ2]=60;//等60frame,1秒
  }
  int Score1=0;
  int Score2=0;
  if(key=='p'){
    for(int i=0;i<8;i++){
    for(int j=0;j<11;j++){
        if(map[i][j]==-3)Score1++;
        if(map[i][j]==8)Score2++;
      }
    }
    println(Score1);
    println(Score2);
  }
}
boolean notBlock1(int x, int y){
  if(playerI1+y<0 || playerI1+y>=8) return false;//超過界線
  if(playerJ1+x<0 || playerJ1+x>=11) return false;//超過界線
  if(map[playerI1+y][playerJ1+x]==1) return false;//不可以走
  else return true;//可以走
}
boolean notBlock2(int x, int y){
  if(playerI2+y<0 || playerI2+y>=8) return false;//超過界線
  if(playerJ2+x<0 || playerJ2+x>=11) return false;//超過界線
  if(map[playerI2+y][playerJ2+x]==1) return false;//不可以走
  else return true;//可以走
}
