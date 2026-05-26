var _cam = view_camera[0];
var _gui_w = camera_get_view_width(_cam);
var _gui_h = camera_get_view_height(_cam);

display_set_gui_size(_gui_w, _gui_h);
var gui_width = display_get_gui_width();

draw_set_color(c_black);
draw_rectangle(0, 0, gui_width, 60, false);

draw_set_font(pixelfont);
draw_set_color(#f8f8f8);
draw_set_halign(fa_left);
draw_set_valign(fa_top); 

var room_name = room_get_name(room);

draw_text(8, 8, room_name);

if (instance_exists(oPlayer)){
	var player_hp = oPlayer.hp;
	var player_maxhp=oPlayer.max_hp;
	
	var start_x = gui_width - 100;
	var start_y = 6;
	var spacing = 18;
	
	for(var i =0; i<player_maxhp; i++){
		var index_image = (i<player_hp) ? 0:1;
		draw_sprite_ext(sHudHeart, index_image, start_x + (i*spacing), start_y, 1, 1, 0, c_white, 1);
		
	}
}