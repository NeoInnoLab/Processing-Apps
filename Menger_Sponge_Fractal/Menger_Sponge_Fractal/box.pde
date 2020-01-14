class Box {
  PVector pos; //location of the box
  float r; //size of the box
  
  Box( float x, float y ,float z, float r_){
    pos = new PVector(x, y, z);
    r = r_;
  }
  
  ArrayList<Box> generate(){
    ArrayList<Box> boxes = new ArrayList <Box>();
    for(int x = -1; x < 2; x++){
      for(int y = -1; y < 2; y++){
        for(int z = -1; z < 2; z++){
          
          int sum = abs(x) + abs(y) + abs(z);       
                   
          float newR = r/3;  //new radius
          if (sum > 1){
          Box b = new Box (pos.x + x * newR, pos.y + y * newR, pos.z + z * newR, newR); //relative to where the box is
          boxes.add(b); 
          }
        }
      }
    }
    return boxes;  
}
  
  
  void show(){
    pushMatrix();
    translate(pos.x, pos.y, pos.z); //if wanna see the box
        
    fill(220,190,0);
    stroke(255,100);
    
    box(r); //location
    popMatrix();
  }
  
}  
