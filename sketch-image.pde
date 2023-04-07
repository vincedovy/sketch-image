String selectedFilePath = "";
PImage img;
Boolean imgSelected = false;

// This code uses Processing's built-in selectInput() method to open a file selection dialog.
// The initialDir variable is set to the ~/images/ directory by using the System.getProperty("user.home")
// method to get the current user's home directory and appending /images/ to it.
void setup() {
  size(1600, 1200);
  File initialDir = new File(System.getProperty("user.home") + "/Pictures/watercolors/*.jpg");
  selectInput("Select a file to open:", "fileSelected", initialDir);
}

// When the user selects a file, the fileSelected() method is called and the selected file path is
// stored in the selectedFilePath variable. The openFile() method is then called with the selected
// file path as an argument to implement your code to open the file.
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    selectedFilePath = selection.getAbsolutePath();
    println("Selected file: " + selectedFilePath);
    openFile(selectedFilePath);
  }
}

void openFile(String filePath) {
  img = loadImage(filePath);
  println("width: "+img.width+", height: "+img.height);
  img.resize(1600, 1200);
  imgSelected = true;
}

void drawGrid(int spacing) {
  stroke(0, 0, 0);
  strokeWeight(1);
  for (int x = 0; x <= width; x += spacing) {
    line(x, 0, x, height);
  }
  for (int y = 0; y <= height; y += spacing) {
    line(0, y, width, y);
  }
}

void draw() {
  if (imgSelected) {
    image(img, 0, 0);
    filter(GRAY);
    filter(BLUR,2.0);
    img.filter(POSTERIZE, 5);
    drawGrid(200);
  }
}
