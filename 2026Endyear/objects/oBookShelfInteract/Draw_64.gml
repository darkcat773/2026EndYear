if(isNear){
	drawInteract();
	if (keyboard_check_pressed(vk_enter)){
		isShowing = !isShowing;
	}
	if(isShowing == true){
		bookSortOpen();
	}
}


drawInteract = function(){
	var gui_width = display_get_gui_width();
	draw_set_font(pixelfont);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text_transformed(12, 120, "[Enter]", 3, 3, 0);
}

bookSortOpen = function(){
	var scaleX = 256*3/sprite_get_width(sBookShelfZoomed);
	var scaleY = (240*3-180)/sprite_get_height(sBookShelfZoomed);
	draw_sprite_ext(sBookShelfZoomed, 0,0, 180, scaleX,scaleY,0,c_white,1.0 );
}
