
draw_self()

if instance_exists(o_chara) and o_chara.draw_bbox
{
	draw_set_color(c_red)
	draw_set_alpha(.5)
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false)
	draw_set_alpha(1)
	draw_set_color(c_white)
}