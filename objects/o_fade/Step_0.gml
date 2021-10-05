
if fading == 1
{
	alpha += alpha_inc
	
	if alpha >= 1 
	{
		fading = -1
		room_goto(room_goingto)
	}
}
else if fading == -1
{
	alpha -= alpha_inc
	
	if alpha <= 0 fading = 0
}