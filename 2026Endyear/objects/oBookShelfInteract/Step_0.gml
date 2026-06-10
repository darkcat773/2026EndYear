if (isShowing){
	if (!instance_exists(oPause)) {
       pause_id = instance_create_layer(0, 0, "Instances", oPause);
	}
	bookSelection();
	if(submitted){
		checkAnswer();
		submitted=false;
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
			show_debug_message(string(sBooks[book_index]) + " has been addeduauaua");
			var length = array_length(selectedBooks);
			var length2 = array_length(sBooks);
			show_debug_message(string(length) + " is selectedBooks, "+ string(length2)+ " is sBooks");
		}	
		
		if(array_length(selectedBooks) ==6){
			submitted = true;
			show_debug_message("List has been submitted")
		}
	}
}

checkAnswer = function(){
	isCorrect= true;
	var length = array_length(selectedBooks);
	var length2 = array_length(sBooks);
	show_debug_message($"{length} is selectedBooks, {length2} is sBooks");
	for(var i=0; i<array_length(selectedBooks);i++){
		if(string(selectedBooks[i]) != string(answerKey[i])){
			isCorrect = false;
			break;
		}
	}
	
	if(isCorrect){
		show_debug_message("Correct");
		//drawCorrectBool = true;
		soundManager.key = true;
		dropKey();
	} else{
		wrongTimer = 60;
		show_debug_message("Wrong!!");
		selectedBooks = [];
	}
}if (wrongTimer > 0) {
    wrongTimer--;
}


dropKey = function(){
	
}