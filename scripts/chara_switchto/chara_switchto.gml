function chara_switchto(new_chara){ with o_chara {

if is_string(new_chara) and not variable_struct_exists(global.characters, new_chara) return undefined

chara = is_string(new_chara) ? global.characters[$ new_chara] : new_chara
sprite_index = sprite_same_direction(chara, sprite_index, "")
}}