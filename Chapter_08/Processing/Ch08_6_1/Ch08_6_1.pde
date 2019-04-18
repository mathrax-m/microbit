//Ch08-6-1
//  micro:bit+Processing
//  -- 無線で受けた２つのデータでグラフを描く --

PImage mb;

int light_x;
int temperature_x;


void setup() {
  //画面サイズを800x600にする
  size(800, 600);

  //microbitマークの画像を読み込み
  mb = loadImage("microbit.png");

  //シリアルポートを探す
  searchSerialPort();
  background(255, 255, 255);
}


//micro:bitのデータを使ったプログラム
void drawMain() {
  for (int i=0; i<10; i++) {
    stroke(200, 200, 200);
    line(i*(width/10), 0, i*(width/10), height);

    stroke(200, 200, 200);
    line(0, i*(height/10), width, i*(height/10));
  }
  
  //microbitDataを、0.0〜1.0に整える  
  float light = map(microbitData[0], 0, 255, 1, 0);        //明るさ
  float temperature = map(microbitData[1], -5, 40, 1, 0);  //温度

  if (microbitData[0]!=-255 || microbitData[1]!=-255) {
    light_x++;
    temperature_x++;
    if (light_x>width || temperature_x>width) {
      light_x=0;
      temperature_x=0;
      background(255, 255, 255, 100);
    }


    noStroke();
    fill(255, 0, 255, 100);
    ellipse(light_x, light*height, 4, 4);

    noStroke();
    fill(0, 200, 255, 100);
    ellipse(temperature_x, temperature*height, 4, 4);
  }

  //データをリセット
  microbitData[0]=-255;
  microbitData[1]=-255;
}
