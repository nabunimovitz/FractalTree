private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .5;  
private int season =4;

public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	if(season == 1) //winter
	{
		background(255);
		stroke(0,0,255);
	}
	if(season ==2) //spring
	{
		background(188, 143,143);
		stroke(34,139,34);
	}
	if(season == 3) //summer
	{
		background(135,206,235);
		stroke(255,255,51);
	}
	if(season == 4) //autumn
	{
		background(255, 165, 0);
		stroke(139,69,19);
	}
	   
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2); 
} 
public void keyPressed()
{
	if(key == 'w') //winter
	{
		season = 1;
	}
	if(key == 's') //spring
	{
		season = 2;
	}
	if(key == 'd') //summer
	{
		season = 3;
	}
	if(key == 'a') //fall
	{
		season = 4;
	}
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1=angle+branchAngle;
	double angle2=angle-branchAngle;

	branchLength=branchLength*fractionLength; 

	int endX1=(int)(branchLength*Math.cos(angle1)+x);
	int endY1=(int)(branchLength*Math.sin(angle1)+y);
	int endX2=(int)(branchLength*Math.cos(angle2)+x);
	int endY2=(int)(branchLength*Math.sin(angle2)+y);

	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2); 

	if(branchLength>smallestBranch)
	{
		drawBranches(endX1, endY1 , branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);   
	}
} 
