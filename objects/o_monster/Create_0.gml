
#macro walk_speed 2

chara = global.characters.rudy

FRAME_STEPS = 5
SPIN_STEPS = 7
PACE_SPD = 2

collision = false

frame_counter = 0

pace_direction = 1

mask_index = s_chara_back

states = {}
	
states.stand = function(){
	sprite_index = chara.front
}
	
states.look_at_chara = function(){
	sprite_index = chara[$ direction_name(point_direction(x, y, o_chara.x, o_chara.y))]
}


states.talk = states.look_at_chara

states.spinright = function(){
	frame_counter ++
	
	if (frame_counter mod SPIN_STEPS) == 0 switch sprite_index
	{
	default:			sprite_index = chara.front break
	case chara.front:	sprite_index = chara.right break
	case chara.right:	sprite_index = chara.back break
	case chara.back:	sprite_index = chara.left break
	case chara.left:	sprite_index = chara.front break
	}	
}

states.spinleft = function(){
	frame_counter ++
	
	if (frame_counter mod SPIN_STEPS) == 0 switch sprite_index
	{
	default:			sprite_index = chara.front break
	case chara.front:	sprite_index = chara.left break
	case chara.left:	sprite_index = chara.back break
	case chara.back:	sprite_index = chara.right break
	case chara.right:	sprite_index = chara.front break
	}	
}

states.pace = function(){
	
	if frame_counter++ >= FRAME_STEPS * (walk_speed/PACE_SPD)
	{
		frame_counter = 0
		image_index ++
	
		var old_image_index = image_index
	
		if pace_direction == 1 and sprite_index != chara.front_walk
		{
			switch sprite_index
			{
			default:				
				sprite_index = chara.front_walk 
				image_index ++
				break
			case chara.back_walk:	sprite_index = chara.right break
			case chara.right:		sprite_index = chara.front_walk break
			}
		}
		if pace_direction == -1 and sprite_index != chara.back_walk
		{
			switch sprite_index
			{
			default:				sprite_index = chara.back_walk break
			case chara.front_walk:	sprite_index = chara.left break
			case chara.left:		sprite_index = chara.back_walk break
			}
		}
	
		image_speed = 0
		image_index = old_image_index
	}
	
	if sprite_index == ((pace_direction == 1) ? chara.front_walk : chara.back_walk) and chara_move(pace_direction*PACE_SPD, false)
	{
		pace_direction *= -1
	}
}

state = states.look_at_chara