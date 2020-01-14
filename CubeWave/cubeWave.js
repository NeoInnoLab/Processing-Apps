let angle = 0;
let w =50;
let ma;
let maxD;

function setup() {
  createCanvas(800,800, WEBGL);
  ma = atan(1/sqrt(2));
  maxD = dist(0,0,200,200);
}


function draw() {
  background(255);
  ortho(-600,600,600,-600,0,1000);
  
  //let dirZ = mouseY-height/2;
  //let dirX = mouseX-width/2;
  //directionalLight(250, 250, 250, dirX, -dirZ, 0.25);
 // ambientLight(255,244,79)



  rectMode(CENTER);
  rotateX(QUARTER_PI);
  rotateY(ma);
  

  for (let z = 0; z < height; z+=w){
    for (let x = 0; x < width; x+=w){

    push();

    let d = dist(x,z, width/2, height/2);
    let offset = map(d,0,maxD,-PI,PI);
    let a = angle + offset;
    let h = floor(map(sin(0.6*a), -1, 1,100, 500));
    translate(x-width/2, 0, z-height/2);
    //specularMaterial(250);
    normalMaterial(250, 244, 79);
    //ambientMaterial(255,244,79);

    box(w-2, h ,w-2);
    //rect(x - width/2 +w/2, 0, w-2, h);

    pop();
    }
  }
  
  angle -= 0.125;
}
