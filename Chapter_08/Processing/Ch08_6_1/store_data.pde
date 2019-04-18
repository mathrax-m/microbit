//microbitからのデータを格納する
int[] microbitData = new int[2];

//送られてきたデータをチェックし、microbitDataに格納する
void storeData(int[] buff) {
  //bufferのデータが2個揃ったなら、
  if (buff.length>=2) {
    //microbitDataに格納する
    microbitData[0] = buff[0];
    microbitData[1] = buff[1];
    
  }
}
