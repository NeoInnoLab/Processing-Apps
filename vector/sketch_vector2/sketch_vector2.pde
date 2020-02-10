 void setup(){
   size(500,500);
 }
 void draw(){
   background(255);
   strokeWeight(2);
   stroke(0);
   noFill();
   
   translate(width/2, height/2);
   ellipse(0, 0, 4 ,4);
   
   PVector mouse = new PVector(mouseX, mouseY);
   PVector center = new PVector(width/2, height/2);
   
   mouse.sub(center);
   //mouse = mouse-center;
   mouse.mult(3);
   //mouse = mouse * 3;
   
   //float m = mouse.mag();
   //fill(255, 0 , 0);
   //rect(0,0, m, 20);
   
    //mouse.normalize();  These two are
    //mouse.mult(50);      same as below
    mouse.setMag(50);
    
   
   
   line(0, 0, mouse.x, mouse.y);
 }
