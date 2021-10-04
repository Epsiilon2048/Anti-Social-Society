
chara = global.characters.chara

SPD = 2

FRAME_STEPS = 5
frame_counter = 0
image_speed = 0

walking = false

draw_bbox = false

button_interact = false
button_left = false
button_up = false
button_right = false
button_down = false

moved = false

init = true

o_camera.x = x
o_camera.y = y-sprite_get_height(chara.front)/2