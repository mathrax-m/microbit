class Bullet_A {
  float dx;
  float dy;

  Bullet_A() {
  }

  void hit(float x, float y) {
    this.dx=x;
    this.dy=y;
  }

  void update() {

    this.dy-=10;
    if (this.dy<-10) {
      this.dy=-10;
    }
    rectMode(CENTER);
    noStroke();
    fill(100, 255, 255);
    rect(this.dx, this.dy, 4, 20);
  }
}
