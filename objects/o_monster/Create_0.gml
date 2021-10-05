
#macro walk_speed 2

chara = global.characters.rudy
voice = chara.voice
sprite = chara.talk

line_index = 0
lines = []
repeat_lines = ""

FRAME_STEPS = 7
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
	
	if (frame_counter++ >= SPIN_STEPS)
	{
		frame_counter = 0
		sprite_index = chara[$ turned_left(sprite_get_direction(sprite_index))]
	}	
}

states.spinleft = function(){
	
	if (frame_counter++ >= SPIN_STEPS)
	{
		frame_counter = 0
		sprite_index = chara[$ turned_right(sprite_get_direction(sprite_index))]
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
			sprite_index = chara[$ turned_left(sprite_get_direction(sprite_index))]
			if sprite_index == chara.front sprite_index = chara.front_walk
		}
		if pace_direction == -1 and sprite_index != chara.back_walk
		{
			sprite_index = chara[$ turned_left(sprite_get_direction(sprite_index))]
			if sprite_index == chara.back sprite_index = chara.back_walk
		}
	
		image_speed = 0
		image_index = old_image_index
	}
	
	if sprite_index == ((pace_direction == 1) ? chara.front_walk : chara.back_walk) and chara_move(pace_direction*PACE_SPD, false)
	{
		pace_direction *= -1
	}
}

state = states.stand