if(isNear){
	if (keyboard_check_pressed(vk_enter)){
		isShowing = !isShowing;
	}
}








if(isShowing){
	var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();
	
	var scaleX = 256*3/sprite_get_width(sOpenMissingBook);
	var scaleY = (240*3-180)/sprite_get_height(sOpenMissingBook);
	//draw_set_color(c_aqua);
	//draw_set_alpha(1.0); // Reset alpha back to solid
	//draw_rectangle(120, 120, _gui_w - 120, _gui_h - 120, false);
	draw_sprite_ext(sOpenMissingBook, 0,0, 180, scaleX,scaleY,0,c_white,1.0 );

	scoreHandling();
	switch(currentLevel) {
        case 1:
            level1();
            break;
        case 2:
            level2();
            break;
	}

	
	
}

level1 = function(){
	draw_sprite_ext(sSun, 0,102,290, 2.3,2.3,0,c_white, 1.0);
	draw_set_font(pixelfont);
	draw_set_colour(c_black);
	draw_text(69,513, "You brighten up others'");
	draw_text(100,580, "day like the ___");
	var constant =0;
	var constant2 = 0;
	answers = ["sun", "cloud", "rain", "pain", "sweet", "glass", "long", "tongue"];
	answerOptionsText(answers);
	checkAnswer(0, answers);
}
level2 = function(){
	draw_sprite_ext(sSun, 0,102,290, 2.3,2.3,0,c_white, 1.0);
	draw_set_font(pixelfont);
	draw_set_colour(c_black);
	draw_text(69,513, "You brighten up others'");
	draw_text(100,580, "day like the ___");
	var constant =0;
	var constant2 = 0;
	answers = ["ryan", "ryan", "ryan", "pain", "nanami", "nanami", "long", "tongue"];
	answerOptionsText(answers);
	checkAnswer(0, answers);
}


scoreHandling = function(){
	draw_text_transformed(500, 120, $"{correct}/8", 3,3,0);
}
answerOptionsText = function(answers){
	for (var i=0; i<array_length(answers);i++){
		if (i<4){
			constant = 87*i;
			draw_text(440, 339+constant, answers[i]);
			
		}
		else{
			constant2 = 87*(i-4);
			draw_text(580, 339+constant2, answers[i]);
		}
		
	}
}

checkAnswer = function(index, answers) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	var hovering = false;
	var text_w = 65;
	var text_h =28;
	for (var i = 0; i < array_length(answers); i++) {
		var text_x = 0;
		var text_y = 0;
		if(i<4){
			text_x = 430;
			text_y = 320 + (87 * i);
		}else{
			text_x = 570;
			text_y = 320 + (87 * (i - 4));
		}
		//box to show where mouse is touching:
		// draw_set_colour(c_aqua);
		// draw_rectangle(text_x, text_y, text_x+text_w,text_y+text_h,true);
		if (mx >= text_x && mx <= text_x + text_w && my >= text_y && my <= text_y + text_h) {
			hovering = true;
        if (mouse_check_button_pressed(mb_left)) {
            show_debug_message("You clicked on: " + answers[i]);
            if (answers[i] == answerKey[index]) {
				correct ++;
				currentLevel++;
				scoreHandling();
            }
        }
    }
	}
	
	if (hovering){
		window_set_cursor(cr_handpoint);
	} else{
		window_set_cursor(cr_default);
	}
	
}