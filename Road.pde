class Road{
  int level;
  PVector position;
  float angle;
  boolean building;
  //color c = color(random(255), random(255), random(255));
  
  Road(int l, PVector p, float a){
    level = l;
    position = p.copy();
    angle = a;
    building = true;
  }
  
  void update(){
   
    
    
    if(!building){
      return;  
    }
    
    position.add(cos(angle)*level, sin(angle)*level);
    
    if(red(get(int(position.x+cos(angle)*level), int(position.y+sin(angle)*level))) > 90){
      
      show();
      building = false;
    }
    
    if(position.x > width - MARGIN || position.y > height-MARGIN || position.x< MARGIN ||position.y < MARGIN){
      building = false;
    }
    
    float[] pa1 = {-PI/4, -PI/8, PI/8, PI/4};
    float[] pa2 = {-PI/2, PI/2};
    
    
    if (random(1) > 0.99) {
      this.angle += pa1[int(random(4))];
    }
    if (random(1) > 0.98 && this.level == 5) {
      roads.add(new Road(this.level, this.position, this.angle + pa2[int(random(2))] + random(-0.01,0.01)));
    }
    if (random(1) > 0.7 && this.level == 5) {
      roads.add(new Road(this.level-2, this.position, this.angle + pa2[int(random(2))] + random(-0.01,0.01)));
    }
    if (random(1) > 0.8 && this.level == 3) {
      roads.add(new Road(this.level-2, this.position, this.angle + pa2[int(random(2))]));
    }
    if (random(1) > 0.98 && this.level == 3) {
      roads.add(new Road(this.level, this.position, this.angle + pa2[int(random(2))]));
    }
    if (random(1) > 0.995 && this.level == 1) {
      roads.add(new Road(this.level, this.position, this.angle + pa2[int(random(2))]));
    }
    
    
    
    //println(angle);
  }
  
  void show(){
    if(!building){
      return;
    }
    
    strokeWeight(level*1.5);
    stroke(map(this.level, 1, 5, 100, 230));
    //fill(c);
    point(position.x, position.y);
  }
  
}
