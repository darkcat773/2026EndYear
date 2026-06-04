if (!isDialogue) {
	// Only allow opening inventory if NOT in a dialogue
	if (keyboard_check_pressed(ord("X"))) {
		isInventory = !isInventory;
	}
	
} else {
	//dialogue
	
	// freeze player
	if (!instance_exists(oPause)) {
		instance_create_depth(0, 0, -12000, oPause);
	}
	
	// typewriter effect
	if (textProgress < string_length(dialogueText)) {
		textProgress += 1;
		currentText = string_copy(dialogueText, 1, floor(textProgress));
	}
	
	// skip
	if (keyboard_check_pressed(vk_enter)) {
		if (textProgress < string_length(dialogueText)) {
			textProgress = string_length(dialogueText);
			currentText = dialogueText;
		} else {

			if (instance_exists(oPause)) {
				instance_destroy(oPause);
			}
			isDialogue = false;
			dialogueText = "";
			currentText = "";
			textProgress = 0;
		}
	}
}
