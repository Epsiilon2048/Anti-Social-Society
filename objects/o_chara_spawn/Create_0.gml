
if o_game.last_room == from_room
{
	instance_create_depth(x, y, 0, o_chara)
	o_game.last_room = room
	
}
instance_destroy()