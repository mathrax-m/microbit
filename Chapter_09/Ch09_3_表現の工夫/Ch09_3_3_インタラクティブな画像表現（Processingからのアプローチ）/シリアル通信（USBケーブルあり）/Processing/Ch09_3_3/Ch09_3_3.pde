//Ch09-3-3
//  表現の工夫
//  -- インタラクティブなグラフィック表現 --

float[] b=new float[5];      //浮動小数型の配列「b」
int x;                       //センサの値をいれる変数「x」
int last_x;                  //直前の「x」を覚えておく変数「last_x」

void setup() {               //最初だけ-------------------------------------------//
  size(800, 600);            //画面サイズを800*600ドットに
  searchSerialPort();        //シリアルポートを探す
  oscOpen();                 //OSC通信を始める
}

void drawMain() {            //ずっと----------------------------------------------------//
  background(255);           //背景を白色に塗る
  
  for (int i=0; i<5; i++) {  //変数「i」をカウントしながら5回ループする
    noStroke();                     //線ナシ
    fill(255, 50*i, 100, 255*b[i]); //塗り色（赤:255,緑:50,青:100,透明度:255*b[i]）
    rect(160*i, 0, 160, 600*b[i]);  //x:300,y:0に、幅:200,高さ600*b[i]で四角を描く
    b[i] *= 0.99;                   //配列「b[i]」を0.99倍する
  }
  
  x = microbitData[0];       //変数xにデータを格納する
  
  if (x<5 && x!=last_x) {    //xが5より小さく、xがlast_xと異なるとき
    b[x]=1.0;                //配列bのx番目を1.0にする
    
    //OSCメッセージを作成する
    OscMessage myMessage = new OscMessage("/fromP5");
    //OSCメッセージにセンサデータを追加する
    myMessage.add(microbitData[0]);
    //OSCメッセージを送る  
    oscP5.send(myMessage, myRemoteLocation);  
    
    last_x = x;              //last_x（直前の値）として、現在のxを入れる
  }
  
  fill(100);                          //塗り色をグレーにする
  text(x, width/2, height-height/8);  //変数xの値を画面にテキストで表示（確認用）
}
