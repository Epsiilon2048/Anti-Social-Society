
#macro tile_collision layer_tilemap_get_id("Collision")
#macro tile_width tilemap_get_tile_width(tile_collision)
#macro window_scale window_get_width()/320
#macro normal_framerate 30

if instance_number(self) > 1 {instance_destroy() exit}

var scale = 2 + (display_get_height() >= 480) + (display_get_height() >= 720) + (display_get_height() >= 1920)

var width = 320*scale
var height = 240*scale
window_resize(scale)
window_set_position(display_get_width()/2-width/2, display_get_height()/2-height/2)
game_set_speed(normal_framerate, gamespeed_fps)

chara = new Character("chara")
rudy = new Character("rudy")
spooky = new Character("spooky")
kelly = new Character("kelly")
toxy = new Character("toxy")
rem = new Character("rem")
marbles = new Character("marbles")
vink = new Character("vink")
seapunk = new Character("seapunk")
snurk = new Character("snurk")
ari = new Character("ari")

draw_interactive_boxes = true

master_state = undefined