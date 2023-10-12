PImage InvaderF, InvaderF2;

class AlienF extends Alien
{
  int randomX = (int) random(20, width - 20);
  int randomY = (int) random(-25, -50);
  int x = randomX;
  int y = randomY;
  int speed=-2;
  int counter = 0;

  AlienF(int x, int y)
  {
    super(x, y);
    InvaderF = loadImage("InvaderF.png");
    InvaderF2 = loadImage("InvaderF2.png");
  }

  void render()
  {
    imageMode(CENTER);
    image(InvaderF, x, y);
    if (counter>=0 && counter <10)
      image(InvaderF, x, y);
    else if (counter>=10 && counter <20)
      image(InvaderF2, x, y);

    if (counter >=30)
      counter=0;

    counter++;
  }

  void move()
  {
    this.y = this.y - this.speed;
  }

  void update()
  {
    move();
    render();
  }
  
    boolean collision(Defender other)
  {
    int distanceX = abs(this.x-other.x); //difference in x positions
    int distanceY = abs(this.y-other.y); //difference in y positions
    return distanceX<20 && distanceY<20;
  }
}
