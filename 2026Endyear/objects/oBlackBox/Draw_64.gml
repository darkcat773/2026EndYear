var gui_width = display_get_gui_width();
draw_set_color(c_black);
draw_rectangle(0, 0, gui_width, 180, false);

draw_set_font(pixelfont);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var room_name = room_get_name(room);
draw_text_transformed(12,44,room_name,3,3,0);

if(isInventory){
	var abox_x = gui_width-160*3;
	var abox_y = 26*3
	var abox_w = 70*3;
	var abox_h = 30*3;
	draw_rectangle(abox_x, abox_y, abox_x + abox_w, abox_y + abox_h, true)
	draw_text_transformed(gui_width-153*3,47,"INV.",2,2,0);
}
else{
	var abox_x = gui_width-160*3;
	var abox_y = 26*3
	var abox_w = 20*3;
	var abox_h = 30*3;
	draw_rectangle(abox_x, abox_y, abox_x + abox_w, abox_y + abox_h, true)
	draw_text_transformed(gui_width-154*3,44,"Z",3,3,0);

	var bbox_x = gui_width-135*3;
	var bbox_y = 26*3
	var bbox_w = 30*3;
	var bbox_h = 30*3;
	draw_rectangle(bbox_x, bbox_y, bbox_x + bbox_w, bbox_y + bbox_h, true)
	draw_text_transformed(gui_width-128*3,47,"X",3,3,0);
	draw_text_transformed(gui_width-133*3,100,"Open \nInv.",1,1,0);
	

}

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