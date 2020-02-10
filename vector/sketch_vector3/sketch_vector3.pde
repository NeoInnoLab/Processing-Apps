Mover m;

void setup(){
  size(500, 500);
  m = new Mover();
}

void draw(){
  background(255);
  m.update();
  m.edges();
  m.display();
}
