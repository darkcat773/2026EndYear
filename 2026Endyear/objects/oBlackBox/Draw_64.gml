var gui_width = display_get_gui_width();
draw_set_color(c_black);
draw_rectangle(0, 0, gui_width, 180, false);

draw_set_font(pixelfont);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);


if (!isDialogue) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);

	

	if (isInventory) {
		// adjusted abox
    var abox_x = gui_width - 160 * 3;
    var abox_y = 26 * 3;
    var abox_w = 70 * 3;
    var abox_h = 30 * 3; 
    draw_rectangle(abox_x, abox_y, abox_x + abox_w, abox_y + abox_h, true);
    
    // header

    draw_text_transformed(abox_x + 15, abox_y -20, "INV.", 2, 2, 0);
    
    // both slots
    for (var i = 0; i < 2; i++) {
        var item_name = (oPlayer.inv[i] == noone) ? "Empty" : oPlayer.inv[i];
        var text_y_pos = abox_y + 32 + (i * 32);
        
        if (invSelect == i) {
            // indicator
			if ((current_time div 400) % 2 == 0) {
			draw_text_transformed(abox_x + 15, text_y_pos, "> " + item_name, 1.5, 1.5, 0);
		}
        } else {
            draw_text_transformed(abox_x + 35, text_y_pos, item_name, 1.5, 1.5, 0);
        }
    }
	} else {
		var abox_x = gui_width - 160 * 3;
		var abox_y = 26 * 3;
		var abox_w = 20 * 3;
		var abox_h = 30 * 3;
		draw_rectangle(abox_x, abox_y, abox_x + abox_w, abox_y + abox_h, true);
		draw_text_transformed(gui_width - 154 * 3, 58, "Z", 2, 2, 0);

		var bbox_x = gui_width - 135 * 3;
		var bbox_y = 26 * 3;
		var bbox_w = 30 * 3;
		var bbox_h = 30 * 3;
		draw_rectangle(bbox_x, bbox_y, bbox_x + bbox_w, bbox_y + bbox_h, true);
		draw_text_transformed(gui_width - 124 * 3, 58, "X", 2, 2, 0);
		draw_text_transformed(gui_width - 133 * 3, 120, "Inv.", 2, 2, 0);
	}

	if (instance_exists(oPlayer)) {
		var player_hp = oPlayer.hp;
		var player_maxhp = oPlayer.max_hp;
		var start_x = gui_width - 200;
		var start_y = 12;
		var spacing = 60;
		
		for (var i = 0; i < player_maxhp; i++) {
			var index_image = (i < player_hp) ? 0 : 1;
			draw_sprite_ext(sHudHeart, index_image, start_x + (i * spacing), start_y, 3, 3, 0, c_white, 1);
		}
		
		var room_name = room_get_name(room);
		draw_text_transformed(24,40,room_name,2,2,0);
	}
	
} else {
	// dialogue rendering
	draw_set_halign(fa_left);
	draw_set_valign(fa_top); // 
	
	var text_x = 30;
	var text_y = 25;
	var line_sep = 20; // Pixels between lines of text
	
	// We divide the max width by our text scale (2) so it wraps accurately
	var max_width = (gui_width - 60) / 2; 
	
	// Draw the typewriter text
	draw_text_ext_transformed(text_x, text_y, currentText, line_sep, max_width, 2, 2, 0);
	
	if (textProgress >= string_length(dialogueText)) {
		//blinker
		if ((current_time div 400) % 2 == 0) {
			draw_text_transformed(gui_width - 40, 130, "v", 2, 2, 0);
		}
	}
}

drawInteract = function(){
	var gui_width = display_get_gui_width();
	draw_set_font(pixelfont);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text_transformed(20, 120, "[Enter]", 2, 2, 0);
}

if(instance_exists(oBookHUD)){
	if(oBookHUD.isNear){
	drawInteract();
}
}
if instance_exists(oBookShelfInteract) {
	if(oBookShelfInteract.isNear){
	drawInteract();
}
}



