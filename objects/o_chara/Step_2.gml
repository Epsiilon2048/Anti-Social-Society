
button_interact = not console_typing and keyboard_check_pressed(vk_shift) or keyboard_check_pressed(ord("Z"))
button_left		= not console_typing and keyboard_check(vk_left)	or keyboard_check(ord("A"))
button_up		= not console_typing and keyboard_check(vk_up)		or keyboard_check(ord("W"))
button_right	= not console_typing and keyboard_check(vk_right)	or keyboard_check(ord("D"))
button_down		= not console_typing and keyboard_check(vk_down)	or keyboard_check(ord("S"))