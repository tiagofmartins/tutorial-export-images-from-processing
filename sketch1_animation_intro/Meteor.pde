class Meteor {
  PVector p1; // centre position of circle 1
  PVector p2; // centre position of circle 2
  float d1; // diameter of circle 1
  float d2; // diameter of circle 2
  color c1; // color of circle 1
  color c2; // color of circle 2
  int steps; // number of circles to draw between circles 1 and 2
  float noiseIncrem1; // coordinate of a Perlin noise space to be incremented
  float noiseIncrem2; // coordinate of a second Perlin noise space to be incremented
  
  Meteor() {
    noiseIncrem1 = random(999);
    noiseIncrem2 = random(999);
    updateSize();
    float limit = 150;
    p1 = new PVector(random(limit, width - limit), random(limit, height - limit));
    p2 = new PVector(random(p1.x - d1, p1.x + d1), random(p1.y - d1, p1.y + d1));
    c1 = color(random(255), random(255), random(255));
    c2 = color(random(255), random(255), random(255));
    steps = 50;
  }
  
  void updateSize() {
    noiseIncrem1 += 0.008;
    noiseIncrem2 += 0.008;
    d1 = map(noise(noiseIncrem1), 0, 1, 50, 150);
    d2 = map(noise(noiseIncrem2), 0, 1, 25, 50);
  }
  
  void display() {
    noStroke();
    for (int i = 0; i <= steps + 1; i++) {
      float currProgress = map(i, 0, steps + 1, 0, 1);
      color currColor = lerpColor(c1, c2, currProgress);
      PVector currPos = PVector.lerp(p1, p2, currProgress);
      float currDiam = lerp(d1, d2, currProgress);
      fill(currColor, currProgress * 64);
      circle(currPos.x, currPos.y, currDiam);
    }
  }
}
