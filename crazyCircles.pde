int nPlanets = 4;
Planet[] p = new Planet[200];

void setup()

{
  size(800,600);
  for(int i = 0; i < nPlanets; i = i + 1)
  {
     p[i] = new Planet(random (10,60),random(100,400));
     p[i].randomize();
     p[i].createMoons();
  }
 
}

void draw()
{
  clearScene();
  translate(width/2,height/2);
  for(int i = 0; i < nPlanets; i = i + 1)
  {
    p[i].show();
  }
}

class Planet //Class Planet can store its own data

{
 float size = 20; //planet s
 float dist = 100; //distance from sun
 float angle = 0; //starting angle
 float speed = 1.0; //speed
 color col = color(225,225,225,20);
 Planet[] moons = new Planet[20];
 int nMoons= 0;
 
 Planet(float _size, float _dist)
 {
   this.size = _size;
   this.dist = _dist;
 }
 
 void show()
 {
 pushMatrix();
   rotate(radians(this.angle));
   translate(this.dist,0);
   noStroke();
   fill(this.col);
   circle(0,0,this.size);
   this.angle = this.angle+this.speed;
   for(int i = 0; i < this.nMoons; i = i + 1)
   {
     this.moons[i].show();
   }
 popMatrix();
 }
 
void randomize()
  {
  this.size = random(10,100);
  this.dist = random(50,400);
  this.angle = random(360);
  this.speed = random(-2.0,2.0);
  this.col = color(random(225),random(225),random(225));
  }
  
  void createMoons()
{
  this.nMoons = floor(random(4));
  for(int i = 0; i < nPlanets; i = i + 1)
  {
    this.moons[i]=new Planet (random(10,60),random(100,400));
    this.moons[i].randomize();
  }
}
  
}




void clearScene()
{
  //partial screen clear
  noStroke();
  fill(color(0,0,0,10));
  rect(0,0,800,600);
}
