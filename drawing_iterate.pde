//import processing.video.*;

//Capture video;


color outline_color;

PImage tiger;
PImage tiger_outline;

Point mover;

Point[] outline;

Point[] waypoints;

color[][] waypointcolors;

void setup(){
  
  //video = new Capture(this, width, height);
  //video.start();
  
  mover = new Point(0,0);

  frameRate(60);  
  
  outline_color = color(0,0,0); 
  //fullScreen();
  size(768,768);
  background(0);
  
  //load the pixels of the outline images
  tiger_outline = loadImage("tiger_outline.jpeg");
  tiger = loadImage("tiger.jpeg");
  
  
  
  //image(tiger, 0, 0);

  //create a list to hold the values of the outline as booleans
  outline = new Point[tiger_outline.width * tiger_outline.height];
  
  //loop through the pixels of the outline image and set the outline array to true if the color is yellow
  for(int x=0; x<tiger_outline.width; x++){
    for(int y=0; y<tiger_outline.height; y++){
      //calculate the location of the pixel
      int loc = x + (y * tiger_outline.width);
      //determine the red, green and blue 
      float r = red  (tiger_outline.pixels[loc]);
      float g = green(tiger_outline.pixels[loc]);
      float b = blue (tiger_outline.pixels[loc]);
      
      if(r >=0 && g==0 && b==0){
        //
        Point destination_point = new Point(x,y);
        outline[loc] = destination_point; 
      }
    }
  }
  
  int outline_count = 0;
  
  for(int u=0; u<outline.length; u++){
    if(outline[u] != null){
      outline_count += 1;
    } 
  }
  
  Point[] outline_destinations = new Point[outline_count];
  int index = 0;
  for(int w=0; w<outline.length; w++){
    if(outline[w] != null){
      
      Point new_point = new Point(outline[w].x, outline[w].y);
      
      outline_destinations[index] = new_point;
      
      index += 1;
    }
  }
  
  
  //select n samples
  int n_samples = 100;
  
  waypoints = new Point[outline_destinations.length / n_samples];
  
  
  //loop through the list of outline_destinations taking each 12th point and adding it to the waypoints list
  int n_count = 0;
  int add_count = 0;
  
  for(int t=0; t<outline_destinations.length; t++){
    if(n_count == n_samples){
      
      //reset the n count
      n_count = 0;
      //add that
      
      Point new_waypoint = new Point(outline_destinations[t].x, outline_destinations[t].y);
      waypoints[add_count] = new_waypoint;
      
      add_count += 1;
      
    }
    
    n_count += 1;
  }
  
 
  
  waypointcolors = new color[waypoints.length][];
  
  //print the waypoints points
  for(int m=0; m<waypoints.length; m++){  
    //
    float topx = waypoints[m].x;
    float topy = waypoints[m].y+1;
    
    float bottomx = waypoints[m].x;
    float bottomy = waypoints[m].y-1;
    
    float rightx = waypoints[m].x+1;
    float righty = waypoints[m].y;
    
    float leftx = waypoints[m].x-1;
    float lefty = waypoints[m].y;
    
    float toprightx = waypoints[m].x+1;
    float toprighty = waypoints[m].y+1;
    
    float topleftx = waypoints[m].x-1;
    float toplefty = waypoints[m].y+1;
    
    float bottomleftx = waypoints[m].x-1;
    float bottomlefty = waypoints[m].y-1;
    
    float bottomrightx = waypoints[m].x+1;
    float bottomrighty = waypoints[m].y-1;

    int toploc = int(topx + (topy * tiger.width));
    int bottomloc = int(bottomx + (bottomy * tiger.width));
    int leftloc = int(leftx + (lefty * tiger.width));
    int rightloc = int(rightx + (righty * tiger.width));
    int toprightloc = int(toprightx + (toprighty * tiger.width));
    int topleftloc = int(topleftx + (toplefty * tiger.width));
    int bottomrightloc = int(bottomrightx + (bottomrighty * tiger.width));
    int bottomleftloc = int(bottomleftx + (bottomlefty * tiger.width));
    
    color top = color(red(tiger.pixels[toploc]),green(tiger.pixels[toploc]),blue(tiger.pixels[toploc]));
    color bottom = color(red(tiger.pixels[bottomloc]),green(tiger.pixels[bottomloc]),blue(tiger.pixels[bottomloc]));
    color left = color(red(tiger.pixels[leftloc]),green(tiger.pixels[leftloc]),blue(tiger.pixels[leftloc]));
    color right = color(red(tiger.pixels[rightloc]),green(tiger.pixels[rightloc]),blue(tiger.pixels[rightloc]));
    color topright = color(red(tiger.pixels[toprightloc]),green(tiger.pixels[toprightloc]),blue(tiger.pixels[toprightloc]));
    color topleft = color(red(tiger.pixels[topleftloc]),green(tiger.pixels[topleftloc]),blue(tiger.pixels[topleftloc]));
    color bottomright = color(red(tiger.pixels[bottomrightloc]),green(tiger.pixels[bottomrightloc]),blue(tiger.pixels[bottomrightloc]));
    color bottomleft = color(red(tiger.pixels[bottomleftloc]),green(tiger.pixels[bottomleftloc]),blue(tiger.pixels[bottomleftloc]));



    //sample the pixel colors surrounding the waypoint
    color[] surrounding_colors = new color[8];
    
    surrounding_colors[0] = top;
    surrounding_colors[1] = bottom;
    surrounding_colors[2] = left;
    surrounding_colors[3] = right;
    surrounding_colors[4] = topright;
    surrounding_colors[5] = topleft;
    surrounding_colors[6] = bottomright;
    surrounding_colors[7] = bottomleft;
    
    waypointcolors[m] = surrounding_colors;
 
    //noStroke();
    //fill(0,0,255);
    //circle(waypoints[m].x, waypoints[m].y, 1);
    
    int  squaresize = 1;
    
    //fill(top);
    //square(topx,topy,squaresize);
    //fill(bottom);
    //square(bottomx,bottomy,squaresize);
    //fill(left);
    //square(leftx,lefty,squaresize);
    //fill(right);
    //square(rightx,righty,squaresize);
    //fill(topleft);
    //square(topleftx,toplefty,squaresize);
    //fill(topright);
    //square(toprightx,toprighty,squaresize);
    //fill(bottomright);
    //square(bottomrightx,bottomrighty,squaresize);
    //fill(bottomleft);
    //square(bottomleftx,bottomlefty,squaresize);
    
    
    
  }
  
  
  //for each way point > calculate the pixel locations surrounding it
 
  
  //store those pixels colors in a list
  
  
  
}

