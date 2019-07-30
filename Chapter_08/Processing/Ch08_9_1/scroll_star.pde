class Stardust {

  float x;
  float y;
  float dy;
  float s;
  int count;

  Stardust() {
    this.x = random(width);
    this.y = random(height);
    this.dy = random(20);
    this.s=random(10)+1;
  }

  void update() {
    this.y+=this.dy;
    if (this.y>height+this.dy) {
      this.x = random(width);
      this.dy = random(10)+1;
      this.y = -this.dy;
      this.s=random(5)+1;
    }
    
    fill(255, 255, 255, 200);
    ellipse(this.x, this.y, this.s, this.s);
  }
}
