
let values = [];
let i = 0;
let left = 0;
let right = 0;
let mid = 0;
let target = 0;
let Screen = 0;

function setup() {
  createCanvas(1500, 720);
  for(let i = 0; i < width/62.5; i++){
    values.push(i*25+20);
  }
  right = values.length -1;
  mid = round(left + (right - left) / 2);
  target = Math.round(random(right));
  while(target === mid){
    target = Math.round(random(right));
  }
}


function draw() {
  if(Screen === 0){
      initScreen();
  } else {
     render();
  }
  
 
}

function initScreen(){
  background(360);
  textAlign(CENTER);
  textSize(60);
  text("Binary Search", 600, height/2);
  stroke(30, 143, 143);
  textSize(30); 
  text("Click to start", 600, 500);
  textSize(20); 
  text("Credit by Neo", 80, 40);
}

function startGame(){
  Screen = 1;
}


function restart(){
  Screen = 0;
  left = 0;
  right = values.length -1;
  mid = round(left + (right - left) / 2);
  target = Math.round(random(right));
  while(target === mid){
    target = Math.round(random(right));
  }
}


function mouseClicked() {
  if (Screen === 0){
      startGame();
    } 
  let ms = millis();
  if(target < mid){
    right = mid - 1;
    sleep(1000).then(()=> {
       mid = round(left + (right - left) / 2);
    });
  }
  if(target > mid){
    left = mid + 1;
    sleep(1000).then(()=> {
      mid = round(left + (right - left) / 2);
    });
  }
  if(target === mid){
      sleep(1000).then(()=> {restart();});
   }
}

function render(){
  background(360);
  for(let i = 0; i < values.length; i++){
      if((i) === left) {
       textSize(20);
       fill(90);
       text('Left', left*50+70, 25);
     } 
     if(i === right) {
       textSize(20);
       fill(90);
       text('Right', right*50+70, 40);
     }
     
     if(i === mid) {
       textSize(20);
       fill(100, 227, 170);
       text('Mid', mid*50+70, 55);
     }
     
     if(i === target) {
       textSize(20);
       fill(245, 66, 66);
       text('Target', target*50+70, 70);
     }
     
     if(mid === target) {
       textSize(32);
       fill(245, 66, 66);
       text('well done!', 300, 300);
     }
     stroke(30, 143, 143);
     rect(i*50+50 , height, 50, -values[i], 20);
     textSize(32);
     text(i, i*50+70, 100);
     textAlign(CENTER, CENTER);
     fill(200);

   }
}

function sleep(millisecondsDuration) {
  return new Promise((resolve) => {
    setTimeout(resolve, millisecondsDuration);
  });
}
