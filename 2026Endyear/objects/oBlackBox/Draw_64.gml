var gui_width = display_get_gui_width();
draw_set_color(c_black);
draw_rectangle(0, 0, gui_width, 180, false);

draw_set_font(pixelfont);
draw_set_color(c_white);

if (!isDialogue) {
	if (isInventory) {
		// ==========================================
		// INVENTORY MENU RENDERING MODE
		// ==========================================
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		// Draw Menu Title Header
		draw_text_transformed(30, 20, "INVENTORY", 2, 2, 0);
		draw_line_width(30, 55, 200, 55, 2);
		
		var inv_list = oPlayer.inv;
		var start_y = 70;
		var item_spacing = 40;
		
		// Render Item Slots
		if (array_length(inv_list) == 0) {
			draw_text_transformed(50, start_y, "- EMPTY -", 2, 2, 0);
		} else {
			for (var i = 0; i < array_length(inv_list); i++) {
				var display_y = start_y + (i * item_spacing);
				// Draw an indicator arrow '>' if this index matches our current menu position
				if (i == invSelect) {
					if ((current_time div 400) % 2 == 0) {
						draw_text_transformed(30, display_y, ">", 2, 2, 0);
					}
				}
				
				draw_text_transformed(55, display_y, inv_list[i].name, 2, 2, 0);
			}
		}
		
		// Sidebar Pane: Render currently mapped Z equipment details
		draw_rectangle(gui_width - 240, 20, gui_width - 20, 160, true);
		draw_text_transformed(gui_width - 220, 35, "[WEAPON]", 2, 2, 0);
		
		if (oPlayer.equipZ != noone) {
			draw_text_transformed(gui_width - 220, 80, oPlayer.equipZ.name, 2, 2, 0);
		} else {
			draw_text_transformed(gui_width - 220, 80, "None", 2, 2, 0);
		}
		
	} else {
		// ==========================================
		// STANDARD OVERWORLD HUD MODE
		// ==========================================
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);

		var room_name = room_get_name(room);
		draw_text_transformed(12, 44, room_name, 3, 3, 0);

		// Dynamic Hotkey Action Box Displays
		var box_x = gui_width - 160 * 3;
		var box_y = 26 * 3;
		
		// Z Equipment Box Window
		draw_rectangle(box_x, box_y, box_x + 20 * 3, box_y + 30 * 3, true);
		draw_text_transformed(gui_width - 154 * 3, 44, "Z", 3, 3, 0);
		if (oPlayer.equipZ != noone) {
			// Tiny indicator text underneath showing your equipped item's name shorthand
			draw_text_transformed(gui_width - 160 * 3, 115, string_copy(oPlayer.equipZ.name, 1, 5), 1, 1, 0);
		}

		// X Menu Inventory Box Window
		var bbox_x = gui_width - 135 * 3;
		var bbox_y = 26 * 3;
		draw_rectangle(bbox_x, bbox_y, bbox_x + 30 * 3, bbox_y + 30 * 3, true);
		draw_text_transformed(gui_width - 128 * 3, 47, "X", 3, 3, 0);
		draw_text_transformed(gui_width - 133 * 3, 100, "Open \nInv.", 1, 1, 0);

		// Render Player Health Resource Bar
		if (instance_exists(oPlayer)) {
			var player_hp = oPlayer.hp;
			var player_maxhp = oPlayer.max_hp;
			var start_x = gui_width - 320;
			var start_y = 12;
			var spacing = 60;
			
			for (var i = 0; i < player_maxhp; i++) {
				var index_image = (i < player_hp) ? 0 : 1;
				draw_sprite_ext(sHudHeart, index_image, start_x + (i * spacing), start_y, 3, 3, 0, c_white, 1);
			}
		}
	}
	
} else {
	// ==========================================
	// DIALOGUE TEXT BOX MODE
	// ==========================================
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var text_x = 30;
	var text_y = 25;
	var line_sep = 20;
	var max_width = (gui_width - 60) / 2; 
	
	draw_text_ext_transformed(text_x, text_y, currentText, line_sep, max_width, 2, 2, 0);
	
	if (textProgress >= string_length(dialogueText)) {
		if ((current_time div 400) % 2 == 0) {
			draw_text_transformed(gui_width - 40, 130, "v", 2, 2, 0);
		}
	}
}