
if instance_number(self) > 1 {instance_destroy() exit}

use		= new Button(vk_enter,		ord("Z"),	gp_face1,	gp_face3)
skip	= new Button(vk_shift,		ord("X"),	gp_face2,	gp_face4)
menu	= new Button(vk_control,	ord("C"),	gp_start,	gp_select)
up		= new Button(vk_up,			ord("W"),	gp_padu,	-1)
down	= new Button(vk_down,		ord("S"),	gp_padd,	-1)
left	= new Button(vk_left,		ord("A"),	gp_padl,	-1)
right	= new Button(vk_right,		ord("D"),	gp_padr,	-1)