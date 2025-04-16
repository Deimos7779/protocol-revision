class Scrollbar {
  float barWidth;
  float sliderPos;
  float sliderSize;
  boolean hovered;
  boolean pressed;
  float effectiveZone;


  Scrollbar(float bw) {
    this.barWidth = bw;
    this.sliderPos =  0;
    this.sliderSize = 25;
    this.pressed = false;
    this.hovered = false;
  }

  public void Update() {
    if (mouseX > width-barWidth && mouseX < width)
    {
      hovered = true;
      if (mousePressed) {
        pressed = true;
      } else {
        pressed = false;
      }
    } else {
      hovered = false;
      pressed = false;
    }

    if (pressed) {
      sliderPos = mouseY - sliderSize/2;
    }

    sliderPos = constrain(sliderPos, 0, height-sliderSize);
    if (sliderPos >= 0 && sliderPos <= height - sliderSize) {
      sliderPos += scroll;
    }
    
    effectiveZone = map(sliderPos, 0, height, 0, range);
  }

  public void Display() {
    noStroke();
    color c1 = hovered ? 210 : 255;
    fill(c1);
    rect(width-barWidth, 0, barWidth, height);
    stroke(25);
    color c2 = hovered ? 100 : 127;
    fill(c2);
    rect(width-barWidth, sliderPos, barWidth, sliderSize);
  }
}
