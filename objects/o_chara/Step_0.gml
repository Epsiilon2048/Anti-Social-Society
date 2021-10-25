
if o_fade.fading != 0 exit

spd = SPD

if not o_dialogue_box.enabled
{
	moved = (button_down or button_up) and not chara_move((button_down-button_up)*spd, false)
	moved = (button_left or button_right) and not chara_move((button_right-button_left)*spd, true) or moved
	
	if button_left and button_right and not (button_up or button_down) moved = false
	if button_up and button_down and not (button_left or button_right) moved = false
	
	o_camera.x = x
	o_camera.y = y-sprite_get_height(chara.front)/2
}


if not o_dialogue_box.enabled and (button_left or button_up or button_right or button_down)
{
	walking = true
	
	var old_image_index = image_index
	
	if moved
	{
		if button_up								sprite_index = chara.back_walk
		else if button_down							sprite_index = chara.front_walk
		if button_left and not button_right			sprite_index = chara.left_walk
		else if button_right and not button_left	sprite_index = chara.right_walk
	}
	
	image_index = old_image_index
}
else if walking and frame_counter == chara.walk_anim_speed
{
	walking = false
	frame_counter = 0
	
	sprite_index_switch(sprite_same_direction(chara, sprite_index, ""))
}


if walking and not moved
{
	var s = sprite_index
	
	if button_left			s = chara.left
	else if button_right	s = chara.right
	else if button_up		s = chara.back
	else if button_down		s = chara.front
	
	var same_direction = sprite_same_direction(chara, sprite_index, "")
	if (sprite_index != same_direction and frame_counter == chara.walk_anim_speed) or s != same_direction
	{
		sprite_index_switch(s)
	}
}

if walking and frame_counter++ == chara.walk_anim_speed
{
	image_index ++
	frame_counter = 0
	
}


switch sprite_get_direction(sprite_index)
{
	default:
		ip_x = x
		ip_y = bbox_bottom+1
	break
	case "front":
		ip_x = x
		ip_y = bbox_bottom+1
	break
	case "back":
		ip_x = x
		ip_y = bbox_top-1
	break
	case "left":
		ip_x = bbox_left-1
		ip_y = bbox_top
	break
	case "right":
		ip_x = bbox_right+1
		ip_y = bbox_top
}

var interactive = instance_place(ip_x, ip_y, o_interactive)
if not instance_exists(interactive) interactive = instance_place(x, y, o_monster)
if button_interact and not o_dialogue_box.enabled_last and instance_exists(interactive)
{
	say(get_lines(interactive), interactive.sprite, interactive.voice, interactive)
}

depth = -y