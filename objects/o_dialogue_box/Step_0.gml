
enabled_last = enabled

if enabled and array_length(line_queue) != 0 and line_index < array_length(line_queue)
{	
	if button_charskip or button_skip
	{
		text = line_queue[line_index]
		box_finished = true
		text_charindex = string_length(text)+1
	}
	else if timer-- <= 0
	{	
		var _text = line_queue[line_index]
	
		var char_prev = ""
		var char = ""
		var char_next = string_char_at(_text, text_charindex)
		char_delay = undefined
	
		var added_text = false
	
		while is_undefined(char_delay)
		{
			char_prev = char
			char = char_next
			char_next = string_char_at(_text, text_charindex+1)
			
			if char == ""
			{
				char_delay = 0
				box_finished = true
				break
			}
			
			added_text = added_text or string_lettersdigits(char) != ""
			text += char
			text_charindex ++
		
			if char == " " and char_next == " " and not string_pos(char_prev, ".!?") char_delay = 0
			else if string_pos(char, ".!?") char_delay = 0
			else if char == "," and char_next == " " char_delay = 5
			else if string_lettersdigits(char) != "" char_delay = 0
		}
		if added_text audio_play_sound(snd_text, 0, 0)
	
		timer = char_delay
	}
}

if box_finished and (button_next or button_skip)
{
	box_finished = false
	text = ""
	text_charindex = 1
	timer = 0
	
	if ++line_index >= array_length(line_queue)
	{
		enabled = false
	}
}