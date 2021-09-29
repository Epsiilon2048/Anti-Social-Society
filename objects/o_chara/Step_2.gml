
button_left		= keyboard_check(vk_left)	or keyboard_check(ord("A"))
button_up		= keyboard_check(vk_up)		or keyboard_check(ord("W"))
button_right	= keyboard_check(vk_right)	or keyboard_check(ord("D"))
button_down		= keyboard_check(vk_down)	or keyboard_check(ord("S"))

if button_left and not button_right			sprite_index = chara.left
else if button_right and not button_left	sprite_index = chara.right
if button_down								sprite_index = chara.front
else if	button_up							sprite_index = chara.back