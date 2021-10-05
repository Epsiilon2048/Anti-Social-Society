
#macro dialogue_line_length 29
#macro dialogue_line_sprite_length 31
#macro alpha_char_width 8
#macro alpha_char_height 10

if instance_number(self) > 1 {instance_destroy() exit}

DELAY_TIMES = [0, 5, 10, 15, 20, 30, 40, 60, 90, 150]

enabled = false
enabled_last = false

sep = 9

char_delay = 0
timer = 0

text = ""
text_charindex = 1

line_queue = []
line_index = 0

box_finished = false

sprite = -1

button_next = false
button_charskip = false
button_skip = false