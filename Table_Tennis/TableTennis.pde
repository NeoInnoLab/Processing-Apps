/********* VARIABLES *********/

// We control which screen is active by settings / updating
// gameScreen variable. We display the correct screen according
// to the value of this variable.
//
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen

int gameScreen = 0;

/********* Ball & Gravity *********/
int ballX, ballY;
int ballSize = 20;
int ballColor = color(200,120,0);
float gravity = 0.8;
float ballSpeedVert = 0;
/********* Air Friction *********/
float airfriction = 0.001;
float friction = 0.1;
/********* Racket *********/
color racketColor = color(255,0,0);
float racketWidth = 100;
float racketHeight = 10;
int racketBounceRate = 20;
float ballSpeedHorizon = 10;
/********* Walls *********/
int wallSpeed = 5;
int wallInterval = 1000;
float lastAddTime = 0;
int minGapHeight = 200;
int maxGapHeight = 300;
int wallWidth = 80;
color wallColors = color(45,60,120);
// This arraylist stores data of the gaps between the walls. Actuals walls are drawn accordingly.
// [gapWallX, gapWallY, gapWallWidth, gapWallHeight]
ArrayList<int[]> walls = new ArrayList<int[]>();
/********* Health & Score *********/
int maxHealth = 100;
float health = 100;
float healthDecrease = 1;
int healthBarWidth = 60;
int score = 0;

/********* SETUP BLOCK *********/

void setup() {
  size(500, 500);
/********* Ball & Gravity *********/
  ballX=width/4;
  ballY=height/5;
  smooth();
}


/********* DRAW BLOCK *********/
void draw() {
  // Display the contents of the current screen
  if (gameScreen == 0) {
    initScreen();
  } 
  else if (gameScreen == 1) {
    gameScreen();
  } 
  else if (gameScreen == 2) {
    gameOverScreen();
  }
}


/********* SCREEN CONTENTS *********/

void initScreen() {
  background(255,255,255);
  textAlign(CENTER);
  fill(255, 0, 0);
  textSize(20); 
  text("Click to start", width/2, 300);
  fill(255, 125, 0);
  textSize(40);
  text("Table Tennis", width/2, height/2);
  fill(0, 0, 0);
  textSize(10); 
  text("By Shanda Wun", 460, 480);
}

void gameScreen() {
  background(255);
/**** Ball & Gravity ****/
  drawBall();
  applyGravity();
  keepInScreen();
/**** Racket ****/
  drawRacket();
  watchRacketBounce();
  applyHorizontalSpeed();
/**** Wall ****/  
  wallAdder();
  wallHandler();
/**** Health & Score ****/
  drawHealthBar();
  printScore();
}

void gameOverScreen() {
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(50);
  text("WTF Game Over", width/2, 150);
  textSize(15);
  text("Click to Restart", width/2, 350);
  textSize(25);
  fill(150,150,0);
  text("Your Score", width/2, 230);
  textSize(70);
  fill(255,180,0);
  text(score, width/2, height/2+50);
}



/********* Ball & Gravity *********/
void drawBall() {
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
}

void applyGravity() {
  ballSpeedVert += gravity;
  ballY += ballSpeedVert;
  ballSpeedVert -= (ballSpeedVert * airfriction);
}

// keep ball in the screen
void keepInScreen() {
  // ball hits floor
  if (ballY+(ballSize/2) > height) { 
    makeBounceBottom(height);
  }
  // ball hits ceiling
  if (ballY - (ballSize/2) < 0) {
    makeBounceTop(0);
  }
  if (ballX - (ballSize/2) < 0){
    makeBounceLeft(0);
  }
  if (ballX+(ballSize/2) > width){
    makeBounceRight(width);
  }
}
void makeBounceBottom(int surface) {
  ballY = surface-(ballSize/2);
  ballSpeedVert *= -1;
  ballSpeedVert -= (ballSpeedVert * friction);
}
void makeBounceTop(int surface) {
  ballY = surface+(ballSize/2);
  ballSpeedVert *= -1;
  ballSpeedVert -= (ballSpeedVert * friction);
}
void applyHorizontalSpeed(){
  ballX += ballSpeedHorizon;
  ballSpeedHorizon -= (ballSpeedHorizon * airfriction);
}
void makeBounceLeft(int surface){
  ballX = surface + (ballSize/2);
  ballSpeedHorizon *= -1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}
void makeBounceRight(int surface){
  ballX = surface - (ballSize/2);
  ballSpeedHorizon *= -1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}

