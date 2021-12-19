int MARGIN;
int CITY_SIZE; 

ArrayList<Road> roads;

void setup(){
  MARGIN = 64;
  CITY_SIZE = 600;
  
  roads = new ArrayList<Road>();
  
  size(856, 856);
  
   
  for (int i = 0; i < ceil(random(1, 5)); i++) {
    roads.add(new Road(5, new PVector(random(width/2, width/2), random(width/2, width/2)), random(TWO_PI)));
  }
  
  background(20);
  stroke(230);
}

void draw(){
  for(int i = 0; i < roads.size(); i++){
     roads.get(i).show();
     roads.get(i).update();
  }
  println(roads.get(0).angle, ",  "+ roads.get(0).level);
}

void mousePressed(){
   save("lines_3.png"); 
  
}
