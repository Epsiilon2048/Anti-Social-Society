
function Button(key1, key2, gp1, gp2) constructor{

self.key1 = key1
self.key2 = key2
self.key3 = -1
self.gp1 = gp1
self.gp2 = gp2
self.gp3 = -1

__check = function(keyfunc, gpfunc){
	return not console_typing and (
		keyfunc(key1) or
		keyfunc(key2) or
		keyfunc(key3)
	)
}

pressed = function(){
	return __check(keyboard_check_pressed, gamepad_button_check_pressed)
}

held = function(){
	return __check(keyboard_check, gamepad_button_check)
}

released = function(){
	return __check(keyboard_check_released, gamepad_button_check_released)
}
}