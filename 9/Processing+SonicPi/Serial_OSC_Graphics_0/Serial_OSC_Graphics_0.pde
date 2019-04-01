float[] b=new float[5];

int x;
int y;
int z;


//最初の1度だけ実行する--------------------------------//
void setup() {
  size(500, 500);
  //シリアルポートを探す
  searchSerialPort();
  //OSC通信を始める
  oscOpen();
}

//1秒に60回実行する-----------------------------------//
void drawMain() {
  background(255, 255, 255);

  for (int i=0; i<5; i++) {
    noStroke();
    fill(255, 50*i, 100, 255*b[i]);
    rect(100*i, 0, 100, 500*b[i]);

    b[i] *= 0.99;
  }

  //シリアル通信で受け取ったデータがXYZ揃ったなら
  if (microbitData.length>3) {
    //変数x、y、zにデータを格納する
    x = microbitData[0];
    y = microbitData[1];
    z = microbitData[2];

    //zが50より小さいとき
    if (z<50) {
      //配列bのx番目を1.0にする
      b[x]=1.0;
    }
  }
  
  //OSCメッセージを作成する
  OscMessage myMessage = new OscMessage("/note");
  //シリアル受信データの個数分だけ繰り返す
  for (int i=0; i<microbitData.length-1; i++) {
    //OSCメッセージにシリアル受信データを追加する
    myMessage.add(microbitData[i]);
  }
  //OSCメッセージを送る
  oscP5.send(myMessage, myRemoteLocation);
}

//キーボードを押した時実行する -------------------------//
void keyPressed() {
  if (key=='z') {
    b[0]=1.0;
  }  
  if (key=='x') {
    b[1]=1.0;
  }  
  if (key=='c') {
    b[2]=1.0;
  }  
  if (key=='v') {
    b[3]=1.0;
  }  
  if (key=='b') {
    b[4]=1.0;
  }
}
