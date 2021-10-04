
#macro dialogue_line_length 29
#macro dialogue_line_sprite_length 31
#macro alpha_char_width 8

if instance_number(self) > 1 {instance_destroy() exit}

enabled = false
enabled_last = false

CHARS_PER_STEP = 2
CHAR_SPEED_STEPS = 1

text = ""
text_index = 0
text_charindex = 1

line_queue = []
line_index = 0

box_finished = false

sprite = -1

button_next = false
button_charspeed = false
button_skip = false