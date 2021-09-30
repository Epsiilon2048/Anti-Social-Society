
#macro tile_collision layer_tilemap_get_id("Collision")
#macro tile_width tilemap_get_tile_width(tile_collision)
#macro window_scale window_get_width()/320

var width = 320*4
var height = 240*4

window_set_size(width, height)
surface_resize(application_surface, width, height)
display_set_gui_size(width, height)
game_set_speed(30, gamespeed_fps)

rudy = new Character("rudy")
spooky = new Character("spooky")
kelly = new Character("kelly")