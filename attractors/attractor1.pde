int width = 1200;
int height = 800;

float x, y, z;
float a, b, c;
float t;
float scale;

float bb_change;

int iterations;

color color1 = color(10, 2, 2);
color color2 = color(2, 2, 10);

void setup(){
  size(width, height, P2D);
  smooth();
  blendMode(ADD);
  
  x = 0;
  y = 0;
  z = 0;
  
  a = 0.2;
  b = 0.2;
  c = 5.7;
  
  bb_change = 0.001;
  
  iterations = 30000;
  
  scale = 25;
  
  t = 0.01;
}

void draw(){
  float dx, dy, dz;
  color pc;
  background(0);
  
  strokeWeight(1);
  
  for(float bb = 0.1; bb < 0.3; bb+=bb_change){
    for(int i = 0; i < iterations; i++){
      dx = -y -z;
      dy = x + (a*y);
      //float dz = b + (z*(x-c));
      dz = bb + (z*(x-c));
    
      x = x + (dx * t);
      y = y + (dy * t);
      z = z + (dz * t);
    
      pc = lerpColor(color1, color2, (float)i/iterations);
 
      stroke(pc);
    
      if(i > iterations/3){  
        point((x*scale) + width/2, (y*scale) + height/2);
      }
    }
  }
  
  //filter(BLUR);
  saveFrame("attractor1.png");
  noLoop();
}
