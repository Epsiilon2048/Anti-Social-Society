
#macro tile_collision layer_tilemap_get_id("Collision")
#macro tile_width tilemap_get_tile_width(tile_collision)
#macro window_scale window_get_width()/320

if instance_number(self) > 1 {instance_destroy() exit}

draw_interactive_boxes = true

master_state = undefined

last_room = room_init
room_goto(room_start)

chara_warned = false