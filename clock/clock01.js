function setup() {
  createCanvas(400, 400);
  angleMode(DEGREES);
}


function draw() {
  background(0);
  translate(200,200);
  let hr = hour();
  let mn = minute();
  let sc = second();
  rotate(-90);
  
  strokeWeight(8);
  stroke(150, 255, 100);
  noFill();
  let secondAngle = map(sc, 0, 60, 0, 360);
  arc(0, 0, 300, 300, 0, secondAngle);
  
  stroke(150, 100, 255);
  noFill();
  let minuteAngle = map(mn, 0, 60, 0, 360);
  arc(0, 0, 280, 280, 0, minuteAngle);
  
  stroke(255, 100, 150);
  noFill();
  let hourAngle = map(hr%12, 0, 12, 0, 360);
  arc(0, 0, 260, 260, 0, hourAngle);
  
  push();
  rotate(hourAngle);
  stroke(255, 100, 150);
  line(0, 0, 60, 0);
  pop();
  
        
  push();
  rotate(secondAngle);
  stroke(150, 255, 100);
  line(0, 0, 120, 0);
  pop();
  
    
  push();
  rotate(minuteAngle);
  stroke(150, 100, 255);
  line(0, 0, 100, 0);
  pop();
  
  
  stroke(255);
  point(0, 0);

}
