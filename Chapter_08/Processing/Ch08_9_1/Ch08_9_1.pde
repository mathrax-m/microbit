//Ch08-9-1
//  micro:bit+Processing
//  -- シューティングゲーム風の画面 --

PImage ship;
PImage ship_l;
PImage ship_r;
PImage my_ship;

float x;
float y;
float z;
float a;
float b;

float ave_x;
float ave_y;
float ave_z;

int a_state;
int b_state;

int count;
Bullet_A[] bull_a = new Bullet_A[100];
Bullet_B[] bull_b = new Bullet_B[100];
int bull_a_count;
int bull_b_count;
float bull_x;
float bull_y;

Stardust[] star = new Stardust[100];

void setup() {
  size(800, 600);
  //fullScreen();
  searchSerialPort();
  ship = loadImage("ship.png");
  ship_l = loadImage("ship_left.png");
  ship_r = loadImage("ship_right.png");
  for (int i=0; i<100; i++) {
    bull_a[i] = new Bullet_A();
    bull_b[i] = new Bullet_B();
  }
  for (int i=0; i<100; i++) {
    star[i]=new Stardust();
  }
  my_ship = ship;
  x=width/2;
  y=height/2;
  noSmooth();
}

void drawMain() {
  background(0);
  count++;
  if (count>15) {
    count=15;
    my_ship=ship;
  }

  for (int i=0; i<100; i++) {
    bull_a[i].update();
    bull_b[i].update();
  }

  for (int i=0; i<100; i++) {
    star[i].update();
  }
  x =map(microbitData[0], -1024, 1023, 0, 1);
  y =map(microbitData[1], -1024, 1023, 0, 1);
  z =map(microbitData[2], -1024, 1023, 0, 1);
  a =map(microbitData[3], 0, 1, 0, 1);
  b =map(microbitData[4], 0, 1, 0, 1);

  ave_x = ave_x*(49.0/50.0)+x*(1.0/50.0);
  ave_y = ave_y*(49.0/50.0)+y*(1.0/50.0);
  if (0<=ave_x && ave_x<0.45) {
    count=0;
    my_ship = ship_r;
  } else if (0.65<=ave_x && ave_x<1.0) {
    count=0;
    my_ship = ship_l;
  }
  if (a==1) {
    if (a_state==0) {
      a_state=1;
      bull_x=ave_x*width;
      bull_a_count++;
      bull_a[bull_a_count%100].hit(bull_x, ave_y*height);
    }
  } else {
    a_state=0;
  }
  if (b==1) {
    bull_b_count++;
    bull_b[bull_b_count%100].hit(ave_x*width, ave_y*height);
  }
  imageMode(CENTER);
  image(my_ship, ave_x*width, ave_y*height, 64, 64);
}
