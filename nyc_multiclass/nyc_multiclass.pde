long time;
PImage img;
Table table;
float[][] coords;
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
   camera = new PeasyCam(this, 500, 500, 50, 100);
   img = loadImage("map.png");
   
   table = loadTable("tbldraw.csv");
   coords = new float[10000][6]; // MAX: 82871
   
   // loads coords array from table
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
   
   // normalizes data to fit within 1000x1000 flatspace
   for (int j = 0; j < 10000; j++) {
      coords[j][0] = map(coords[j][0], 25.95, 26.06, 0, 1000); 
      coords[j][1] = 1000 - map(coords[j][1], 40.68, 40.78, 0, 1000); // reverse-y
      coords[j][2] = map(coords[j][2], 25.95, 26.06, 0, 1000); 
      coords[j][3] = 1000 - map(coords[j][3], 40.68, 40.78, 0, 1000); // reverse-y
   }
   
   entrysys = new EntrySystem(coords);
   smooth();
}

void draw() {
   // bgcolor
   background(0);
   
   // plots reference box
   /*
   noFill();
   stroke(255);
   box(200); */
   
   // plots map
   tint(100);
   image(img,0,0,width,height);
   
   // curve path for each Entry object if time condition is satisfied
   entrysys.animate(float(count));
   
   /*
   time = millis();
   while(millis() - time < 1) {} */
   
   // visible timer
   textSize(100);
   text("10" + "-" + (count/86400 + 1)%31 + "-" + "2014 " + (count/3600)%24 + ":" + (count/60)%60 + ":" + count%60,0,0,0);
   count += 3;
   println(count);
}