boolean serialPortSelect;
int selectSerialPortNum;
boolean debug=false;

float x;
float y;
float z;

float[] bright=new float[5];

//初期設定
void setup() {
  size(800, 600);
  //シリアルポートを探す
  searchSerialPort();
  //OSC通信を始める
  oscOpen();

  textAlign(CENTER, CENTER);
}

//画面の描画
void drawMain() {
  colorMode(RGB);
  background(230, 235, 220, 20);

  for (int i=0; i<5; i++) {
    colorMode(HSB);
    noStroke();
    fill(50*i, 160, 255, 255*bright[i]);
    bright[i]*=0.9;
    rect(160*i, 0, 160, 600*bright[i]);
  }

  OscMessage myMessage = new OscMessage("/note");
  for (int i=0; i<microbitData.length-1; i++) {
    myMessage.add(microbitData[i]);
  }
  oscP5.send(myMessage, myRemoteLocation);
}

void keyPressed() {
  if (key=='z') {
    bright[0]=1.0;
  }  
  if (key=='x') {
    bright[1]=1.0;
  }  
  if (key=='c') {
    bright[2]=1.0;
  }  
  if (key=='v') {
    bright[3]=1.0;
  }  
  if (key=='b') {
    bright[4]=1.0;
  }
}
