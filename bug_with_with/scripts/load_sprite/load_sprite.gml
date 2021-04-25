///@arg name
///@arg filename
///@arg [force_load(false)]
///@arg [strip(0)]
///@arg [xoffset]
///@arg [yoffset]
function load_sprite() {
	// load_sprite();
	if(argument_count < 2) return spr_error;
	var force_load = false;
	if(argument_count > 2) force_load = argument[2];
	//-- Количество кадров, на которое нужно порезать спрайт
	var v_strip = 1;
	if(argument_count > 3)&&(argument[3]>1) v_strip = argument[3];

	var name = argument[0];
	var filename = argument[1];
	var spr = -1;
	//-- Если загружать не обязательно, проверяем уже загружен этот спрайт или нет
	if(!force_load) {
		if(variable_global_exists(name)) {
			if(variable_global_get(name) != undefined) {
				if(sprite_exists(variable_global_get(name))) {
					spr = variable_global_get(name);
				}
			}
		}
	}
	//-- Если спрайт не нашло, создаем новый
	if(!sprite_exists(spr)) spr = sprite_add(filename,v_strip,false,false,0,0);
	var count = 0;
	while(!sprite_exists(spr)) {
		gm_sleep(300);	
		spr = sprite_add(filename,0,false,false,0,0);
		count++;
		if(count == 5) { // к-во попыток
			spr = sprite_duplicate(spr_error);
			sd("Error loading sprite: "+filename);
		}
	}

	var xoffset = sprite_get_width(spr)/2;
	var yoffset = sprite_get_height(spr)/2;
	if(argument_count > 5) {
		xoffset = argument[3];
		yoffset = argument[4];
	}
	sprite_set_offset(spr,xoffset,yoffset);
	variable_global_set(name,spr);
	ds_queue_enqueue(global.loaded_sprites,name,spr); // вытаскивать только попарно
	return spr;


}
