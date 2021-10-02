
function chara_move(dist, is_horizontal){

if dist == 0 return undefined

var inc = sign(dist)
var i = 0

while
	i++ <= abs(dist) and
	not (is_horizontal ? colliding_at_pixel((inc == 1) ? bbox_right+1 : bbox_left-1, bbox_bottom) :
	(colliding_at_pixel(bbox_left, bbox_bottom+inc) or colliding_at_pixel(bbox_right, bbox_bottom+inc)))
{
	if is_horizontal	x += inc
	else				y += inc
}

return i <= abs(dist)
}