var scl = 20;
var s ;
var food;
var score = 0;
var Screen = 0;
var upWall = 40;

function setup(){ 
  createCanvas(800, 500);
  s = new Snake();
  frameRate(10);
  pickLocation();
}

function draw(){
  if (Screen === 0) {
    initScreen();
  } 
  else if (Screen === 1) {
    gameScreen();
  } 
  else if (Screen === 2) {
    gameOverScreen();
  }
  
} 


/*function mousePressed(){
  if (Screen === 0){
    startGame();
  } 
  
  if (Screen === 2){
    restart();
  }
}*/

function initScreen(){
  background(0);
  textAlign(CENTER);
  fill(255);
  textFont('Georgia');
  textSize(30); 
  text("Enter to start", width/2, 320);
  fill(255, 125, 0);
  textSize(60);
  text("Happy Snake", width/2, height/2);
  fill(255, 255, 0);
  textSize(20); 
  text("By Shanda Milk", 710, 480);
}


function startGame(){
  Screen = 1;
}

function gameScreen(){
  background(0);
  stroke(255);
  line(0, upWall, 800, upWall);
     
  s.death();
  s.update();
  s.show();
  
  fill(255);
  textFont('Georgia');
  textSize(25);
  text("Score: " + score, width/2 , 25);
  
  fill (255, 0, 0);
  stroke(0);
  rect(food.x, food.y, scl, scl);
  
  if(s.eat(food)){
    score++;
    pickLocation();
  }
  
}

function pickLocation(){
  var cols = floor(width/scl);
  var rows = floor(height/scl);
  food = createVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
}


function gameOverScreen(){
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(70);
  text("WTF Game Over", width/2, 150);
  textSize(20);
  text("Enter to Restart", width/2, 350);
  textSize(30);
  fill(150,150,0);
  text("Your Score", width/2, 230);
  textSize(70);
  fill(255,180,0);
  text(score, width/2, height/2+50);
}
   
function restart(){
  score = 0;
  s = new Snake();
  pickLocation();
  Screen = 0;
}


function keyPressed(){
  if (keyCode === ENTER){
    if (Screen === 0){
      startGame();
    } 
    if (Screen === 2){
      restart();
    }
  }
  
  
  
  if (keyCode === UP_ARROW){
    s.dir(0, -1);
  }else if (keyCode === DOWN_ARROW){
    s.dir(0, 1);
  }else if (keyCode === LEFT_ARROW){
    s.dir(-1, 0);
  }else if (keyCode === RIGHT_ARROW){
    s.dir(1, 0);
  }
}
