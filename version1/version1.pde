int playerJ1=0,playerI1=2;//初始位置
int playerJ2=10,playerI2=4;
int X1,Y1;
int X2,Y2;
int bomb1=0;
int bomb2=0;
int playerX1,playerY1;
int playerX2,playerY2;
int [][] bombT1 = new int[8][11];
int [][] bombT2 = new int[8][11];
int [][]map={
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0},
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0},
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0},
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0},
};
void setup(){
  size(550,400);
}
int waiting1=1;
int waiting2=1;
void draw(){
  background(#8E7B11);
  for(int i=0;i<8;i++){
    for(int j=0;j<11;j++){
      if(map[i][j]==1){
        fill(#118E3B);
        rect(j*50,i*50,50,50);
      }else if(map[i][j]==-1){
        fill(#0F8FB4);
        rect(j*50,i*50,50,50);
      if(bombT1[i][j]>0)
      {
        bombT1[i][j]--;
        waiting1=0;
      }
      else if(bombT1[i][j]==0){    
              if(bomb1>0)bomb1--;
              else{
              bombpop1(X1,Y1);
              break;
          }
        }
      }
      else if(map[i][j]==-2){
        fill(#F21111);
        rect(j*50,i*50,50,50);
      if(bombT2[i][j]>0)
      {
        bombT2[i][j]--;
        waiting2=0;
      }
      else if(bombT2[i][j]==0){    
              if(bomb2>0)bomb2--;
              else{
              bombpop2(X2,Y2);
              break;
          }
        }
      }
      else{
        noFill();
        rect(j*50, i*50, 50, 50);
      }
    }
  }
  fill(255);
  playerX1=playerJ1*50+25;
  playerY1=playerI1*50+25;
  ellipse(playerX1,playerY1,50,50);
  fill(#151313);
  playerX2=playerJ2*50+25;
  playerY2=playerI2*50+25;
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
  if(waiting1==1){
    if(key==' '){
      map[playerI1][playerJ1]=-1;
      bombT1[playerI1][playerJ1]=120;
      X1=playerI1;
      Y1=playerJ1;
    }
  }
  if(waiting2==1){
    if(key=='1'){
      map[playerI2][playerJ2]=-2;
      bombT1[playerI2][playerJ2]=120;
      X2=playerI2;
      Y2=playerJ2;
    }
  }
  int Score1=0;
  int Score2=0;
  if(key=='p'){
    for(int i=0;i<8;i++){
    for(int j=0;j<11;j++){
        if(map[i][j]==-1)Score1++;
        if(map[i][j]==-2)Score2++;
      }
    }
    println(Score1);
    println(Score2);
  }
}
boolean notBlock1(int x, int y){
  if(playerI1+y<0||playerI1+y>=8)return false;
  if(playerJ1+x<0||playerJ1+x>=11)return false;
  if(map[playerI1+y][playerJ1+x]==1) return false;//不可以走
  else return true;
}
boolean notBlock2(int x, int y){
  if(playerI2+y<0||playerI2+y>=8)return false;
  if(playerJ2+x<0||playerJ2+x>=11)return false;
  if(map[playerI2+y][playerJ2+x]==1) return false;//不可以走
  else return true;
}
void bombpop1(int X1,int Y1)
{  
    bomb1=bomb1+1500;
   if(X1-1>=0 && X1-1<8){
     if(map[X1-1][Y1]!=1)
      map[X1-1][Y1]=-1;
   }
   if(X1+1>=0 && X1+1<8){
      if(map[X1+1][Y1]!=1)
      map[X1+1][Y1]=-1;
   }
   if(Y1-1>=0 && Y1-1<11){
     if(map[X1][Y1-1]!=1)
      map[X1][Y1-1]=-1;
   }
   if(Y1+1>=0 && Y1+1<11){
     if(map[X1][Y1+1]!=1)
      map[X1][Y1+1]=-1;
   }
   waiting1=1;
}
void bombpop2(int X2,int Y2)
{  
    bomb2=bomb2+1500;
   if(X2-1>=0 && X2-1<8){
     if(map[X2-1][Y2]!=1)
      map[X2-1][Y2]=-2;
   }
   if(X2+1>=0 && X2+1<8){
      if(map[X2+1][Y2]!=1)
      map[X2+1][Y2]=-2;
   }
   if(Y2-1>=0 && Y2-1<11){
     if(map[X2][Y2-1]!=1)
      map[X2][Y2-1]=-2;
   }
   if(Y2+1>=0 && Y2+1<11){
     if(map[X2][Y2+1]!=1)
      map[X2][Y2+1]=-2;
   }
   waiting2=1;
}
