class Defender
{
  int x = width/2; //position - x,y
  int y = 670;
  
  Defender()
  {
    
  }
  
  void render()
  {
    fill(0,250,0);
    rectMode(CENTER);
    rect(x,y,30,50);
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
