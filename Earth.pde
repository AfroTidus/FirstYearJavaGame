class Earth
{
  int x, y;
  int health;

  Earth(int x, int y, int health)
  {
    this.x = x;
    this.y = y;
    this.health = health;
  }

  void render()
  {
    fill(0, 0, 200);
    ellipse(x, y, 500, 500);
    fill(0,200,0);
    ellipse(x+50,y-200,30,80);
    ellipse(x-70,y-150,95,50);
    ellipse(x-30,y-225,40,34);
  }
  
  boolean collision(Alien other)
  {
    return (abs(this.x - other.x)<=300 && (abs(this.y - other.y)<=250));
  }
  
    boolean collision(AlienF other)
  {
    return (abs(this.x - other.x)<=300 && (abs(this.y - other.y)<=250));
  }
}
