if(isShowing){
	var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();
	
	var scaleX = 256*3/sprite_get_width(sOpenMissingBook);
	var scaleY = (240*3-180)/sprite_get_height(sOpenMissingBook);
	//draw_set_color(c_aqua);
	//draw_set_alpha(1.0); // Reset alpha back to solid
	//draw_rectangle(120, 120, _gui_w - 120, _gui_h - 120, false);
	draw_sprite_ext(sOpenMissingBook, 0,0, 180, scaleX,scaleY,0,c_white,1.0 );
}