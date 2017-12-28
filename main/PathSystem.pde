class PathSystem {
    ArrayList<Path> paths = new ArrayList<Path>();
    
    PathSystem(float coords[][]) {
        for(int i = 0; i < coords.length; i++) {
            paths.add(new Path(coords[i][0],coords[i][1],coords[i][2],coords[i][3],coords[i][4],coords[i][5]));
        }
    }
    
    void animate(float seconds) {
        for(Path p : paths) {
            if(seconds >= p.elapsed /*&& seconds <= p.elapsed + p.duration*/) {
                p.upToNext();
            } /*else if(seconds >= p.elapsed + p.duration) {
                p = null;
            } */
        }
    }
}