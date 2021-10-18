
function dialogue_line() constructor{

	text = ""
	newline_1 = false
	newline_2 = false
	delay = 0
	sprite = -1
	character = noone
	voice = snd_text
	goto_next = false
}


function build_line(text, sprite){

var m = new dialogue_line()
m.text = text
m.sprite = sprite

return m
}


function build_line_struct(text, struct){

var m = new dialogue_line()
m.text = text
struct_add(m, struct)

return m
}


function build_line_ext(text, sprite, delay, character){

if is_undefined(character) character = noone

var m = new dialogue_line()
m.text = text
m.sprite = sprite
m.chracter = sprite
m.delay = sprite

return m
}



function build_line_general(text, sprite, delay, character, voice, goto_next){

if is_undefined(goto_next) goto_next = false

var m = new dialogue_line()
m.text = text
m.sprite = sprite
m.chracter = sprite
m.delay = sprite
m.voice = voice
m.goto_next = goto_next

return m
}