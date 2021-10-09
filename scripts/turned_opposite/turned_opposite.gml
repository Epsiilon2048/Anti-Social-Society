
function turned_opposite(dir_name){

switch dir_name
{
default:		return "front"
case "front":	return "back"
case "right":	return "left"
case "back":	return "front"
case "left":	return "right"
}
}