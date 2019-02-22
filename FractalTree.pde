private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);     
} 
public void draw() 
{  
	stroke((float)(255*Math.random()),(float)(255*Math.random()),(float)(255*Math.random()));   
	line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2);
  
}
public void mousePressed()
{
  background(color((int)(255*Math.random()), (int)(255*Math.random()), (int)(255*Math.random())));
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line((float)x, (float)y, (float)endX1, (float)endY1);
  line((float)x, (float)y, (float)endX2, (float)endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }

} 
