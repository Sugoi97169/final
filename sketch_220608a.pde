PImage player;
PImage bullet;
PImage background;
PImage enemy;
float x, y;
float easing =0.01;
float ex=590;
float ey;
Particle p;
int score =0;
int life =3;
float targetx = 0,targety = 0;
boolean isshoot = false;
boolean iskeypressedfirst = true;
boolean isfirst = true;
float px1,px2,py1,py2,ex1,ex2,ey1,ey2,bx1,bx2,by1,by2;
void setup() {
  size(640, 480);
   bullet = loadImage("img/bullet.png");
   player = loadImage("img/pl.png");
    background = loadImage("img/background.jpeg");
     enemy = loadImage("img/enepl.png");
  smooth();
  x = 0.5*width;
  y = 0.5*height;
}

void draw() {
image(background, 0, 0, 640, 480);
image(enemy, ex, ey, 50, 50); 

  x+=(targetx-x);
  y+=(targety-y);

   keyPressed();
image( player, x, y, 80, 80);
  if (isshoot) {
    if (isfirst) {
      p = new Particle(new PVector(x, y-10));
      isfirst = false;
    }
    p.run();
  }

   ex-=5;
  if (ex==-50) {
    ex=640;
    ey=floor(random(0, 430));
  }
  
  text("Score:"+score, 10, 10);
  text("life:"+life, 10, 30);
  
  text("x:"+x, 10, 50);
  text("y:"+y, 10, 70);
  
  text("ex:"+ex, 10, 90);
  text("ey:"+ey, 10, 110);
  
  

  if (life<0)
    text("gave over", 310, 240);

  else if (score>=500)
    text("win", 320, 240);
    
}

void enemyranpos() {
  ex=640;
  ey=floor(random(0, 430));
}

void keyPressed() {
  if (keyPressed) {
    if (key == 'w'||key == 'W') {
      if (y>0)   //boundary
        targety-=5;
    } else if (key == 's'||key == 'S') {
      if (y<400)
        targety+=5;
    } else if (key == 'a'||key == 'A') {
      if (x>0)
        targetx -= 5;
    } else if (key == 'd'||key == 'D') {
      if (x<560)
        targetx += 5;
    } else if (key == 'r'||key == 'R') {
      score =0;
      life =3;
    }
  }
}


void mousePressed() {
iskeypressedfirst = true;
}
void mouseReleased() {
  
    if (iskeypressedfirst) {
      isshoot = true;
      isfirst = true;
      iskeypressedfirst = false;
    }
  
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float lifespan;
  Particle(PVector l) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(20, 0);
    location = l.copy();
    lifespan =255.0;
  }
  
  void run() {
    update();
image(bullet, location.x, location.y, 100, 100);
text("bulletx:"+p.location.x,10,130);
text("bullety:"+p.location.y,10,150);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan-=1.0;
    boom();
  }

  boolean isDead() {
    if (lifespan<=0) {
      return true;
    } else {
      return false;
    }
  }
  
  void boom() {
    px1 =x;//minx
    px2 =x+80;//maxx
    py1 =y;//miny
    py2 =y+80;//maxy
    
    ex1 =ex;
    ex2 = ex+80;
    ey1 =ey;
    ey2 =ey+80;
    bx1 = location.x;
    bx2 = location.x+80;
    by1 = location.y;
    by2 = location.y+80;

 
if (bx2 > ex1 && ex2 > bx1 &&
        by2 > ey1 && ey2 > by1) {
        score++;
    enemyranpos();
    }

if (px2 > ex1 && ex2 > px1 &&
        py2 > ey1 && ey2 > py1) {
        life--;
    x = 140;
    y = 240;
    }

  
}

}
