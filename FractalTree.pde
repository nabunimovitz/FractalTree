private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .5;  

private boolean winter = false;
private boolean spring = false;
private boolean summer = false;
private boolean fall = false;

public void setup() 
{   
	size(640,480);    
	//noLoop(); 
} 

public void draw() 
{   
	if(winter==true) //winter
	{
		background(255);
		stroke(135,206,250);
	}
	if(spring==true) //spring
	{
		background(255, 192,203);
		stroke(34,139,34);
	}
	if(summer==true) //summer
	{
		background(135,206,235);
		stroke(255,255,51);
	}
	if(fall==true) //fall
	{
		background(245, 155, 0);
		stroke(139,69,19);
	}
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2); 
} 
public void keyPressed()
{
	if(key == 'w') //winter
	{
		winter = true;
		spring = false;
		summer = false;
		fall = false;
		System.out.println(winter);
	}
	if(key == 's') //spring
	{
		winter = false;
		spring = true;
		summer = false;
		fall = false;
		System.out.println(winter);
	}
	if(key == 'd') //summer
	{
		winter = false;
		spring = false;
		summer = true;
		fall = false;
	}
	if(key == 'a') //fall
	{
		winter = false;
		spring = false;
		summer = false;
		fall = true;
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
