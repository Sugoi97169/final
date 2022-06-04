PImage player;
PImage bullet;
PImage enemy;
PImage background;
int px =140,py=240;
float bulletx =-20;
float bullety =-20;
float ex=590;
float ey;
int score =0;
int life =3;
float exb,exs,eyb,eys,bxb,bxs,byb,bys,pxb,pxs,pyb,pys;
void setup() {
  size(640, 480, P2D);
 player = loadImage("img/pl.png");
 bullet = loadImage("img/bullet.png");
 enemy = loadImage("img/enepl.png");
  background = loadImage("img/background.jpeg");
 ey=floor(random(0,430));
 
}


void draw() {
image(background,0,0,640,480);
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
  text("life:"+life, 5, 20);
      if(life<=0)
       text("gave over", 310, 240);
        
       else if(score>=10)
       text("win", 320, 240);
  
  
}

void  keyPressed() {//move
  if (keyPressed) {
    if (key == 'w'||key == 'W') {
      if (py>0)   //boundary
    py-=5;

    }
    else if (key == 's'||key == 'S') {
     if (py<400)
        py+=5;

    }
    else if (key == 'a'||key == 'A') {
      if (px>0)
        px -= 5;

     
    }
    else if (key == 'd'||key == 'D') {
      if (px<560)
        px += 5;
   

    }
  }
  
}


void mouseReleased(){
  bulletx = px;
  bullety =py;

   for(int i =0;i<=20;i++){
            bulletx+=10;
 image(bullet,bulletx,bullety,10,10);
   }
              
    
   
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
