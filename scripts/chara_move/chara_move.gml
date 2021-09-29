
function chara_move(dist, is_horizontal){

if dist == 0 return undefined

var inc = sign(dist)
var i = 0

while
	i++ <= abs(dist) and
	not (is_horizontal ? tilemap_get_at_pixel(tile_collision, (inc == 1) ? bbox_right+1 : bbox_left-1, bbox_bottom) :
	(tilemap_get_at_pixel(tile_collision, bbox_left, bbox_bottom+inc) or tilemap_get_at_pixel(tile_collision, bbox_right, bbox_bottom+inc)))
{
	if is_horizontal	x += inc
	else				y += inc
}
}