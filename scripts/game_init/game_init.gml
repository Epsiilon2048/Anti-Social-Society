
global.scale = 1 + (display_get_height() >= 480) + (display_get_height() >= 720)*2 + (display_get_height() >= 1920)

var width = 320*global.scale
var height = 240*global.scale
window_resize(global.scale)
window_set_position(display_get_width()/2-width/2, display_get_height()/2-height/2)
game_set_speed(30, gamespeed_fps)