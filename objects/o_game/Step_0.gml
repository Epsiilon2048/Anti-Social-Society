
if not chara_warned and not instance_exists(o_chara)
{
	chara_warned = true
	output_set("Chara not detected in room; press F12 to create chara at mouse position")
}
if chara_warned and keyboard_check_pressed(vk_f12)
{
	chara_warned = false
	instance_create_depth(mouse_x, mouse_y, 0, o_chara)
}