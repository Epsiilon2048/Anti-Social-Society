
#macro tile_collision layer_tilemap_get_id("Collision")
#macro tile_width tilemap_get_tile_width(tile_collision)

window_set_size(640, 480)
surface_resize(application_surface, 640, 480)
game_set_speed(30, gamespeed_fps)

rudy = new Character("rudy")
spooky = new Character("spooky")
kelly = new Character("kelly")