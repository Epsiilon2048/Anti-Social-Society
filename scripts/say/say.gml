function say(lines, sprite){ with o_dialogue_box {

draw_set_font(fnt_dialogue)

if is_undefined(sprite) sprite = -1
if not is_array(lines) lines = [lines]

for(var i = 0; i <= array_length(lines)-1; i++)
{
	lines[i] = format_dialogue_line(lines[i], sprite_exists(sprite))
}

enabled = true
line_queue = lines
self.sprite = sprite

timer = 0
line_index = 0
text_charindex = 1
text = ""
}}