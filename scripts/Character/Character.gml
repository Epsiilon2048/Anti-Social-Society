
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

if is_undefined(front)		front = s_rudy_front
if is_undefined(back)		back = front
if is_undefined(left)		left = front
if is_undefined(right)		right = front
if is_undefined(front_walk)	front_walk = front
if is_undefined(back_walk)	back_walk = back
if is_undefined(left_walk)	left_walk = left
if is_undefined(right_walk)	right_walk = right
}