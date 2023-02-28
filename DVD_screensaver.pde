float x = int(random(width));
float y = int(random(height));
int x_vel = 2;
int y_vel = 2;
int corners = 0;

PImage dvd;
PFont font;

void setup(){
  size(800,600); //aspect ratio 4:3
  dvd = loadImage("dvd.png");
  font = createFont("Arial",36,false);
  textFont(font,36);
  colorMode(HSB);
}

void changeColour(){
  float hue = random(255);
  color col = color(hue,255,255);
  tint(col);
}

void draw(){
  background(0);
  textAlign(CENTER);
  text("Corner hits: "+corners,width/2,height-20);
  image(dvd,x,y);
  
  x += x_vel;
  y += y_vel;
  
  if (x <= 0){
    x_vel =-x_vel;
    x = 0;
    changeColour();
  }
  
  if (y <= 0){
    y_vel =-y_vel;
    y = 0;
    changeColour();
  }
  
  if (x + dvd.width >= width){
    x_vel =-x_vel;
    x = width - dvd.width;
    changeColour();
  }
  
  if (y + dvd.height >= height){
    y_vel =-y_vel;
    y = height - dvd.height;
    changeColour();
  }
  
  //corner detection
  if (((x==0) && (y==0)) || ((x==0) && (y==height-dvd.height)) || ((x==width-dvd.width) && (y==0)) || ((x==width-dvd.width) && (y==height-dvd.height))){
    corners ++;
    background(255);
  }
}
