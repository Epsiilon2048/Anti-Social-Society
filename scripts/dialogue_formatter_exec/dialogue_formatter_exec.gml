
function parse_dialogue(line){ with o_dialogue_box {

var text = ""

var in = 1
var in_brackets = 0

for(var i = string_pos("[", line); i <= string_length(line); i++)
{
	text += slice(line, in, i, 1)
	in_brackets ++
	
	while in_brackets
	{
		var next_open = string_pos_ext("[", line, i+1)
		var next_close = string_pos_ext("]", line, i+1)
		
		if not next_close 
		{
			in_brackets = 0
			next_close = string_length(line)+1
		}
		else if next_open < next_close
		{
			in_brackets ++
			i = next_open
		}
		else
		{
			in_brackets --
			i = next_close
		}
		
		if not in_brackets and string_char_at(line, i+1) == "["
		{
			in_brackets ++
			line = string_delete(line, i, 2)
			line = string_insert(line, ";", i)
		}
	}
}
}}




function dialogue_formatter_exec(command){ with o_dialogue_box {

static formatter_error = function(str){
	show_debug_message("< DIALOGUE FORMATTER > "+str)
}

static default_wait = room_speed/2



var lines = string_split(command, ";")

for(var i = 0; i <= array_length(lines); i++)
{
	command = lines[i]
	
	var sep = string_pos(" ", command)
	if sep == 0 sep = string_length(command)+1

	var action = shave(" ", slice(command, 1, sep, 1))
	var value = shave(" ", slice(command, sep+1, -1, 1))

	if		action == "c" or action == "col"	action = "color"
	else if	action == "s" or action == "spr"	action = "sprite"
	else if	action == "d" or action == "del"	action = "delay"
	else if	action == "w"						action = "wait"
	else if action == "exec"					action = "gmcl"

	switch action
	{
	default:
		formatter_error("Unknown dialogue command: \""+action+"\"")
	break


	case "color":
		if value == "" color = c_white
		else color = hex_to_color(value)
	break


	case "sprite":
		if value == "" sprite = -1
		else
		{
			sprite = asset_get_index(value)
			if sprite == -1
			{
				formatter_error("Unknown sprite: \""+value+"\"")
			}
		}
	break


	case "delay":
		if value == "" delay_factor = 0
		else delay_factor = real(value)
	break


	case "wait":
		if value == "" wait_timer = default_wait
		else wait_timer = real(value)*room_speed
	break


	case "gmcl":
		gmcl_exec(value)
	break
	}
}
}}