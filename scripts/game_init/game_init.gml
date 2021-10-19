
var scale = 1 + (display_get_height() >= 480) + (display_get_height() >= 720)*2 + (display_get_height() >= 1920)

var width = 320*scale
var height = 240*scale
window_resize(scale)
window_set_position(display_get_width()/2-width/2, display_get_height()/2-height/2)
game_set_speed(30, gamespeed_fps)