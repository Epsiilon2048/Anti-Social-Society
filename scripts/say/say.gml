function say(lines, sprite){ with o_dialogue_box {

if is_undefined(sprite) sprite = -1
if not is_array(lines) lines = [[lines]]

for(var i = 0; i <= array_length(lines)-1; i++)
for(var j = 0; j <= array_length(lines[i])-1; j++)
{
	var cutoff = (sprite == -1) ? dialogue_line_length : dialogue_line_sprite_length
	
	if string_length(lines[i][j]) > cutoff
	{
		lines[i][j] = string_insert("\n", lines[i][j], string_char_next(" -", lines[i][j], cutoff, -1)+1)
	}
	
	lines[i][j] = "*  "+string_replace_all(string_replace_all(lines[i][j], " ", "  "), "\n", "\n  ")
}

enabled = true
line_queue = lines
self.sprite = sprite

line_index = 0
text_index = 0
text_charindex = 1
text = ""
}}