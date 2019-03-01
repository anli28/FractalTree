private double fractionLength = .8; 
private int smallestBranch = 8; 
private double branchAngle = .5;
public float twirl = 3;

public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);  
	strokeWeight(3);  
	stroke(139,69,19);  
	line(320,450,320,380);   
	drawBranches(320,380,100,twirl*Math.PI/2);
} 
public void mousePressed() {
	
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle - branchAngle;
	double angle2 = angle + branchAngle;
	double angle3 = angle2;
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength * Math.cos(angle1) + x);
	int endY1 = (int)(branchLength * Math.sin(angle1) + y); 
	int endX2 = (int)(branchLength * Math.cos(angle2) + x);
	int endY2 = (int)(branchLength * Math.sin(angle2) + y);
	int endX3 = (int)(branchLength * Math.cos(angle3*2) + x);
	int endY3 = (int)(branchLength * Math.sin(angle3*2) + x);

	for(int i = 0; i < 1000; i++){
		stroke((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
	}
	line(x,y,endX2,endY2);
	line(x,y,endX1,endY1);
	
	if(branchLength >= smallestBranch)
	{
		drawBranches(endX1,endY1,(branchLength),angle1);
		drawBranches(endX2,endY2,(branchLength),angle2);
	}
  
} 