
if not o_dialogue_box.enabled
{
	moved = (button_left or button_right) and not chara_move((button_right-button_left)*SPD, true)
	moved = (button_down or button_up) and not chara_move((button_down-button_up)*SPD, false) or moved
	
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
else if walking and frame_counter == FRAME_STEPS
{
	walking = false
	frame_counter = 0
	
	sprite_index = sprite_same_direction(chara, sprite_index, "")
}

if walking and frame_counter++ == FRAME_STEPS
{
	image_index ++
	frame_counter = 0
	
	if not moved
	{
		if button_up								sprite_index = chara.back
		else if button_down							sprite_index = chara.front
		if button_left and not button_right			sprite_index = chara.left
		else if button_right and not button_left	sprite_index = chara.right	
	}
}

var interactive = instance_place(x, bbox_top-1, o_interactive)
if button_interact and not o_dialogue_box.enabled_last and instance_exists(interactive)
{
	say(interactive.lines, interactive.sprite)
}

depth = -y