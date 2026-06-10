if(isNear){
	if (keyboard_check_pressed(vk_enter)){
		isShowing = !isShowing;
		selectedBooks = [];
	}
	if(isShowing == true){
		//main
		bookSortOpen();
		drawZoom();
		
		if (wrongTimer > 0) {
			drawWrong();
		}
		if(drawCorrectBool){
			drawCorrect();
		}
	
	}
}


bookSortOpen = function(){
	var scaleX = 256*3/sprite_get_width(sBookShelfZoomed);
	var scaleY = (240*3-180)/sprite_get_height(sBookShelfZoomed);
	draw_sprite_ext(sBookShelfZoomed, 0,0, 180, scaleX,scaleY,0,c_white,1.0 );
	
	var base_x = 150;
	var base_y = 343;
	var constant = 20;
	var scale = 1.8;
	
	
	var current_x = base_x;
	
	for(var i=0; i<array_length(sBooks); i++){
		draw_sprite_ext(sBooks[i], 0,current_x,base_y,scale,scale,0,c_white,1.0);
		book_positions[i] = current_x;
		var bookwidth = ceil(sprite_get_width(sBookBlue)*scale);
		current_x += bookwidth + constant;
	}	
	bookCount = 6;
	if (keyboard_check_pressed(vk_right)) {
		book_index++;
		if (book_index >= bookCount) book_index = 0; // goes to start
	}
	if (keyboard_check_pressed(vk_left)) {
		book_index--;
		if (book_index < 0) book_index = bookCount - 1; //goes to end
	}
	
	draw_sprite_ext(sPointer,0,book_positions[book_index], 363,1,1,0,c_white,1.0);

	
}


drawZoom = function(){
	base_x= 100;
	constant = 100;
	for(var i =0; i<array_length(selectedBooks); i++){
		draw_sprite_ext(selectedBooks[i],0,(base_x+constant*i),665,3,3,0,c_white,1.0);
	}
}

drawCorrect = function(){
	draw_set_colour(c_green);
	draw_rectangle(150,400,600,600,false);
	draw_set_colour(c_white);
	draw_text_transformed(270, 500, "Correct!",2,2,0);
	
}

drawWrong = function(){
	show_debug_message("Draw rectangle");
	draw_set_colour(c_red);
	draw_rectangle(150,400,600,600,false);
	draw_set_colour(c_white);
	draw_text_transformed(320, 500, "Wrong",2,2,0);
}
