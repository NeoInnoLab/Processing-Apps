Ball b;

void setup(){
  size(500,500);
  b = new Ball();
}

void draw(){
  background(255);
  b.move();
  b.bounce();
  b.display();
}


/*int x=82, y=58;
int xspeed=2, yspeed=3;

void setup(){
  
size(500, 500);

}

void draw(){
  background(226, 220, 53);
  ellipse(x, y, 48, 48);
  stroke(0);
  strokeWeight(2);
  fill(27);
  
  x = x + xspeed;
  y = y + yspeed;

  if((x>width)||(x<0)){
    xspeed = xspeed * -1;
  }
  if((y>height)||(y<0)){
    yspeed = yspeed * -1;
  }
  


}*/
