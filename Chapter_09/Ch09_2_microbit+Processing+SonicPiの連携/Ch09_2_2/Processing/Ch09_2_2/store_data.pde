//microbitからのデータを格納する
int[] microbitData = new int[1];

//送られてきたデータをチェックし、microbitDataに格納する
void storeData(int[] buff) {
  //bufferのデータが1個揃ったなら、
  if (buff.length>=1) {
    //microbitDataに格納する
    microbitData[0] = buff[0];
  }
}
