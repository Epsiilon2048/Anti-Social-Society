
function chara_move(dist, is_horizontal){

if dist == 0 return undefined

var inc = sign(dist)
var i = 0

while
	i++ <= abs(dist) and
	not (is_horizontal ? (colliding_at_pixel((inc == 1) ? bbox_right+1 : bbox_left-1, bbox_bottom) or colliding_at_pixel((inc == 1) ? bbox_right+1 : bbox_left-1, bbox_top)) :
	(colliding_at_pixel(bbox_left, (inc == 1) ? bbox_bottom+1 : bbox_top-1) or colliding_at_pixel(bbox_right, (inc == 1) ? bbox_bottom+1 : bbox_top-1)))
{
	if is_horizontal	x += inc
	else				y += inc
}

return i <= abs(dist)
}