int cols = 200;
int rows = 200;

float[][] current;// = new float[cols][rows];
float[][] previous;// = new float[cols][rows];
float damping = 0.96;

void setup(){
    size(1000,800);
    cols = width;
    rows = height;
    current = new float[cols][rows];
    previous = new float[cols][rows];    
 

    previous[100][100] = 230;
}

void mouseDragged(){
  current[mouseX][mouseY] = 500;

}

void draw(){
  background(0,197,205);
  loadPixels();
  int r=0, g=0, b=0, z=1;
  for(int i=1; i< cols-1; i++){
    for(int j=1; j< rows-1; j++){
      current[i][j] = (previous[i+1][j] + 
                       previous[i-1][j] +
                       previous[i][j+1] + 
                       previous[i][j-1]) / 2 - 
                       current[i][j];  
      current[i][j] = current[i][j] * damping;
      int index = i + j * cols;
      pixels [index] = color(current[i][j]*255);
      /*pixels [index] = color(current[i][j]*r, current[i][j]*g, current[i][j]*b);
      if ( r == 150 ) {
       z = z*(-2);
        }
        r = r + z;
        b = b - z;
      if ( r == 0 ) {
        z = z*(-2);
      }*/
    }
  }
  updatePixels();
  
  float[][] temp = previous;
  previous = current;
  current = temp;
}
