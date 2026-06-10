if (isPressed) {
	sprite_index = sRussoButtonPushed
}
if(!isPressed){
	if place_meeting(x, y, oPlayer) {
		soundManager.button = true;
		isPressed = true;
		global.redButtonPressed = true;
		with (oBlackBox) {
			isDialogue = true;
		    dialogueText = [
			"Seems like a door just opened up...",
			"Let's go check it out!"
			];
		    textProgress = 0; 
		    currentText = "";
		}
}
}
