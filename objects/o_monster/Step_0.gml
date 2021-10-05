
voice = chara.voice
sprite = chara.talk

if o_dialogue_box.monster_talking == id
{
	states.talk()
}
else if not is_undefined(o_game.master_state) and variable_struct_exists(states, o_game.master_state)
{
	states[$ o_game.master_state]()
}
else 
{
	state()
}

depth = -y