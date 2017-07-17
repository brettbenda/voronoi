Point point1 = new Point(500, 500);
Button button = new Button(100,50,150,50,"Add Point");
ArrayList<Point> points = new ArrayList();
ArrayList<Integer> colors = new ArrayList<Integer>();

void setup() {
  size(1600, 900); 
  points.add(point1);
  for (int i = 0; i<points.size(); i++) {
    colors.add((int)random(#000000, #FFFFFF));
  }
}

void draw() {
  background(255);
  if(button.isClicked()){
   points.add(new Point(500,500));
   colors.add((int)random(#000000,#FFFFFF));
  }
  
  drawVoronoi2();
  button.show();
  showPoints();
}

void keyPressed(){
 if(key=='p'){
  save("voronoi.jpg"); 
 }
}

void drawVoronoi2() {
  int best = 0;
  float closest = 10000;
  loadPixels();
  for (int x = 0; x<width; x++) {
    for (int y = 0; y<height; y++) {
      for (int k = 0; k<points.size(); k++) {
        
        //Manhattan
        if(abs((x-points.get(k).getX()))+abs((y-points.get(k).getY()))<closest){
          best = k;
          closest = abs((x-points.get(k).getX()))+abs((y-points.get(k).getY()));
        }
        
        /*
        //Euclidean
        if (dist(x, y, points.get(k).getX(), points.get(k).getY())<closest) {
          best = k;
          closest = dist(x, y, points.get(k).getX(), points.get(k).getY());
        }
        */
        
      }
      pixels[x+y*width] = colors.get(best);
      best = 0;
      closest = 10000;
    }  
  }
  updatePixels();
}

void drawVoronoi(int n) {
  float dx = (float)width/n;
  float dy = (float)height/n;
  float x = 0;
  float y = 0;
  int best = 0;
  float closest = 10000;

  for (int i = 0; i<n+1; i++) {
    for (int j = 0; j<n+1; j++) {
      for (int k = 0; k<points.size(); k++) {
        
        /*
        //Manhattan
        if(abs((x-points.get(k).getX()))+abs((y-points.get(k).getY()))<closest){
          best = k;
          closest = abs((x-points.get(k).getX()))+abs((y-points.get(k).getY()));
        }
        */
        
        //Euclidean
        if (dist(x, y, points.get(k).getX(), points.get(k).getY())<closest) {
          best = k;
          closest = dist(x, y, points.get(k).getX(), points.get(k).getY());
        }
        
      }
      fill(colors.get(best),155);
      noStroke();
      rect(x, y, dx, dy);
      x+=dx;
      best = 0;
      closest = 10000;
    }  
    y+=dy;
    x=0;
  }
}

void showPoints(){
 for(int i = 0; i<points.size(); i++){
  points.get(i).show(); 
 }
}