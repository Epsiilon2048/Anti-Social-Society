
if instance_place(x, y, o_chara)
{
	if not chara_in
	{
		chara_in = true
		if room_exists(room_index) room_fadeto(room_index)
		func()
	}
}
else if chara_in chara_in = false