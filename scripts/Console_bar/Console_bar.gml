
function console_bar_inputs(){ with o_console {

if BAR.docked and not BAR.run_in_dock
{
	if BAR.dock.enabled return undefined
	
	with BAR
	{
		docked = false
		x = undefined
		y = undefined
		width = undefined
	}
}
else if BAR.run_in_dock BAR.docked = true

var old_font = draw_get_font()
draw_set_font(o_console.font)

var cw = string_width(" ")
var ch = string_height(" ")
var asp = ch/BAR.char_height

var _win_dist		= floor(BAR.win_dist*asp)
var _height			= ceil(BAR.height*asp)
var _text_dist		= ceil(BAR.text_dist*asp)
var _sep			= ceil(BAR.sep*asp)
var _sidebar_width	= max(1, floor(BAR.sidebar_width*asp))

var sidetext_width = string_length(BAR.sidetext_string)*cw

var _x = is_undefined(BAR.x) ? _win_dist : BAR.x
var _y = is_undefined(BAR.y) ? (gui_height - _win_dist - ch - _height) : BAR.y
var _width

if BAR.docked _width = is_undefined(BAR.width) ? round(BAR.docked_width*asp) : BAR.width
else _width = is_undefined(BAR.width) ? (gui_width - _x - _win_dist) : BAR.width


if BAR.docked BAR.enabled = BAR.dock.show
else
{
	if keyboard_check_pressed(console_key) and keyboard_scope == noone
	{
		BAR.enabled = not BAR.enabled
	
		if BAR.enabled
		{
			keyboard_string = ""
			BAR.text_box.scoped = true
			o_console.keyboard_scope = BAR.text_box
		}
	}

	if keyboard_check_pressed(vk_escape) 
	{
		BAR.enabled = false
		BAR.text_box.scoped = false
		o_console.keyboard_scope = noone
	}
}

if BAR.enabled and keyboard_scope == BAR.text_box
{
	enter		= keyboard_check_pressed(vk_enter)
	log_up		= keyboard_check_pressed(vk_up)
	log_down	= keyboard_check_pressed(vk_down)
	
	if log_up and ds_list_size(input_log)
	{
		if input_log_index == -1 input_log_save = console_string
		input_log_index = min(input_log_index+1, ds_list_size(input_log)-1)
		console_string = input_log[| input_log_index]
	}
	else if log_down
	{
		if input_log_index == 0
		{
			input_log_index = -1
			console_string = input_log_save
			input_log_save = ""
		}
		else if input_log_index != -1
		{
			input_log_index --
			console_string = input_log[| input_log_index]
		}
	}
	
	if log_up or log_down
	{
		BAR.text_box.blink_step = 0
		BAR.text_box.char_pos1 = string_length(console_string)
		BAR.text_box.char_pos2 = BAR.text_box.char_pos1
		BAR.text_box.char_pos_selection = false
	}
	
	#region Parse command
	if enter
	{	
		var _compile = gmcl_compile(console_string)
		var _output  = gmcl_run(_compile)
		
		if is_struct(_compile)
		{
			prev_command = console_string
			prev_compile = _compile
			
			output_set_lines(_output)
			
			input_log_index = -1
			ds_list_insert(input_log, 0, console_string)
			if ds_list_size(input_log) > input_log_limit ds_list_delete(input_log, input_log_limit-1)
			
			console_log_input(console_string, _output, false)
		}
		else output_set_lines(_output)
		
		BAR.text_box.blink_step = 0
		keyboard_string = ""
		console_string = ""
	}
	#endregion
}
else BAR.blink_step = 0

if not is_undefined(object) and instance_exists(object) 
{
	if is_struct(object) BAR.sidetext_string = variable_struct_exists_get(object, "name", variable_struct_exists_get(object, "id", instanceof(object)))
	else BAR.sidetext_string = (object == global) ? "global" : object_get_name( object.object_index )
}
else BAR.sidetext_string = "noone"

BAR.left	= _x+_sidebar_width
BAR.top		= _y
BAR.right	= _x+_width
BAR.bottom	= _y+ch+_height

BAR.bar_right = BAR.right-sidetext_width-_text_dist*2-_sep-1
BAR.sidetext_left = BAR.right-sidetext_width-_text_dist*2-1

BAR.text_x = BAR.left+_text_dist
BAR.text_y = ceil(BAR.top+_text_dist/2)

var mouse_on_prev = BAR.mouse_on
BAR.mouse_on = gui_mouse_between(BAR.left, BAR.top, BAR.right, BAR.bottom)

with BAR
{
	text_box.enabled = enabled
	text_box.cbox_left = left
	text_box.cbox_top = top
	text_box.cbox_right = bar_right
	text_box.cbox_bottom = bottom
	text_box.att.length_min = (bar_right - text_x)/cw
	text_box.att.length_max = text_box.att.length_min
	text_box.x = text_x
	text_box.y = text_y
	text_box.get_input()
}

if BAR.docked and keyboard_check_pressed(console_key) and keyboard_scope == noone
{
	BAR.dock.show = true
	BAR.dock.is_front = true
	BAR.text_box.scoped = true
	keyboard_scope = BAR.text_box

	clicking_on_console = true
	keyboard_string = ""
}
	
if BAR.text_box.text_changed and input_log_index != -1
{
	input_log_index = -1
	input_log_save = ""
}

draw_set_font(old_font)
}}



function draw_console_bar(){ with o_console {

if not BAR.enabled return undefined
if BAR.docked and not BAR.run_in_dock and BAR.dock.enabled return undefined

var old_color = draw_get_color()
var old_font = draw_get_font()
var old_halign = draw_get_halign()
var old_valign = draw_get_valign()

draw_set_font(font)

var cw = string_width(" ")
var ch = string_height(" ")
var asp = ch/BAR.char_height

var _text_dist		= ceil(BAR.text_dist*asp)
var _sidebar_width	= max(1, floor(BAR.sidebar_width*asp))

var draw_dock_body
if BAR.docked
{
	if BAR.dock.is_front
	{
		draw_dock_body = draw_rectangle
		draw_set_color(BAR.colors.body_real)
	}
	else draw_dock_body = noscript
}
else draw_dock_body = draw_console_body

draw_dock_body(BAR.left, BAR.top, BAR.bar_right, BAR.bottom, false)	// Draw bar
draw_dock_body(BAR.sidetext_left, BAR.top, BAR.right, BAR.bottom, false)		// Draw sidetext bar

if BAR.docked
{
	var _outline_width = round(BAR.outline_width*asp)
	
	draw_set_color(BAR.colors.body_accent)
	draw_hollowrect(BAR.left, BAR.top, BAR.bar_right, BAR.bottom, _outline_width)
	draw_hollowrect(BAR.sidetext_left, BAR.top, BAR.right, BAR.bottom, _outline_width)
}

draw_set_color(colors.output)
draw_rectangle(BAR.left-_sidebar_width, BAR.top, BAR.left, BAR.bottom, false)					// Draw sidebar







BAR.text_box.draw()

draw_set_color(colors.output)
draw_set_halign(fa_right)
draw_set_valign(fa_top)
draw_text(BAR.right-_text_dist, BAR.text_box.y+1, BAR.sidetext_string)							// Draw sidetext

draw_set_color(old_color)
draw_set_font(old_font)
draw_set_halign(old_halign)
draw_set_valign(old_valign)
}}