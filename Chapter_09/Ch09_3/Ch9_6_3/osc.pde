import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

//OSC通信を始める
void oscOpen() {
  //ProcessingのOSC受信ポート（今回はOSC受信しないがこのプログラムでは必要になる）
  oscP5 = new OscP5(this, 50000);
  
  //ProcessingからOSC送信,SonicPiがOSC受信するポート
  //SonicPiの受信ポートは、4559と決まっている
  myRemoteLocation = new NetAddress("localhost", 4559);
}


//以下のコードをSonicPiにコピーする
/*
##ここから
live_loop :microbit do
  use_real_time
  x,y,z = sync "/osc/note"
  
  if(z != nil && z < 50)
    use_octave y
    synth :beep, note: [:Db,:Eb,:Gb,:Ab,:Bb][x],
      attack: 0.1, release: 1.0
  end
  
  sleep 0.25
end
##ここまで 
 */
