class Path {
    ArrayList<PVector> points = new ArrayList<PVector>();
    PVector begin;
    PVector end;
    float duration;
    float elapsed;
    float distance;
    int enumerate = 1;
    
    Path(float x0, float y0, float xf, float yf, float duration, float elapsed) {
        this.begin = new PVector(x0, y0, 0);
        this.end = new PVector(xf, yf, 0);
        this.duration = duration;
        this.elapsed = elapsed;
        distance = sqrt(pow(end.y-begin.y,2)+pow(end.x-begin.x,2));
        
        // saves curve path to ArrayList<PVector> points
        for(int i = 0; i <= this.duration; i++) {
            float t = i / this.duration;
            float x = curvePoint(begin.x, begin.x, end.x, end.x, t);
            float y = curvePoint(begin.y, begin.y, end.y, end.y, t);
            float z = curvePoint(-pow(distance,1.25), 0, 0, -pow(distance,1.25), t); // height of curve based on distance
            points.add(new PVector(x, y, z));
        }
    }
    
    // curve path up to enumerate is plotted at each draw() iteration, enumerate++
    boolean upToNext() {
        noFill();
        beginShape();
        for(int i = 0; i < enumerate; i++) {
            stroke(0,255,255);
            //strokeWeight(2);
            point(points.get(i).x, points.get(i).y, points.get(i).z);
        }
        endShape();
        
        pushMatrix();
        translate(begin.x, begin.y);
        stroke(255,0,127);
        sphere(4);
        popMatrix();
        
        if(enumerate <= duration) {enumerate++; return true;}
        else return false;
    }
}