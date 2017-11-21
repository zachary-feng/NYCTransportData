class Entry {
    ArrayList<PVector> points = new ArrayList<PVector>();
    PVector begin;
    PVector end;
    float duration;
    float elapsed;
    float steps;
    int enumerate = 1;
    
    Entry(float x0, float y0, float xf, float yf, float duration, float elapsed) {
        this.begin = new PVector(x0, y0, 0);
        this.end = new PVector(xf, yf, 0);
        this.duration = duration;
        this.elapsed = elapsed;
        for(int i = 0; i <= duration; i++) {
            float t = i / duration;
            float x = curvePoint(begin.x, begin.x, end.x, end.x, t);
            float y = curvePoint(begin.y, begin.y, end.y, end.y, t);
            float z = curvePoint(-500, 0, 0, -500, t);
            points.add(new PVector(x, y, z));
        }
    }
    
    boolean upToNext() {
        noFill();
        beginShape();
        for(int i = 0; i < enumerate; i++) {
            point(points.get(i).x, points.get(i).y, points.get(i).z);
        }
        endShape();
        if(enumerate <= duration) {enumerate++; return true;}
        else return false;
    }
}