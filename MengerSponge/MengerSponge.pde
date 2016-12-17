int d = 40;
float xo;
float yo;
float zo;
float zoom = 1;
float a = 0;
ArrayList<Box> sponge;
boolean boxShow = true;
void setup() {
  size(650, 650, OPENGL);
  xo = width/2;
  yo = width/2;
  zo = width/2;
  smooth();
  noStroke();
  frameRate(350);
  // An array of Box objects
  sponge = new ArrayList<Box>();

  // Start with one
  Box b = new Box(0, 0, 0, 200);
  sponge.add(b);
}
void mousePressed() {
  if (boxShow == true) {
  // Generate the next set of boxes
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : sponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
}
}

void draw() {
  background(55);
  stroke(255);
  noFill();
  lights();
  translate(width/2, height/2);
  scale (zoom);
  for (Box b : sponge) {
    b.show();
  }
  a += 0.01;
  surface.setTitle(int(frameRate) + " fps");
}
void keyPressed() {
  if (key == 'w' || key == 'W') {
    // Zoom In
      zoom += 1;
    }
    else   if (key == 's' || key == 'S') {
      // Zoom Back
      zoom -= 1;
    }
    else if(key == 'h' || key == 'H') {
      // Stop Controls
      boxShow = !boxShow;
    }
    else if(key == 'u' || key == 'U') {
      // Enable Controls
      boxShow = true;
    }
    else if(key == 'c' || key == 'C') {
      
    }
  if (key == 32) 
  {
    zoom = 1;
    xo = width/2;
    yo = height/2;
    zo = width/2;
  }
}
void keyReleased() {
  if (key == 'w' || key == 'W') {
    // Zoom In
      zoom += 1;
    }
    else   if (key == 's' || key == 'S') {
      // Zoom Out
      zoom -= 1;
    }
  if (key == 32) 
  {
    zoom = 1;
    xo = width/2;
    yo = height/2;
    zo = width/2;
  }
}