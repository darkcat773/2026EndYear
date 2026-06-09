if (isShowing){
	if (!instance_exists(oPause)) {
       pause_id = instance_create_layer(0, 0, "Instances", oPause);
	}
	bookSelection();
	if(submitted){
		checkAnswer();
	}
	
}
if(not isShowing){
	if (instance_exists(pause_id)) {
        instance_destroy(pause_id);
        pause_id = noone; 
    }
}


bookSelection = function(){
	if(keyboard_check_pressed(ord("Z"))){
		show_debug_message("Z is pressed");
		if(not array_contains(selectedBooks,sBooks[book_index])){
			array_push(selectedBooks, sBooks[book_index]);
			show_debug_message($"{sBooks[book_index]} has been added");
		}	
		if(array_length(selectedBooks) ==6){
			submitted = true;
		}
	}
}

checkAnswer = function(){
	for(var i=0; i<array_length(selectedBooks);i++){
		if(not selectedBooks[i] == answerKey[i]){
			show_debug_message("Wrong");
		}
	}
}
