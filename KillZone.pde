class KillZone
{
  int x,y;
  int size = 20;

  KillZone()
  {
  }

  void render(int mx,int my)
  {
    x=mx;
    y=my;
    fill(0,0);
    stroke(200,0,0);
    circle(x, y, size);
    line(x,y - size/2,x,y + size/2);
    line(x - size/2,y,x + size/2,y);
    stroke(0,0,0);
  }

  boolean collision(Alien other)
  {
    int distanceX = abs(this.x-other.x); //difference in x positions
    int distanceY = abs(this.y-other.y); //difference in y positions
    return distanceX<20 && distanceY<20;
    
  }
  
   boolean collision(AlienF other)
  {
    int distanceX = abs(this.x-other.x); //difference in x positions
    int distanceY = abs(this.y-other.y); //difference in y positions
    return distanceX<20 && distanceY<20;
    
  }
}
