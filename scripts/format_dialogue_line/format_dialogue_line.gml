function format_dialogue_line(text, has_sprite){
	
draw_set_font(fnt_dialogue)
	
text = string_replace_all(text, " ", "  ")

var line_length = has_sprite ? dialogue_line_sprite_length : dialogue_line_length
var newtext = ""
var current_ln = 0
var newlines = 0

var char = ""
var char_next = string_char_at(text, 1)

for(var i = 1; i <= string_length(text); i++)
{
	var char_prev = char
	var char = char_next
	var char_next = string_char_at(text, i+1)
	
	if current_ln > line_length and (not string_pos(char, " -\n") or i == string_length(text))
	{
		var start_index
		
		if string_pos(char_prev, " -\n") 
		{
			start_index = string_length(newtext)+2
			newtext += "\n"
		}
		else 
		{
			start_index = string_char_next(" -", newtext, string_length(newtext), -1)+1
			newtext = string_insert("\n", newtext, start_index)
		}
		current_ln = string_width(slice(newtext, start_index, -1, 1))/alpha_char_width
		newlines++
	}
	else if char == "\n" 
	{
		current_ln = 0
		newlines ++
	}
	
	if char == "'" and string_lettersdigits(char_next) != ""
	{
		newtext += "' "
		current_ln += string_width(" ")/alpha_char_width
	}
	else if char == "."
	{
		newtext += ". "
		current_ln += string_width("  ")/alpha_char_width
	}
	else if char == "("
	{
		newtext += "( "
		current_ln += string_width("  ")/alpha_char_width
	}
	else if char == ")"
	{
		newtext += " )"
		current_ln += string_width("  ")/alpha_char_width
	}
	else if string_pos(char, ",!?") and char_next == " "
	{
		newtext += char+"  "
		current_ln += string_width("  ")/alpha_char_width
	}
	else newtext += char
	
	current_ln += string_width(char)/alpha_char_width
}

if newlines > 2 show_debug_message("Dialogue exceeds max height!")

return newtext
}