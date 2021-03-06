//Ch09-3-3
//  表現の工夫
//  -- スペースキーでインタラクティブなグラフィック --

float b;            //浮動小数型の変数「b」

void setup() {      //最初だけ
  size(800, 600);   //画面サイズを800*600ドットに
}

void draw() {       //ずっと
  background(255);  //背景を白色に塗る
  noStroke();       //線ナシ
  fill(255, 50, 100, 255*b);  //塗り色（赤:255,緑:50,青:100,透明度:255*b）
  rect(300, 0, 200, 600*b);   //x:300,y:0の位置に、幅:200,高さ600*bで四角を描く

  b *= 0.99;        //変数「b」を0.99倍する
}

void keyPressed() { //キーボードを押されたとき
  if (key==' ') {   //スペースキーだったら
    b = 1.0;        //bを1.0にする
  }
}
