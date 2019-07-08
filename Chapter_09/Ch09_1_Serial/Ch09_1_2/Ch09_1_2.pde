//Ch09_1_2
//  micro:bit+Processing
//  -- micro:bit加速度XYZ+ボタンAB --

PImage mb;

void setup() {
  //画面サイズを800x600にする
  size(800, 600);

  //microbitマークの画像を読み込み
  mb = loadImage("microbit.png");

  //シリアルポートを探す
  searchSerialPort();
}


//micro:bitのデータを使ったプログラム
void drawMain() {

  //microbitDataを、0.0〜1.0に整える  
  float x = map(microbitData[0], -1024, 1023, 0, 1);
  float y = map(microbitData[1], -1024, 1023, 0, 1);
  float z = map(microbitData[2], -1024, 1023, 0, 1);
  float a = microbitData[3];   //ボタンA
  float b = microbitData[4];   //ボタンB

  // ボタンAが押されたら、黒い背景色で残像効果を出す
  if (a==1) {
    noStroke();              //線はナシ
    fill(0, 0, 0, 5);        //塗り色を黒（赤:0,緑:0,青:0,透明度:5）に
    rect(0, 0, 800, 600);    //四角を画面全体に描く
  }
  // ボタンBが押されたら、白い背景色で残像効果を出す
  if (b==1) {
    noStroke();              //線はナシ
    fill(255, 255, 255, 5);  //塗り色を白（赤:255,緑:255,青:255,透明度*5）に
    rect(0, 0, 800, 600);    //四角を画面全体に描く
  }

  pushMatrix();                //座標を変換
  translate(x*800, y*600);     //xで0〜800、yで0〜600に移動
  rotate(radians(z*360));      //zで0〜360°回転
  scale(1.0+z*4.0);            //zで1.0〜5.0倍
  //塗りの色をランダムに変える
  tint(random(255), random(255), random(255), 100);
  imageMode(CENTER);           //画像の原点を中心にする
  image(mb, 0, 0);             //画像を描画する
  popMatrix();                 //座標の変換おわり
  
}

void keyPressed() {
  saveFrame("###.png");
}
