
function turned_right(dir_name){

switch dir_name
{
default:		return "front"
case "front":	return "right"
case "right":	return "back"
case "back":	return "left"
case "left":	return "front"
}
}