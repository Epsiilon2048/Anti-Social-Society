
function Character(name) constructor{

var pre = "s_"+name+"_"

front = asset_get_index(pre+"front")
back = asset_get_index(pre+"back")
left = asset_get_index(pre+"left")
right = asset_get_index(pre+"right")
front_walk = asset_get_index(pre+"front_walk")
back_walk = asset_get_index(pre+"back_walk")
left_walk = asset_get_index(pre+"left_walk")
right_walk = asset_get_index(pre+"right_walk")

if front == -1
{
	if back != -1 front = back
	else if left != -1 front = left
	else if right != -1 front = right
	else front = s_chara_front
}

if back == -1		back = front
if left == -1		left = front
if right == -1		right = front
if front_walk == -1	front_walk = front
if back_walk == -1	back_walk = back
if left_walk == -1	left_walk = left
if right_walk == -1	right_walk = right

walk_anim_speed = sprite_get_speed(front_walk)

talk = asset_get_index(pre+"talk")
voice = asset_get_index("snd_"+name+"_voice")
if voice == -1 voice = snd_text
}