import java.nio.file.Paths;

Meteor[] meteors = new Meteor[50];

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
    meteors[i].display(getGraphics());
  }
  
  fill(50);
  textSize(16);
  text(frameCount + " / " + round(frameRate), 10, 20);
}

void keyReleased() {
  if (key == 'e') {
    PGraphics outputCanvas = createGraphics(5000, 5000);
    outputCanvas.beginDraw();
    outputCanvas.background(200); // comment this line to save a PNG image with transparent background
    outputCanvas.scale(outputCanvas.height / (float) height);
    for (int i = 0; i < meteors.length; i++) {
      meteors[i].display(outputCanvas);
    }
    outputCanvas.endDraw();
    String outputPath = Paths.get(sketchPath("outputs"), "output_" + System.currentTimeMillis()).toString();
    outputCanvas.save(outputPath + ".png");
    println("Frame " + frameCount + " saved to: " + outputPath);
  } else {
    resetMeteors();
  }
}

void resetMeteors() {
  for (int i = 0; i < meteors.length; i++) {
    meteors[i] = new Meteor();
  }
}
