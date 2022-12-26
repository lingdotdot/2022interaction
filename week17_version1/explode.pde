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
