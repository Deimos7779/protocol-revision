 ArrayList<Protocol> protocols;
float elementHeight = 25;
Scrollbar sb;
float scroll;
float range;

float detailWidth;
float listWidth;

PVector mouse;

Protocol selectedProtocol;

enum ProtocolType {
  COMMUNCATION,
    SECURITY,
    MANAGEMENT
}

enum OSILayer {
  PHYSICAL,
    DATALINK,
    NETWORK,
    TRANSPORT,
    SESSION,
    PRESENTATION,
    APPLICATION
}

void setup() {
  detailWidth = 480;
  size(600, 720);
  listWidth = width - detailWidth;
  sb = new Scrollbar(20);
  
  mouse = new PVector(mouseX, mouseY);

  protocols = new ArrayList<Protocol>();
  protocols.add(new Protocol("HyperText Transfer Prrotocol", "HTTP", 80, "foundational protocol used for data transfer on the world wide web", OSILayer.APPLICATION));
  protocols.add(new Protocol("File Transfer Protocol", "FTP", 21, "standard communication protocol used for transferring files between client and server on a computer network", OSILayer.APPLICATION));
  protocols.add(new Protocol("Simple Mail Transfer Protocol", "SMTP", 25, "foundational protocol used for sending emails across the internet", OSILayer.APPLICATION));
  
}

void draw() {
  background(51);
  
  mouse = new PVector(mouseX, mouseY);
  mouse.add(0, sb.effectiveZone);
  println(mouse.y);

  //update the scrollbar
  sb.Update();
  
  //move the list according to the scrollbar
  pushMatrix();
  translate(0, -sb.effectiveZone);
  display();
  popMatrix();

  for (int i = 0; i < protocols.size()-1; i++) {
    //display the selected protocol
    if (protocols.get(i) == selectedProtocol) {
      protocols.get(i).Display();
    }
  }

  //debugMousePosition();

  range = protocols.size() * elementHeight;
  scroll = lerp(scroll, 0, .5f);
  
  //display the scrollbar
  sb.Display();
}

public void display() {
  for (int i = 0; i < protocols.size(); i++) {

    //display the list of protocols
    float y = i*elementHeight;
    stroke(216, 255, 255);
    color fillColor = checkProtocolSelected(i) ? 155 : 200;
    fill(fillColor);
    rect(0, y, listWidth-1, elementHeight);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(10);
    text(protocols.get(i).acronym, listWidth/2, y + elementHeight/2);
  }
}

boolean checkProtocolSelected(int p) {
  float leftBound = 0;
  float rightBound = listWidth;
  float topBound = p * elementHeight;
  float bottomBound = topBound + elementHeight;
  boolean selected = mouse.x > leftBound && mouse.x < rightBound && mouse.y > topBound && mouse.y < bottomBound;
  if (mousePressed && selected) {
    protocols.get(p).expanded = true;
    selectedProtocol = protocols.get(p);
  }
  return selected;
}

void textBox(String text, float x, float y, float w, float h, float b) {
  float nx = x-b;
  float ny = y-b;
  float nw = w+b;
  float nh = h+b;
  push();
  fill(201);
  strokeWeight(3);
  stroke(0);
  rect(nx, ny, nw, nh);
  textAlign(LEFT, TOP);
  fill(0);
  text(text, x, y, w, h);
  pop();
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  scroll += e;
}

void debugMousePosition() {
  fill(0);
  textSize(15);
  text((mouseX + ", " +mouseY), mouseX, mouseY);
}
