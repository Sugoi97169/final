PImage player;
PImage bullet;
float px =240,py=240 ;
float bulletx,bullety ;
void setup() {
  size(640, 480, P2D);
 player = loadImage("img/player.png");
 bullet = loadImage("img/bullet.png");
}


void draw() {
  background(255);  
fill(255,0,0);
image( player, px, py,80,80);

}

void  keyPressed() {
 if (keyPressed) {
    if (key == 'w'||key == 'W') {
      py-=5;
      }
    if (key == 's'||key == 'S') {
        py+=5;
    }
    if (key == 'a'||key == 'A' ){
        px-=5;
    }
    if (key == 'd'||key == 'D') {
        px+=5;
    }
    if(keyCode == BACKSPACE){
    bullet();
    }
   }
  image( player, px, py,80,80);
}

void mousePressed(){
bullet();

}
void mouseReleased(){
image(bullet,bulletx,bullety,20,20); 

}

void  keyReleased(){
image( player, px, py,80,80);

}

void bullet(){
    bulletx =px-40;
  bullety = py;
}
