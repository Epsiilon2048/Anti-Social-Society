
function turned_left(dir_name){
	
switch dir_name
{
default:		return "front"
case "front":	return "left"
case "left":	return "back"
case "back":	return "right"
case "right":	return "front"
}
}