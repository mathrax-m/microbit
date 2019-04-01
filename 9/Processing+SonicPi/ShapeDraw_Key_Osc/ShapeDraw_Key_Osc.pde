//課題のプログラム
//図形くりかえし回数につかう
float repeatNum = 2;

//図形の拡大縮小につかう
float s=1.0;

//図形の回転につかう
float angle = 0.0;

color col = color(0, 0, 0, 10);
int transpose;

void setup() {
  size(800, 600);
  //fullScreen();

  //OSCポートをオープン
  oscOpen();
}

void draw() {
  //色をRGBモードにする
  colorMode(RGB);

  //背景を塗りつぶす
  //background(0,0,0);
  fill(col);
  rect(0, 0, width, height);

  //sが0.25になるまで、徐々に減少
  if (s>0.0)  s*=0.99;

  //座標変換はじめ
  pushMatrix();
  //画面中央に原点を移動
  translate(width/2, height/2);

  //図形を拡大縮小させる
  scale(s);

  //図形の回転（角度をangle度に）
  rotate(radians(angle));

  //ここから図形を描く
  //repeatNumの回数くりかえし
  for (int i=0; i<repeatNum; i++) {

    //回転させながら描画
    rotate(radians(i*(360/repeatNum)));
    draw_shape();

    //左右反転させて描画
    scale(-1, 1);
    draw_shape();
  }
  //座標変換おわり
  popMatrix();
}


//キー操作
//キー割り当て
char[] keylist1 = {'z', 'x', 'c', 'v', 'b'};
char[] keylist2 = {'a', 's', 'd', 'f', 'g'};
//図形繰り返し割り当て
int[] repeatlist = {2, 3, 4, 5, 6};
//図形サイズ割り当て
float[] slist = {12, 12, 12, 12, 12};


void keyPressed() {
  for (int i=0; i<keylist1.length; i++) {
    if (key==keylist1[i]) { 
      shapeID=i;
      repeatNum = repeatlist[i];
      s = slist[i];
    }
  }

  //矢印キーで角度をコントロール
  if (keyCode==LEFT) {
    angle+=15;
  }
  if (keyCode==RIGHT) {
    angle-=15;
  }


  //キーでSonicPiへ信号を送る
  for (int i=0; i<keylist1.length; i++) {
    if (key==keylist1[i]) {
      sendOscSonicPi(i+1);  //SonicPiへOSC送信（oscタブ内）
    }
  }


  //キーでSonicPiへ信号を送る(オフ）
  for (int i=0; i<keylist2.length; i++) {
    if (key==keylist2[i]) {
      sendOscSonicPi(100+i+1);  //SonicPiへOSC送信（oscタブ内）
    }
  }

  //スペースキーで背景色を変える
  if (key==' ') {
    col = color(random(255), random(255), random(255), 10);
  }
}

//マウスクリック
void mousePressed() {
  //sを2に（2倍に拡大）
  s = 2.0;
}