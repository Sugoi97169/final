PImage player;
float px ,py ;
float bulletx,bullety ;

void setup() {
  size(640, 480, P2D);
 player = loadImage("img/player.png");
 
}


void draw() {
  px = mouseX-40;
  py = mouseY-40;
  background(255);  
fill(255,0,0);
 image(player,px,py,80,80); 
bullet();

bulletx+=10f;
}



void bullet(){
circle(bulletx,bullety,20);
}
