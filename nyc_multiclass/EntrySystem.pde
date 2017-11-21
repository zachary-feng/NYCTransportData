class EntrySystem {
    ArrayList<Entry> entries = new ArrayList<Entry>();
    
    EntrySystem(float coords[][]) {
        for(int i = 0; i < coords.length; i++) {
            entries.add(new Entry(coords[i][0],coords[i][1],coords[i][2],coords[i][3],coords[i][4],coords[i][5]));
        }
    }
    
    void animate(float seconds) {
        for(Entry e : entries) {
            if(seconds >= e.elapsed /*&& seconds <= e.elapsed + e.duration*/) {
                e.upToNext();
            } /*else if(seconds >= e.elapsed + e.duration) {
                e = null;
            } */
        }
    }
}