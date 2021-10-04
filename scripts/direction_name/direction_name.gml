
function direction_name(dir){

dir = round(dir/360*4)

switch dir
{
default /*1 or 4*/:	return "right"
case 1:				return "back"
case 2:				return "left"
case 3:				return "front"
}
}