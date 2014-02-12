// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// PBox2D example

// A rectangular box
class Lollipop {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;
  float r;
  float incr;
  Mite stal;
  Mite bottom;
 
  
  

  // Constructor
  Lollipop(float x, float y) {
    w = 8;
    h = 24;
    r = 8;
    incr=0;
    // Add the box to the box2d world
    makeBody(new Vec2(x, y));
    stal=new Mite();
    bottom=new Mite();
    bottom.updateBottomMites();
   
    
  }
  
 


  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > bottom.ey-30) {
      if(bottom.ey==stal.ey){
        stal.updateMites();
        bottom.updateBottomMites();
        println(bottom.ey);
        killBody();
        return true;
      }
      else{
      stal.updateMites();
      bottom.updateBottomMites();
      AudioPlayer groove = minim.loadFile("WaterDropSound.wav");
      groove.play();
      //stal.renderMites();
      killBody();
      return true;
      }
    }
    return false;
  }

  // Drawing the lollipop
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
   

   
    offscreen.pushMatrix();
    offscreen.translate(pos.x, pos.y);
    offscreen.noStroke();
    offscreen.fill(176,224,230);
    
   // offscreen.fill(255,0,0);
   // offscreen.ellipse(bottom.ex,bottom.ey,10,10);
   

    incr+=.02;
    offscreen.ellipse(0, h/2, r*incr, r*incr);
    offscreen.popMatrix();
    
    
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center) {

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    CircleShape circle = new CircleShape();
    circle.m_radius = box2d.scalarPixelsToWorld(r);
    Vec2 offset = new Vec2(0,h/2);
    offset = box2d.vectorPixelsToWorld(offset);
    circle.m_p.set(offset.x,offset.y);

 

   
    body.createFixture(circle, 1.0);


  }
}

