class Bullet_B {
  float dx;
  float dy;

  Bullet_B() {
  }

  void hit(float x, float y) {
    this.dx=x;
    this.dy=y;
  }

  void update() {

    this.dy-=20;
    if (this.dy<-20) {
      this.dy=-20;
    }
    rectMode(CENTER);
    noStroke();
    fill(250, 200, 25);
    rect(this.dx-20, this.dy, 4, 20);
    rect(this.dx+20, this.dy, 4, 20);
  }
}
