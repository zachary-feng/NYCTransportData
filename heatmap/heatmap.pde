
import peasy.*;
PeasyCam cam;
PFont f;
Table table;
int[][] arr = new int[353315][3];
int[][] map = new int[500][500];
int window_length = 100;
int speed = 1;
int red;
int green;
int blue = 200;
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
  table = loadTable("histo_base.csv");
  println(table.getRowCount());
  int i = 0;
  for (TableRow row : table.rows()){
    for (int j = 0; j < 500; j++){
      map[i][j] = row.getInt(j);
    }
    i++;
  }
  f = createFont("Arial",1000,true);
}
void setColors(int value, int scale){
  if (value*scale > 255){
    red = 255;
    green = value*scale - 255;
    if (green > 255) green = 255;
  }
  else {
    red = value*scale;
    green = 0;
  }
}
void draw() {
  background(0);
  strokeWeight(1.25);
  translate(width/8, 3*height/4, -100);
  for (int i = 0; i < 500; i++){
    for (int j =0; j < 500; j++){
        if (map[i][j] > 0){
         //stroke(getRed(map[i][j],50), 0, 255);
         setColors(map[i][j], 20);
         stroke(red, green,blue);
         //point(i,0,j);
        line(i,0,j,i, - 4, j);
        }
    }
  }
  noFill();
  box(200);
  inc++;
}