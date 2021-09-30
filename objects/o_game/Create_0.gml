
#macro tile_collision layer_tilemap_get_id("Collision")
#macro tile_width tilemap_get_tile_width(tile_collision)
#macro window_scale window_get_width()/320

var scale = 1 + (display_get_height() >= 480) + (display_get_height() >= 720) + (display_get_height() >= 1920)

var width = 320*scale
var height = 240*scale
window_resize(scale)
window_set_position(display_get_width()/2-width/2, display_get_height()/2-height/2)
game_set_speed(30, gamespeed_fps)

rudy = new Character("rudy")
spooky = new Character("spooky")
kelly = new Character("kelly")
toxy = new Character("toxy")

draw_interactive_boxes = true