class Mite
{
   float controlStartx;
  float controlStarty;
  float ax;
  float ay;
  float bx;
  float by;
  float cx;
  float cy;
  float dx;
  float dy;
  float ex;
  float ey;
  float controlEndx;
  float controlEndy;
  float t;
  float h;
  
  Mite()
  {
    updateMites();
    t=0;
    h=height-170;
  }
  
  void updateMites()
  {
     controlStartx=400;
    controlStarty=0;
    ax=400;
    ay=0;
    bx=460;
    by=0;
    cx=450;
    cy=30;
    dx=430;
    dy=60;
    ex=420;
    ey=60+t;
    controlEndx=controlStartx;
    controlEndy=controlEndy;
    
    t+=1;
  }
  
  void updateManyMites(float ox,float oy,float tr)
  {
    controlStartx=ox;
    controlStarty=oy;
    ax=ox;
    ay=oy;
    bx=ox+30;
    by=oy;
    cx=ox+15;
    cy=oy-40-tr;
    dx=cx;
    dy=cy;
    ex=cx;
    ey=cy;
    controlEndx=controlStartx;
    controlEndy=controlEndy;
    
    tr+=.3;
    
  }
  
  void updateBottomMites()
  {
    h=height-170;
    controlStartx=400;
    controlStarty=h;
    ax=400;
    ay=h;
    bx=460;
    by=h;
    cx=450;
    cy=h-10-t;
    dx=430;
    dy=h-45-t;
    ex=420;
    ey=(h-10)-t;
    controlEndx=controlStartx;
    controlEndy=controlEndy;
    
    t+=1;
    
  }
  
   void renderMites()
  {
    //base
    offscreen.fill(245,222,179);
   offscreen.beginShape();
   offscreen.curveVertex(controlStartx,controlStarty);
   offscreen.curveVertex(ax,ay);
   offscreen.curveVertex(bx,by);
   offscreen.curveVertex(cx,cy);
   offscreen.curveVertex(dx,dy);
   offscreen.curveVertex(ex,ey);
   offscreen.curveVertex(controlEndx,controlEndy);
   offscreen.endShape(); 
   
   //highlight
   offscreen.noStroke();
   offscreen.fill(210,105,30,50);
   offscreen.beginShape();
   offscreen.curveVertex(controlStartx+10,controlStarty+10);
   offscreen.curveVertex(ax+10,ay+10);
   offscreen.curveVertex(bx-20,by+10);
   offscreen.curveVertex(cx,cy);
   offscreen.curveVertex(dx,dy);
   offscreen.curveVertex(ex,ey);
   offscreen.curveVertex(controlEndx,controlEndy);
   offscreen.endShape(); 
   
  }
  
  void renderBottomMites()
  {
    offscreen.fill(245,222,179);
   offscreen.beginShape();
   offscreen.curveVertex(controlStartx,controlStarty);
   offscreen.curveVertex(ax,ay);
   offscreen.curveVertex(bx,by);
   offscreen.curveVertex(cx,cy);
   offscreen.curveVertex(dx,dy);
   offscreen.curveVertex(ex,ey);
   offscreen.curveVertex(controlEndx,controlEndy);
   offscreen.endShape(); 
  }
  
  void renderManyMites()
  {
    //base
    offscreen.fill(15,15,15);
   offscreen.beginShape();
   offscreen.curveVertex(controlStartx,controlStarty);
   offscreen.curveVertex(ax,ay);
   offscreen.curveVertex(bx,by);
   offscreen.curveVertex(cx,cy);
   offscreen.curveVertex(controlEndx,controlEndy);
   offscreen.endShape(); 
  
  
   offscreen.fill(75,75,15,50);
   offscreen.beginShape();
   offscreen.curveVertex(controlStartx,controlStarty);
   offscreen.curveVertex(ax,ay);
   offscreen.curveVertex(bx,by);
   offscreen.curveVertex(cx,cy+50);
   offscreen.curveVertex(controlEndx,controlEndy);
   offscreen.endShape(); 
   
    offscreen.fill(100,100,15,50);
   offscreen.beginShape();
   offscreen.curveVertex(controlStartx,controlStarty);
   offscreen.curveVertex(ax,ay);
   offscreen.curveVertex(bx,by);
   offscreen.curveVertex(cx,cy+70);
   offscreen.curveVertex(controlEndx,controlEndy);
   offscreen.endShape(); 
   
  }
    
  
}
