if(isNear){
	drawInteract();
	if (keyboard_check_pressed(vk_enter)){
		isShowing = !isShowing;
	}
	if(isShowing == true){
		//main
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
	
	var base_x = 150;
	var base_y = 343;
	var constant = 20;
	var scale = 1.8;
	
	var sBooks = [sBookOrange, sBookRed, sBookBeige, sBookBlue, sBookGreen,sBookHalfBeige];
	var current_x = base_x;
	
	for(var i=0; i<array_length(sBooks); i++){
		draw_sprite_ext(sBooks[i], 0,current_x,base_y,scale,scale,0,c_white,1.0);
		var bookwidth = ceil(sprite_get_width(sBookBlue)*scale);
		current_x += bookwidth + constant;
	}	
}
