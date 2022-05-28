PImage player;
PImage bullet;
PImage enemy;
int px =240,py=240;
float bulletx =-20;
float bullety =-20;
float ex=590;
float ey;
int score =0;
int life =3;
float exb,exs,eyb,eys,bxb,bxs,byb,bys,pxb,pxs,pyb,pys;
void setup() {
  size(640, 480, P2D);
 player = loadImage("img/player.png");
 bullet = loadImage("img/bullet.png");
 enemy = loadImage("img/player.png");
 ey=floor(random(0,430));
 
}


void draw() {
  background(255);  
fill(255,0,0);
image( player, px, py,80,80);
image(bullet,bulletx,bullety,20,20); 
image(enemy,ex,ey,50,50); 
ex-=5;
if(ex==-50){
  ex=640;
  ey=floor(random(0,430));
 
}
  keyPressed();
  boom();
  text("Score:"+score, 5, 10);
}

void  keyPressed() {
  if (keyPressed) {
    if (key == 'w'||key == 'W') {
  py-=5;
   image( player, px, py);
    }
    if (key == 's'||key == 'S') {

        py+=5;
image( player, px, py);
    }
    if (key == 'a'||key == 'A') {

        px -= 5;
  image( player, px, py);
     
    }
    if (key == 'd'||key == 'D') {
      
        px += 5;
   
     image( player, px, py);
    }
  }
image( player, px, py);
}


void mouseReleased(){
  bulletx = px;
  bullety =py;
  image(bullet,bulletx,bullety,20,20); 
   for(int i =0;i<=200;i++){
            bulletx++;
   }
   
   image(bullet,bulletx,bullety,20,20); 
   
   bulletx =-20;
   bullety =-20;
}

void  keyReleased(){
 
image( player, px, py,80,80);

}

void boom() {
  exb = ex+20/2;
  exs = ex-20/2;
  eyb = ey+20/2;
  eys = ey-20/2;
  bxb = bulletx+20/2;
  bxs = bulletx+20/2;
  byb = bullety+20/2;
  bys = bullety+20/2;
  pxb = px+20/2;
  pxs = px+20/2;
  pyb = py+20/2;
  pys= py+20/2;

  if (pxb >exs && exb > pxs &&
    pyb > eys && eyb > pys) {
    score++;
  }

  if (pxb >exs && exb > pxs &&
    pyb > eys && eyb > pys) {
    life--;
  }
}
