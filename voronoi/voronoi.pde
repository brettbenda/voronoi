/*
  Written by Brett Benda in 2017
  
  To switch distance methonds, place either
  
  drawEuclidean();
  --or--
  drawManhattan();
  
  in the designated spot in the draw() function
  
*/
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
  //PUT DESIRED FUNCTION TYPE UNDER HERE
  drawEuclidean();
  //PUT DESIRED FUNCTION TYPE ABOVE HERE
  button.show();
  showPoints();
}

void keyPressed(){
 if(key=='p'){
  save("voronoi.jpg"); 
 }
}void drawEuclidean() {
  int best = 0;
  float closest = 10000;
  loadPixels();
  for (int x = 0; x<width; x++) {
    for (int y = 0; y<height; y++) {
      for (int k = 0; k<points.size(); k++) {     
        //Euclidean
        if (dist(x, y, points.get(k).getX(), points.get(k).getY())<closest) {
          best = k;
          closest = dist(x, y, points.get(k).getX(), points.get(k).getY());
        }     
      }
      pixels[x+y*width] = colors.get(best);
      best = 0;
      closest = 10000;
    }  
  }
  updatePixels();
}

void drawManhattan() {
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
      }
      pixels[x+y*width] = colors.get(best);
      best = 0;
      closest = 10000;
    }  
  }
  updatePixels();
}

void showPoints(){
 for(int i = 0; i<points.size(); i++){
  points.get(i).show(); 
 }
}