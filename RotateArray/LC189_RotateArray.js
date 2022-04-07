let values = [];
let len = 0;
let k = 0;
let Screen = 0;
let step = 0;

function setup() {
  createCanvas(1450, 780);
  for(let i = 0; i < width/58; i++){
    values.push(i);
  }
  k = Math.round(random(100));
  len = values.length;

}


function draw() {
  if(Screen === 0){
      initScreen();
  } else {
     render();
  }
}

function initScreen(){
  background(68, 137, 171);
   strokeWeight(2);
  textAlign(CENTER);
  fill(253, 253, 253);
  textSize(60);
  text("Two Pointers", width/2-30, height/2-70);
  textSize(40);
  text("189. Rotate Array", width/2-30, height/2);
  stroke(30, 143, 143);
  textSize(30); 
  text("Click to start", width/2-30, 500);
  textSize(20); 
  text("Credit by Neo", 80, 40);
}

function startGame(){
  Screen = 1;
}




function reverseArray(left, right){
   print('left',left, 'right', right);
    while(left < right) {
      let temp = values[left];
      values[left++] = values[right];
      values[right--] = temp;
      print('values',values);
      print('k',k);
  }
}

function render(){
  background(68, 137, 171);
  for(let i = 0; i < values.length; i++){
     strokeWeight(2);
     stroke(98, 168, 198);
     fill(253, 253, 253);
     rect(i*50+80 , height, 50, -values[i]*25+20, 20);
     textSize(32);
     fill(212, 212, 212);
     text(i, i*50+105, 170);
     textAlign(CENTER, CENTER);
   }
   
  textSize(40); 
  strokeWeight(4);
  stroke(253, 253, 253);
  fill(16, 85, 126);
  text(`k = ${k}`, 140, 120);
  
  stroke(88);
  strokeWeight(2);
  fill(253, 253, 253);
  if(step === 0) {
    text('Step 1.    k %= len',  width/2-70, 80);
  }
  if(step === 1) {
    text('Step 2.    Reverse  nums[0]  to  nums[length-1]',  width/2-70, 80);
  }
  if(step === 2) {
    text('Step 3.    Reverse  nums[0]  to  nums[k-1]',  width/2-70, 80);
  }
  if(step === 3) {
    text('Step 4.    Reverse  nums[k]  to  nums[length-1]',  width/2-70, 80); 
  }
  if(step === 4) {
    textSize(60);
    strokeWeight(10);
    stroke(16, 85, 126);
    fill(253,253,253);
    text('well done!', width/2-70, 80);
  }
}

function mouseClicked() {
  if (Screen === 0){
      startGame();
    } 
  else{
    print('step',step);
    let ms = millis();
    switch(step){
      case 0:
        k %= len;
        sleep(1000).then(()=> {
           step++;
         });
        break;
      case 1:
        reverseArray(0 , len-1);
        sleep(1000).then(()=> {
           step++;
         });
        break;
      case 2:
        reverseArray(0 , k-1);
        sleep(1000).then(()=> {
           step++;
         });
        break;
      case 3:
        reverseArray(k , len-1);
        sleep(1000).then(()=> {
           step++;
         });
        break;
      case 4:
        restart();
      }
    }
}

function sleep(millisecondsDuration) {
  return new Promise((resolve) => {
    setTimeout(resolve, millisecondsDuration);
  });
}

function restart(){
  values = [];
  step = 0;
  Screen = 0;
  for(let i = 0; i < width/62.5; i++){
    values.push(i);
  }
  k = Math.round(random(100));
}
