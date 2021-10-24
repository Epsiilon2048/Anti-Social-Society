function sprite_get_type(sprite){

var spr = sprite_get_name(sprite)

var in = string_pos_index("_", spr, 3)
if in == 0 return ""

return slice(spr, in+1, string_length(spr)+1, 1)
}