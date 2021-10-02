
if not is_undefined(o_game.master_state) and variable_struct_exists(states, o_game.master_state)
{
	state = states[$ o_game.master_state]
}

state()

depth = -y