void draw(){
  
  
    
  //generate a random number from 0 - the width / height
    int random_x = int(random(0,width));
    int random_y = int(random(0,height));
    
    Point new_mover = new Point(random_x,random_y);
    
    float[] distances = new float[waypoints.length];
    
    //find the closest 3 waypoints to the new_mover
    for(int z=0;z<waypoints.length;z++){
      
      //calculate the distance from the mover to the waypoint
      float distance = sqrt(  pow((random_x - waypoints[z].x), 2) + pow((random_y - waypoints[z].y), 2) );
      distances[z] = distance;
      
    
    }
    
    float minimum = min(distances);
    int minimumindex = 0;
    
    for(int e=0; e<distances.length;e++){
      if(distances[e] == minimum){
        minimumindex = e;
      }
    }
    
    //generate a random int from 0-7
    int color_selection = int(random(0,7));
    
    //print the color list of that index
    println(waypointcolors[minimumindex][color_selection]);
   
    color fillcolor = waypointcolors[minimumindex][color_selection];
    
    noStroke();
    fill(fillcolor);
    
    circle(new_mover.x, new_mover.y, random(sqrt(2),sqrt(18)));
    
    
  
  
  
}


void Iterate(int iterations){
  
  


}

class Point { 
 
  float x; 
  float y;
 
  Point (float x_, float y_) { 
    x = x_; 
    y = y_;
  }
}
