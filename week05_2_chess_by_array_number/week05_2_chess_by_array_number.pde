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
