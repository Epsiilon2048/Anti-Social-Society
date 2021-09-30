
enabled_last = enabled

if enabled and array_length(line_queue) != 0 and text_index < array_length(line_queue[line_index])
{
	repeat CHARS_PER_STEP
	{
		text += string_char_at(line_queue[line_index][text_index], text_charindex)
		text_charindex ++
	
		if text_charindex > string_length(line_queue[line_index][text_index])
		{
			text_index ++
			break
		}
	}
}
else if enabled box_finished = true

if box_finished and button_next
{
	box_finished = false
	
	if ++line_index >= array_length(line_queue)
	{
		enabled = false
	}
}