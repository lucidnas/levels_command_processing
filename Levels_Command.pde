/**
Program: Levels Command
Author: Abdulnasir Mohammed
Class: Computer Graphics
Date: 05/15/15
Credits: http://www.johndcook.com/blog/2009/08/24/algorithms-convert-color-grayscale/
**/



PImage construction;
PImage original;
int[] lightnessValues;

void setup() {

  String[] lines = loadStrings("data.txt");
  //println ("there are " + lines.length + " lines");
  construction = loadImage(lines[0]);
  original = loadImage("sun.jpg");
  int height = construction.height;
  int width = construction.width;
  size(width, height);
  lightnessValues = int(split(lines[1], ','));
   image(original, 0, 0 );
  //println(lightnessValues);
}


void draw(){
  int loc;
  int redValue, greenValue, blueValue;
   
  Boolean doCalc = true;
   
   
   if (mousePressed & (mouseButton == RIGHT))
    {
      image(original, 0, 0 );
    }

//Does levels command from 16 to 231 on left click 
   if (mousePressed && doCalc && (mouseButton == LEFT )){
    
    doCalc = false;
    for (int i =0; i < lightnessValues.length-1; i++)
    {
      image(original, 0, 0);
      loadPixels();
      for (int y = 0; y < height; y++)
        for (int x = 0; x < width; x++){
          loc = x +y * width;
          
          //storing the rgb color of every pixel
          redValue = int(red(pixels[loc]));
          blueValue = int (blue(pixels[loc])); 
          greenValue = int (green(pixels[loc]));
          
          //using The luminosity method to get the grayscale intensity
          int intensity = (int)(0.21 * redValue + 0.72 * greenValue + 0.07 * blueValue);
          
          // Using a gray scale level formula to map 
          int newRed = 255/215 * (redValue - 16);
          int newBlue = 255/215 * (blueValue - 16);
          int newGreen = 255/215 * (greenValue - 16);
          if (intensity >= lightnessValues[i] && intensity < lightnessValues[i+1])
          {
              pixels[loc] = color(newRed, newGreen, newBlue);
          }
          else if (intensity < 16) pixels[loc] = color(0);
          else  pixels[loc] = color(255);
             
          }
    
        updatePixels();
        saveFrame("Range" + lightnessValues[i]+ "to" + lightnessValues[i+1] + ".jpg");

  }
    
  
  }
  
}
    

