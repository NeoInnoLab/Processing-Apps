class Ball{
  //float x, y;
  PVector location;
  //float xspeed, yspeed;
  PVector velocity;
  
  Ball(){
     //x = width/2;
     //y = height/ 2;
     location = new PVector(width/2, height/2);
     //xspeed = 2.5;
     //yspeed = -2;
     velocity = new PVector(2.5, -2);
  }
  
  void move(){
    location.add(velocity);
    //location = location + velocity;
    //x = x + xspeed;
    //y = y + yspeed;
  }
  
  void bounce(){
    if((location.x>width)||(location.x<0)){
      velocity.x = velocity.x * -1;
    }
    if((location.y>height)||(location.y<0)){
      velocity.y = velocity.y * -1;
    }
  }
  
  void display(){
    ellipse(location.x, location.y, 48, 48);
    stroke(0);
    strokeWeight(4);
    fill(50);
  }
}
