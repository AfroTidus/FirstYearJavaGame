PImage Invader, Invader2;

class Alien
{
  int randomX = (int) random(20, width - 20);
  int randomY = (int) random(-25, -50);
  int x = randomX;
  int y = randomY;
  int speed=-1;
  int counter = 0;

  Alien(int x,int y)
  {
    Invader = loadImage("Invader.png");
    Invader2 = loadImage("Invader2.png");
  }

  void render()
  {
    imageMode(CENTER);
    image(Invader, x, y);
    if (counter>=0 && counter <10)
      image(Invader, x, y);
    else if (counter>=10 && counter <20)
      image(Invader2, x, y);

    if (counter >=30)
      counter=0;

    counter++;
  }

  void move()
  {
    this.y = this.y - this.speed;
  }

  boolean collision(Defender other)
  {
    int distanceX = abs(this.x-other.x); //difference in x positions
    int distanceY = abs(this.y-other.y); //difference in y positions
    return distanceX<20 && distanceY<20;
  }

  void update()
  {
    move();
    render();
  }
}
