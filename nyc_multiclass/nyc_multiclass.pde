long time;
PImage img;
import peasy.*;
PeasyCam camera;

/*
float[][] test = {{200, 200, 800, 800, 900, 200}, 
                  {300, 100, 900, 500, 200, 300}}; */
                  
int count = 0;

EntrySystem entrysys;

void setup() {
   size(1000,1000, P3D);
   //frameRate(60);
   camera = new PeasyCam(this, 0, 0, 0, 100);
   img = loadImage("map.png");
   
   Table table = loadTable("tbldraw.csv");
   float[][] coords = new float[10000][6]; // 82871
   
   int i = 0;
   for (TableRow row : table.rows()) {
      coords[i][0] = row.getFloat(0); 
      coords[i][1] = row.getFloat(1); 
      coords[i][2] = row.getFloat(2); 
      coords[i][3] = row.getFloat(3);
      coords[i][4] = row.getFloat(4);
      coords[i][5] = row.getFloat(5);
      if(i < 9999) i++;
      else break;
   }
   
   for (int j = 0; j < 10000; j++) {
      coords[j][0] = map(coords[j][0], 25.95, 26.06, 0, 1000); 
      coords[j][1] = 1000 - map(coords[j][1], 40.68, 40.78, 0, 1000); 
      coords[j][2] = map(coords[j][2], 25.95, 26.06, 0, 1000); 
      coords[j][3] = 1000 - map(coords[j][3], 40.68, 40.78, 0, 1000);
   }
   
   entrysys = new EntrySystem(coords);
   smooth();
}

void draw() {
   background(0);
   stroke(255);
   
   noFill();
   box(200);
   
   tint(100);
   image(img,0,0,width,height);
   
   //strokeWeight(2);
   stroke(204,235,255);
   entrysys.animate(float(count));
   
   /*
   time = millis();
   while(millis() - time < 1) {} */
   
   textSize(100);
   text(count,0,0,0);
   count += 3;
   println(count);
}