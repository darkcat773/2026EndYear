if(isNear){
	drawInteract();
}


drawInteract = function(){
	var gui_width = display_get_gui_width();
	draw_set_font(pixelfont);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text_transformed(12, 120, "[Enter]", 3, 3, 0);
}

