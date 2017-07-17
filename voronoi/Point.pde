class Point {
  float x, y;
  boolean isMoving = false;

  Point() {
  }

  Point(float x, float y) {
    setX(x);
    setY(y);
  }

  void setX(float x) { 
    this.x = x;
  }

  void setY(float y) { 
    this.y = y;
  }

  float getX() { 
    return this.x;
  }

  float getY() { 
    return this.y;
  }

  void show() {
    strokeWeight(5);
    stroke(0);
    fill(255);
    ellipse(x, y, 20, 20);
    if(isClicked()){
      isMoving = true;
    }
    if(!mousePressed){
     isMoving = false; 
    }
    if(isMoving){
     updatePosition(); 
    }
  }


  boolean isOver() {
    if (dist(mouseX, mouseY,x,y)<10){
     return true; 
    }
    return false;
  }
  
  boolean isClicked(){
   if(isOver() && mousePressed){
     return true;
   }
   return false;
  }
  
  void updatePosition(){
   x = mouseX;
   y = mouseY;
  }
}