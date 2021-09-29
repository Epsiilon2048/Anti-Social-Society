
var dir = round(point_direction(x, y, o_chara.x, o_chara.y)/360*4)

switch dir
{
default: // 0 or 4
	sprite_index = chara.right
break
case 1:
	sprite_index = chara.back
break
case 2:
	sprite_index = chara.left
break
case 3:
	sprite_index = chara.front
break
}

depth = -y