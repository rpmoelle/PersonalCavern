/*Rachel Moeller
 *2013
 */

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

// Using
// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// PBox2D example

// Basic example of falling rectangles

import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import deadpixel.keystone.*;

Keystone ks;
PGraphics offscreen;
CornerPinSurface surface;
int offscreenW = 480; 
int offscreenH = 360; 

Minim minim;
AudioPlayer groove;

// A reference to our box2d world
PBox2D box2d;

float ox;
 float tr;

// A list for all of our rectangles
ArrayList<Lollipop> pops;
ArrayList<Mite> pointies;

Mite m;
Mite b;

void setup() {
  //size(640,480,P3D);
 size(displayWidth,480, P3D);
  smooth();
  ox=random(10,width-10);
 tr=random(0,2);
  minim = new Minim(this);
  groove = minim.loadFile("WaterDropSound.wav");
  
  
  ks = new Keystone(this);
  surface = ks.createCornerPinSurface(offscreenW, offscreenH, 20);
  offscreen = createGraphics(offscreenW, offscreenH, P3D);

  // Initialize box2d physics and create the world
  box2d = new PBox2D(this,20);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -20);

  // Create ArrayLists	
  pops = new ArrayList<Lollipop>();
  pointies=new ArrayList<Mite>();
  m=new Mite();
  b=new Mite();
}

void drawLotsOfMites()
{
 for(int i=0;i<49;i++)
 {
  pointies.add(new Mite());
 }
  //background
 pointies.get(0).updateManyMites(30,height-240,70);
 pointies.get(1).updateManyMites(50,height-190,80);
 pointies.get(2).updateManyMites(70,height-230,100);
 pointies.get(3).updateManyMites(85,height-210,1);
 
 pointies.get(4).updateManyMites(5,height-230,70);
 pointies.get(5).updateManyMites(15,height-190,200);
 pointies.get(6).updateManyMites(100,height-225,100);
 pointies.get(7).updateManyMites(120,height-210,200);
 
 pointies.get(8).updateManyMites(145,height-240,160);
 pointies.get(9).updateManyMites(170,height-230,180);
 pointies.get(10).updateManyMites(210,height-250,100);
 pointies.get(11).updateManyMites(230,height-210,1);
  //midground
 pointies.get(12).updateManyMites(200,height-190,1);
 pointies.get(13).updateManyMites(200,height-190,1);
 pointies.get(14).updateManyMites(200,height-190,1);
 pointies.get(15).updateManyMites(200,height-190,1);
 //foreground
 pointies.get(16).updateManyMites(20,height-180,1);
 pointies.get(17).updateManyMites(25,height-175,2);
 pointies.get(18).updateManyMites(50,height-190,4);
 pointies.get(19).updateManyMites(80,height-185,3);
 pointies.get(20).updateManyMites(200,height-190,1);
 pointies.get(21).updateManyMites(240,height-210,30);
 pointies.get(22).updateManyMites(220,height-225,1);
 pointies.get(23).updateManyMites(180,height-190,15);
 pointies.get(24).updateManyMites(150,height-190,40);
 pointies.get(25).updateManyMites(210,height-175,1);

 pointies.get(26).updateManyMites(0,height-172,1);
 pointies.get(27).updateManyMites(25,height-190,15);
 pointies.get(28).updateManyMites(40,height-180,.5);
 //pointies.get(29).updateManyMites(250,height-177,1);
 //middle area
 pointies.get(29).updateManyMites(260,height-260,-3);
 pointies.get(30).updateManyMites(280,height-280,-15);
 pointies.get(31).updateManyMites(300,height-270,.07);
 pointies.get(32).updateManyMites(290,height-250,-25);
 
  pointies.get(33).updateManyMites(310,height-250,1);
 pointies.get(34).updateManyMites(330,height-210,-15);
 pointies.get(35).updateManyMites(350,height-240,40);
 pointies.get(36).updateManyMites(375,height-230,-20);
 
 //right area
 pointies.get(37).updateManyMites(390,height-250,70);
 pointies.get(38).updateManyMites(410,height-230,90);
 pointies.get(39).updateManyMites(420,height-240,80);
 pointies.get(40).updateManyMites(440,height-230,120);
 
 pointies.get(37).updateManyMites(440,height-250,180);
 pointies.get(38).updateManyMites(430,height-230,160);
 pointies.get(39).updateManyMites(400,height-240,80);
 pointies.get(40).updateManyMites(380,height-230,120);
 
 //foreground
 pointies.get(41).updateManyMites(370,height-190,110);
 pointies.get(42).updateManyMites(365,height-187,130);
 pointies.get(43).updateManyMites(420,height-222,1);
 pointies.get(44).updateManyMites(440,height-212,-2);
 
 pointies.get(45).updateManyMites(430,height-230,1);
 pointies.get(46).updateManyMites(450,height-220,-3);
 pointies.get(47).updateManyMites(420,height-220,1);
 pointies.get(48).updateManyMites(440,height-230,-2);
 
 for(int i=0;i<49;i++)
 {
  pointies.get(i).renderManyMites();
 }
  
}

void draw() {
  offscreen.beginDraw();
  offscreen.background(0);
  drawLotsOfMites();
  println(mouseX);

  // We must always step through time!
  box2d.step();

  
  // Display all the people
  for (Lollipop p: pops) {
    p.display();
  }


  // people that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = pops.size()-1; i >= 0; i--) {
    Lollipop p = pops.get(i);
    if (p.done()) {
      m.updateMites();
      b.updateBottomMites();
      pops.remove(i);
    }
  }
  b.renderBottomMites();
  m.renderMites();
  offscreen.endDraw();
  background(0);
  surface.render(offscreen);
}

void doThis() {
  Lollipop p = new Lollipop(m.ex,m.ey-10);
  pops.add(p);
}

void keyPressed() {
  if(key==CODED){
    if(keyCode==LEFT)
    {
      ks.toggleCalibration();
    }
    if(keyCode==RIGHT)
    {
      doThis();
    }
  }
}
void stop()
{
  // always close Minim audio classes when you finish with them
  groove.close();
  // always stop Minim before exiting
  minim.stop();

  super.stop();
}



