
if init
{
	if		button_up		sprite_index = chara.back
	else if	button_left		sprite_index = chara.left
	else if	button_right	sprite_index = chara.right
	else					sprite_index = chara.front
	init = false
}

draw_self()

if draw_bbox
{
	draw_set_color(c_red)
	draw_set_alpha(.5)
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false)
	draw_set_alpha(1)
	draw_set_color(c_white)
}

if draw_interaction_point
{
	draw_set_color(c_red)
	draw_rectangle(ip_x, ip_y, ip_x, ip_y, false)
	draw_set_color(c_white)
}