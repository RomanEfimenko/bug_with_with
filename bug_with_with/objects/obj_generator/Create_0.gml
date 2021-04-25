/// @description Генерирует obj_sprite
ins_arr = []
for(var i = 0; i < 3; i++) {
	ins_arr[i] = instance_create_depth(200+(300*i),400,0,obj_sprite);
	ins_arr[i].s_id = i+1;
}
with(obj_sprite)event_user(0);

instance_destroy()