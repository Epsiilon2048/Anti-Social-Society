
function sprite_same_direction(chara, current_sprite, new_sprite_type){

var dir = sprite_get_direction(current_sprite)

if new_sprite_type != "" new_sprite_type = "_"+new_sprite_type

return chara[$ dir+new_sprite_type]
}