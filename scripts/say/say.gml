function say(lines, sprite, voice, monster){ with o_dialogue_box {

timer = 0
line_index = 0
text_charindex = 1
text = ""
dot_text = "*"
newlines = 0

if is_undefined(lines) return undefined

draw_set_font(fnt_dialogue)

if is_undefined(sprite) sprite = -1
if not is_array(lines) lines = [lines]

var has_content = false

for(var i = 0; i <= array_length(lines)-1; i++)
{
	lines[i] = format_dialogue_line(lines[i], sprite_exists(sprite))
	
	if lines[i].text != "" has_content = true
}

if not has_content return undefined

if is_undefined(voice) voice = snd_text
if is_undefined(monster) monster = noone

enabled = true
line_queue = lines
self.sprite = sprite
monster_talking = monster
self.voice = voice
}}