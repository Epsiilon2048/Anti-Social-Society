
function window_fullscreen(){
	
var f = not window_get_fullscreen()
if f
{
	var scale = display_get_height()/240
	
	var width = 320*scale
	var height = 240*scale
	
	surface_resize(application_surface, width, height)
	display_set_gui_size(width, height)
}
else
{
	window_resize(global.scale)
}

window_set_fullscreen(f)
}

 

function window_resize(scale){

var width = 320*scale
var height = 240*scale

window_set_size(width, height)
surface_resize(application_surface, width, height)
display_set_gui_size(width, height)

global.scale = scale
}