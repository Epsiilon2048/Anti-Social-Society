
button_left		= keyboard_check(vk_left)	or keyboard_check(ord("A"))
button_up		= keyboard_check(vk_up)		or keyboard_check(ord("W"))
button_right	= keyboard_check(vk_right)	or keyboard_check(ord("D"))
button_down		= keyboard_check(vk_down)	or keyboard_check(ord("S"))

if button_left or button_up or button_right or button_down
{
	walking = true
	
	if button_left and not button_right			sprite_index = chara.left_walk
	else if button_right and not button_left	sprite_index = chara.right_walk
	if button_down								sprite_index = chara.front_walk
	else if	button_up							sprite_index = chara.back_walk
}
else if walking
{
	walking = false
	
	switch sprite_index
	{
	case chara.left_walk: sprite_index = chara.left break
	case chara.right_walk: sprite_index = chara.right break
	case chara.front_walk: sprite_index = chara.front break
	case chara.back_walk: sprite_index = chara.back break
	}
}