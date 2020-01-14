int bar = 5;
int[] bright;

void setup(){
  size(200, 300);
  colorMode(HSB, 360, 300, 300);
  bright = new int[width/bar];
}

void draw(){
  int i, j = 0;
  for(i=0;i<=width-bar; i+=bar){
    noStroke();
    if((mouseX>i) && (mouseX<i+bar)){
      bright[j] = mouseY;
    }
    fill (i, height, bright[j]);
    rect (i, 0, bar, height);
    j++;
  }
}
