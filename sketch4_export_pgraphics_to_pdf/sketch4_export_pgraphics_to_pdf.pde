import java.nio.file.Paths;
import processing.pdf.*;

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
    String outputPath = Paths.get(sketchPath("outputs"), "output_" + System.currentTimeMillis()).toString();
    PGraphics outputCanvas = createGraphics(convertMmToPx(200), convertMmToPx(200), PDF, outputPath + ".pdf");
    outputCanvas.beginDraw();
    outputCanvas.background(200);
    outputCanvas.scale(outputCanvas.height / (float) height);
    for (int i = 0; i < meteors.length; i++) {
      meteors[i].display(outputCanvas);
    }
    outputCanvas.dispose();
    outputCanvas.endDraw();
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

int convertMmToPx(float mm) {
  return round(mm / 0.3527778);
}
