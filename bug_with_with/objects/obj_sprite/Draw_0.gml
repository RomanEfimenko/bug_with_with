if sprite_exists(spr_loaded) draw_sprite(spr_loaded,0,x,y);
//-- Log
if(count_step_for_create<10) {
	sd("count_step_for_create: ",count_step_for_create)
	count_step_for_create++;
}