/********* Racket *********/
void drawRacket(){
  fill(racketColor);
  rectMode(CENTER);
  rect(mouseX, mouseY, racketWidth, racketHeight);
}
void watchRacketBounce() {
  float overhead = mouseY - pmouseY;
  if ((ballX + (ballSize/2) > mouseX - (racketWidth/2)) && (ballX- (ballSize/2) < mouseX + (racketWidth/2))) {
    if (dist(ballX, ballY, ballX, mouseY)<=(ballSize/2)+ abs(overhead)) {
      makeBounceBottom(mouseY);
      ballSpeedHorizon = (ballX - mouseX)/10;
      // racket moving up
      if (overhead<0) {
        ballY += overhead;
        ballSpeedVert += overhead;
      }
    }
  }
}
/************* Wall*************/
void wallHandler(){
  for(int i = 0; i < walls.size(); i++){
    wallRemover(i);
    wallMover(i);
    wallDrawer(i);
    watchWallCollision(i);
  }
}

  //If the current millisecond millis() minus the last added millisecond lastAddTime 
  //is larger than our interval value wallInterval, 
  //it means it is now time to add a new wall. 
void wallAdder(){
  if( millis() - lastAddTime > wallInterval){
    int randHeight = round(random(minGapHeight, maxGapHeight));
    int randY = round(random(0, height - randHeight));
    int[] randWall = {width, randY, wallWidth, randHeight, 0 };
    walls.add(randWall);
    lastAddTime = millis();
  }
}
void wallDrawer(int index){
  int[] wall = walls.get(index);
  // get gap wall settings
  int gapWallX = wall[0];
  int gapWallY = wall[1];
  int gapWallWidth = wall[2];
  int gapWallHeight = wall[3];
  // draw actual walls
  rectMode(CORNER);
  noStroke();
  strokeCap(ROUND);
  fill(wallColors);
  rect(gapWallX, 0, gapWallWidth, gapWallY, 0, 0, 15, 15);
  rect(gapWallX, gapWallY + gapWallHeight, gapWallWidth, height - (gapWallY + gapWallHeight));
}
void wallMover(int index){
  int[] wall = walls.get(index);
  wall[0] -=wallSpeed;
}
void wallRemover(int index){
  int[]wall = walls.get(index);
  if(wall[0] + wall[2] <= 0){
    walls.remove(index);
  }
}
void watchWallCollision(int index) {
  int[] wall = walls.get(index);
  // get gap wall settings 
  int gapWallX = wall[0];
  int gapWallY = wall[1];
  int gapWallWidth = wall[2];
  int gapWallHeight = wall[3];
  int wallTopX = gapWallX;
  int wallTopY = 0;
  int wallTopWidth = gapWallWidth;
  int wallTopHeight = gapWallY;
  int wallBottomX = gapWallX;
  int wallBottomY = gapWallY+gapWallHeight;
  int wallBottomWidth = gapWallWidth;
  int wallBottomHeight = height-(gapWallY+gapWallHeight);
  
  int wallScored = wall[4];
  
  if (
    (ballX+(ballSize/2)>wallTopX) &&
    (ballX-(ballSize/2)<wallTopX+wallTopWidth) &&
    (ballY+(ballSize/2)>wallTopY) &&
    (ballY-(ballSize/2)<wallTopY+wallTopHeight)
    ) {
    decreaseHealth();
  }
   if (
    (ballX+(ballSize/2)>wallBottomX) &&
    (ballX-(ballSize/2)<wallBottomX+wallBottomWidth) &&
    (ballY+(ballSize/2)>wallBottomY) &&
    (ballY-(ballSize/2)<wallBottomY+wallBottomHeight)
    ) {
    decreaseHealth();
  }
  if (ballX > gapWallX+(gapWallWidth/2) && wallScored==0) {
    wallScored=1;
    wall[4]=1;
    score();
  }
}
void score() {
  score++;
}
void printScore(){
  textAlign(CENTER);
  fill(0);
  textSize(30); 
  text(score, height/2, 50);
}

/********* Health & Score *********/
void drawHealthBar() {
  // Make it borderless:
  noStroke();
  fill(236, 240, 241);
  rectMode(CORNER);
  rect(ballX-(healthBarWidth/2), ballY - 30, healthBarWidth, 5);
  if (health > 60) {
    fill(46, 204, 113);
  } else if (health > 30) {
    fill(230, 126, 34);
  } else {
    fill(231, 76, 60);
  }
  rectMode(CORNER);
  rect(ballX-(healthBarWidth/2), ballY - 30, healthBarWidth*(health/maxHealth), 5);
}
void decreaseHealth(){
  health -= healthDecrease;
  if (health <= 0){
    gameOver();
  }
}

  
/********* INPUTS *********/

public void mousePressed() {
  // if we are on the initial screen when clicked, start the game
  if (gameScreen==0) {
    startGame();
  }
  if (gameScreen==2){
    restart();
  }
}
void restart() {
  score = 0;
  health = maxHealth;
  ballX=width/4;
  ballY=height/5;
  lastAddTime = 0;
  walls.clear();
  gameScreen = 0;
}

/********* OTHER FUNCTIONS *********/

// This method sets the necessary variables to start the game  
void startGame() {
  gameScreen = 1;
}

void gameOver(){
  gameScreen = 2;
}
