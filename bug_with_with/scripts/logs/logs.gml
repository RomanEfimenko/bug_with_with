function sd() {
	// sd()
	var v_show_obj_name = true
	var v_v_str = ""
	for(var i = 0; i < argument_count; i++) {
		v_v_str = v_v_str + string(argument[i])
	}
	try {
		if(v_show_obj_name) {
			v_v_str = string(object_get_name(object_index)) + ": " + v_v_str
		}
	} catch(e) {}
	show_debug_message(v_v_str)
}

function sdb() {
	// sdb()
	/*	Тот же sd, только его можно прямо тут в скрипте функционально включать/выключать */
	var vv_sdb_on = true
	if(vv_sdb_on) {
		for(var i = 0; i < argument_count; i++) {
			show_debug_message(string(argument[i]));
		}
	}
}