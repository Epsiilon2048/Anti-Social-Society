function sprite_get_direction(sprite){

var spr = sprite_get_name(sprite)

var out = string_pos_index("_", spr, 3)
if out == 0 out = string_length(spr)+1

return slice(spr, string_pos_index("_", spr, 2)+1, out, 1)
}