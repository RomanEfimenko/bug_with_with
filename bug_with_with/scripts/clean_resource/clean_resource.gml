function clean_resource() {
	// clean_resource();
	while(!ds_queue_empty(global.loaded_sprites)) {
		var name = ds_queue_dequeue(global.loaded_sprites);
		var spr = ds_queue_dequeue(global.loaded_sprites);
		sd("spr_name: "+string(name)+", number: "+string(spr));
		variable_global_set(name,-1);
		if(sprite_exists(spr))sprite_delete(spr);
	}
}
