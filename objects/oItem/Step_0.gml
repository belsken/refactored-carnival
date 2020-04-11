if (dropMove)
{
	x = lerp(x, goalX, 0.1);
	y = lerp(y, goalY, 0.1);
	if (abs(x - goalX) < 1 and abs(y - goalY) < 1)
	{
		dropMove = false;
		
	}
}