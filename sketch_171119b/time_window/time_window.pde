
import peasy.*;
PeasyCam cam;
PFont f;
Table table;
int[][] arr = new int[353315][3];
float[][] map = new float[500][500];
int window_length = 100;
int speed = 1;
int prevb = 0;
int inc = 0;
int increments = 1;
int minute = 0;
int a = 0;
ArrayList<Integer> allmins = new ArrayList<Integer>();
int x,y;

void setup() {
  size(1200,1000,P3D);
  cam = new PeasyCam(this, width/2, 3*height/4, -100, 750);
  table = loadTable("timeseries_min.csv");
  println(table.getRowCount());
  int i = 0;
  for (TableRow row : table.rows()){
    arr[i][1] = row.getInt(0);
    arr[i][2] = row.getInt(1);
    arr[i][0] = row.getInt(2);
    allmins.add(arr[i][0]);
    i++;
  }
  println(arr[0][0]);
  println(arr[0][1]);
  println(arr[38022][0]);
  println(arr[38022][1]);
  f = createFont("Arial",1000,true);
}
int getIndexOfWindow(int minute){
  int start = minute - 60;
  if (start < 0) start = 0;
  int result = -1;
  while(result < 0){
  result = allmins.indexOf(start);
  start++;
  }
  return result;
}
void fillZeros(){
  for (int i = 0; i < 500; i++){
    for (int j = 0; j < 500; j++){
      map[i][j] = 0;
    }
  }
}
int getRed(float value, int scale){
  if (value*scale > 255){
  return 255;
  }
  else {
    return Math.round(value*scale);
  }
}
void draw() {
  background(0);
  if (inc == increments){
    map = new float[500][500];
    if (minute - window_length < 0) {
      int edgestart = minute - window_length + 1439;
      //println(edgestart);
      prevb = -1;
      while (edgestart < 1439 && prevb == -1) {
        prevb = allmins.indexOf(edgestart);
        edgestart++;
      }
      
      int b = prevb;
      if (prevb != -1){
        while(b < 353315){
          x = arr[b][1] -1;
          y = arr[b][2];
          map[x][y] += 1;
          b++;
        }
      }
      b = 0;
      while(arr[b][0] <= minute){
        x = arr[b][1] -1;
        y = arr[b][2];
        map[x][y] += 1;
        b++;
      }
      prevb = 0;
    } else {
      while (arr[prevb][0] < minute - window_length) prevb++;
      int b = prevb;
      while (b < 353315 && arr[b][0] <= minute){
      x = arr[b][1] - 1;
      y = arr[b][2];
      map[x][y] += 1;
      b++;
      }
    }
    minute = (minute + 1 + speed)%1439;
    //a = (b + 1 + speed) %353315;
    inc = 0;
  }
  translate(width/4, 3*height/4, -100);
  int h = minute/60;
  int m = minute % 60;
  String hour = Integer.toString(h);
  String min = Integer.toString(m);
  String str = hour + ":" + min;
  textFont(f,200);
  text(str, 300,0);
  for (int i = 0; i < 500; i++){
    for (int j =0; j < 500; j++){
        if (map[i][j] > 0){
          stroke(getRed(map[i][j],50), 0, 255);
        line(i,2*-map[i][j],j,i, 2*-map[i][j] - 4, j);
        }
    }
  }
  stroke(255);
  noFill();
  box(200);
  inc++;
}