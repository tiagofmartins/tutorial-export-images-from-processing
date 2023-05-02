import java.nio.file.Paths;

Meteor[] meteors = new Meteor[50];
boolean export = false;

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
  
  if (export) {
    String outputPath = Paths.get(sketchPath("outputs"), "output_" + System.currentTimeMillis()).toString();
    save(outputPath + ".png");
    println("Frame " + frameCount + " saved to: " + outputPath);
    export = false;
  }
  
  fill(50);
  textSize(16);
  text(frameCount + " / " + round(frameRate), 10, 20);
}

void keyReleased() {
  if (key == 'e') {
    export = true;
  } else {
    resetMeteors();
  }
}

void resetMeteors() {
  for (int i = 0; i < meteors.length; i++) {
    meteors[i] = new Meteor();
  }
}
