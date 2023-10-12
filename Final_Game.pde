import java.util.Arrays;

PImage StartSplash;
int counter = 2;
int score;
int randomX = (int) random(20, width - 20);
int randomY = (int) random(-25, -50);
Earth e1;
Defender d1;
KillZone k1;
ArrayList<Alien> alienArray = new ArrayList<Alien>();
ArrayList<AlienF> alienFArray = new ArrayList<AlienF>();
int[] sortedScore = new int[10];

// game states
final int PLAYING = 0;
final int FINISHED = 1;
final int START = 2;
int gameMode = START;

void setup() {
  size(400, 800);
  e1 = new Earth(200, 950, 3);
  d1 = new Defender();
  k1 = new KillZone();
  ScoreSTP();
}

void ScoreSTP()
{
  //reload game to see updated scores
  String[] Leaderboard = loadStrings("data/Score.txt");
  sortedScore = reverse(sort(int(Leaderboard)));
  saveStrings("data/Score.txt", str(sortedScore));
  println("\n\n\nTop Scores:");
  for (String scores : Leaderboard) {
    println(scores);
  }
  if (gameMode == FINISHED) {
    Leaderboard[9] = str(score);
    saveStrings("data/Score.txt", Leaderboard);
  }
}

void keyPressed()
{
  if (key == ' ' && gameMode != PLAYING) {
    gameMode = PLAYING;
    reset();
  }
}

void reset()
{
  alienArray.clear();
  alienFArray.clear();
  e1.health = 3;
  score = 0;
  counter = 2;
}

void StartM()
{
  imageMode(CENTER);
  StartSplash = loadImage ("StartSplash.png");
  background(0, 0, 0);
  image(StartSplash, width/2, height/2);
}

void draw ()
{
  if (gameMode == START) {
    StartM();
  }

  if (gameMode == FINISHED) {
    StartM();
    sortedScore[9] = score;
    saveStrings("data/Score.txt", str(sortedScore));
    println("\n\n\nTop Scores:");
    for (int scores : sortedScore) {
      println(scores);
    }
  }

  if (gameMode == PLAYING) {
    background(0, 0, 0);
    textSize(30);
    text("Lives: "+ e1.health, 0, 25);
    text("Score: "+ score, 0, 65);
    e1.render();
    for ( Alien alien : alienArray ) {
      alien.update();
    }
    for ( AlienF alienF : alienFArray ) {
      alienF.update();
    }


    for (int i = 0; i < alienArray.size(); i++) {
      Alien currentAlien = alienArray.get(i);
      currentAlien.update();

      if (d1.collision(currentAlien)) {
        alienArray.remove(currentAlien);
        counter++;
      }

      if (e1.collision(currentAlien)) {
        alienArray.remove(currentAlien);
        e1.health-=1;
      }

      if (mouseButton == LEFT) {
        if (k1.collision(currentAlien)) {
          alienArray.remove(currentAlien);
          counter++;
          score++;
        }
      }
    }

    for (int i = 0; i < alienFArray.size(); i++) {
      AlienF currentAlienF = alienFArray.get(i);
      currentAlienF.update();

      if (d1.collision(currentAlienF)) {
        alienFArray.remove(currentAlienF);
        counter++;
      }

      if (e1.collision(currentAlienF)) {
        alienFArray.remove(currentAlienF);
        e1.health-=1;
      }

      if (mouseButton == LEFT) {
        if (k1.collision(currentAlienF)) {
          alienFArray.remove(currentAlienF);
          counter++;
          score+=2;
        }
      }
    }

    while (alienArray.size() < counter/2) {
      alienArray.add(new Alien(randomX, randomY));
    }

    while (alienFArray.size() < counter/5) {
      alienFArray.add(new AlienF(randomX, randomY));
    }
    k1.render(mouseX, mouseY);
    d1.render();
    d1.x = mouseX;
  }

  if (e1.health <= 0) {
    gameMode = FINISHED;
    println("\n\n\nYour score is: " + score);
  }
}
