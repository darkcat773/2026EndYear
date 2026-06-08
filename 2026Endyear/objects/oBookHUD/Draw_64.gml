if(isShowing){
	var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();
	
	var scaleX = 256*3/sprite_get_width(sOpenMissingBook);
	var scaleY = (240*3-180)/sprite_get_height(sOpenMissingBook);
	//draw_set_color(c_aqua);
	//draw_set_alpha(1.0); // Reset alpha back to solid
	//draw_rectangle(120, 120, _gui_w - 120, _gui_h - 120, false);
	draw_sprite_ext(sOpenMissingBook, 0,0, 180, scaleX,scaleY,0,c_white,1.0 );
	correct = 0;
	level1();
	
}

level1 = function(){
	draw_sprite_ext(sSun, 0,102,290, 2.3,2.3,0,c_white, 1.0);
	draw_set_font(pixelfont);
	draw_set_colour(c_black);
	draw_text(69,513, "You brighten up others'");
	draw_text(100,580, "day like the ___");
	
	draw_text(440,339,"sun");//DIFF: y 87
	draw_text(440,426,"cloud"); 
	draw_text(440,513,"rain");
	draw_text(440,600,"pain");
	draw_text(580,339,"sweet");
	draw_text(580,426,"glass"); 
	draw_text(580,513,"long");
	draw_text(580,600,"tong"); 
	
	
}
level2 = function(){
}