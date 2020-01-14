float angle = 0;
Box b;
ArrayList<Box> sponge;

PFont createdFont;

//Text3D Methods 2 & 3
//PGraphics offscreen;
//PGraphics offscreen3D;



void setup() {
  size(800, 800, P3D);
  sponge = new ArrayList<Box>();
  Box b = new Box(0, 0, 0, 400);
  sponge.add(b);
  
//Text3D Methods 2 & 3  
  //offscreen = createGraphics(width/2, 700); // default renderer
  //offscreen3D = createGraphics(width/2, 700, P3D); // 3D renderer
  createdFont = createFont("Arial", 25, true);
}

void mousePressed(){
  ArrayList<Box> next = new ArrayList<Box> ();
 
  for (Box b : sponge){
  ArrayList<Box> newBoxes = b.generate();  
  //get a thing out and make a whole bunch of boxes from it, and replace the sponge
  next.addAll(newBoxes);
}
  sponge = next;
}

void draw() {
  background(51);
  
  fill(255);
  textFont(createdFont);
  text("Shanda Milk 2018/12/20", 30, 30);
  
//Text3D Methods 2
  //offscreen.beginDraw();
  //offscreen.clear();
  //offscreen.text("Shanda Milk", 30, 30);
  //offscreen.endDraw();
  //image(offscreen, 0, 133); 

//Text3D Methods 2
  //offscreen3D.beginDraw();
  //offscreen3D.clear();
  //offscreen3D.text("Shanda Milk", 30, 30);
  //offscreen3D.endDraw();
  //image(offscreen3D, 0, 266); 
  
  
  stroke(255);
  noFill();
  lights();

  translate(width/2, height/2);
  
  rotateX(angle);
  rotateY(angle*4);
  rotateZ(angle*0.1);
  for (Box b : sponge){
  b.show();
  }
 
  angle += 0.001;
}
