
function window_resize(scale){

var width = 320*scale
var height = 240*scale

window_set_size(width, height)
surface_resize(application_surface, width, height)
display_set_gui_size(width, height)
}