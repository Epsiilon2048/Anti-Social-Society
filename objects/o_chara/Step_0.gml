
chara_move((button_right-button_left)*SPD, true)
chara_move((button_down-button_up)*SPD, false)


if button_left or button_up or button_right or button_down
{
	walking = true
	
	var old_image_index = image_index
	
	if button_left and not button_right			sprite_index = chara.left_walk
	else if button_right and not button_left	sprite_index = chara.right_walk
	if button_down								sprite_index = chara.front_walk
	else if	button_up							sprite_index = chara.back_walk
	
	image_index = old_image_index
}
else if walking and frame_counter == FRAME_STEPS
{
	walking = false
	frame_counter = 0
	
	switch sprite_index
	{
	case chara.left_walk: sprite_index = chara.left break
	case chara.right_walk: sprite_index = chara.right break
	case chara.front_walk: sprite_index = chara.front break
	case chara.back_walk: sprite_index = chara.back break
	}
}

if walking and frame_counter++ == FRAME_STEPS
{
	image_index ++
	frame_counter = 0
}


depth = -y