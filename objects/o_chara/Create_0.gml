
if instance_number(self) > 1 {instance_destroy() exit}

chara = global.characters.chara

SPD = 2
spd = SPD

FRAME_STEPS = 7
frame_counter = 0
image_speed = 0

ip_x = 0
ip_y = 0

walking = false

draw_bbox = false
draw_interaction_point = false

button_interact = false
button_left = false
button_up = false
button_right = false
button_down = false

moved = false

init = true

o_camera.x = x
o_camera.y = y-sprite_get_height(chara.front)/2