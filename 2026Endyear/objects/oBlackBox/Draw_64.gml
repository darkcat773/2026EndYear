var gui_width = display_get_gui_width();
draw_set_color(c_black);
draw_rectangle(0, 0, gui_width, 180, false);

draw_set_font(pixelfont);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var room_name = room_get_name(room);
draw_text_transformed(12,45,room_name,3,3,0);

if (instance_exists(oPlayer)){
	var player_hp = oPlayer.hp;
	var player_maxhp=oPlayer.max_hp;
	
	var start_x = gui_width -320;
	var start_y = 12;
	var spacing = 60;
	
	for(var i =0; i<player_maxhp; i++){
		var index_image = (i<player_hp) ? 0:1;
		draw_sprite_ext(sHudHeart, index_image, start_x + (i*spacing), start_y, 3, 3, 0, c_white, 1);
		
	}
}