import java.nio.file.Paths;

Meteor[] meteors = new Meteor[50];
boolean exporting = false;
String outputFolder;

void setup() {
  size(600, 600);
  frameRate(30);
  smooth(8);
  resetMeteors();
  setOutputFolder();
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
  
  if (exporting) {
    PGraphics outputCanvas = createGraphics(1080, 1080);
    outputCanvas.beginDraw();
    outputCanvas.background(200); // comment this line to save a PNG image with transparent background
    outputCanvas.scale(outputCanvas.height / (float) height);
    for (int i = 0; i < meteors.length; i++) {
      meteors[i].display(outputCanvas);
    }
    outputCanvas.endDraw();
    String outputPath = Paths.get(outputFolder, "frame_" + nf(frameCount, 8)).toString();
    outputCanvas.save(outputPath + ".png");
    println("Frame " + frameCount + " saved to: " + outputPath);
    
    noStroke();
    fill(255, 0, 0);
    circle(width - 20, 20, 20);
  }
}

void keyReleased() {
  if (key == 'e') {
    exporting = !exporting;
    if (exporting) {
      setOutputFolder();
    }
  } else {
    resetMeteors();
  }
}

void resetMeteors() {
  for (int i = 0; i < meteors.length; i++) {
    meteors[i] = new Meteor();
  }
}

void setOutputFolder() {
  outputFolder = Paths.get(sketchPath("outputs"), "sequence_" + System.currentTimeMillis()).toString();
}
