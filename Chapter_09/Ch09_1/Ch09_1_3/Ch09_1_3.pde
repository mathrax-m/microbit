//Ch09_1_3
//  micro:bit+Processing
//  -- micro:bit加速度XYZ+ボタンAB --
//  -- 平均して滑らかにする --

float ave_x;  //浮動小数型の変数「ave_x」を用意する
float ave_y;  //浮動小数型の変数「ave_y」を用意する
float ave_z;  //浮動小数型の変数「ave_z」を用意する
 
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
  float x = map(microbitData[0], -1024, 1023, 0, 1);  //加速度Xの情報を0.0〜1.0整える
  float y = map(microbitData[1], -1024, 1023, 0, 1);  //加速度Yの情報を0.0〜1.0整える
  float z = map(microbitData[2], -1024, 1023, 0, 1);  //加速度Zの情報を0.0〜1.0整える

  ave_x = ave_x*(9.0/10.0)+x*(1.0/10.0);
  ave_y = ave_y*(9.0/10.0)+y*(1.0/10.0);
  ave_z = ave_z*(9.0/10.0)+z*(1.0/10.0);

  pushMatrix();                    //座標を変換
  translate(ave_x*800, ave_y*600); //ave_xで0〜800、ave_yで0〜600に移動
  rotate(radians(ave_z*360));      //ave_zで0〜360°回転
  scale(1.0+ave_z*4.0);            //ave_zで1.0〜5.0倍

  //塗りの色をランダムに変える
  tint(random(255), random(255), random(255), 100);
  imageMode(CENTER);          //画像の原点を中心にする
  image(mb, 0, 0);              //画像を描画する

  popMatrix();                //座標の変換おわり
}
