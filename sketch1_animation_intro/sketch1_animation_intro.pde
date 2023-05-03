Meteor[] meteors = new Meteor[10];

void setup() {
  size(600, 600);
  frameRate(30);
  smooth(8);
  resetMeteors();
}

void draw() {
  background(200);
  for (int i = 0; i < meteors.length; i++) {
    meteors[i].updateSize();
    meteors[i].display();
  }
  
  fill(50);
  textSize(16);
  text(frameCount + " / " + round(frameRate), 10, 20);
}

void keyReleased() {
  resetMeteors();
}

void resetMeteors() {
  for (int i = 0; i < meteors.length; i++) {
    meteors[i] = new Meteor();
  }
}
