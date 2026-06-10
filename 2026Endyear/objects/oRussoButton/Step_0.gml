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
		    dialogueText = "...Sounds like a door just opened up.";
		    textProgress = 0; 
		    currentText = "";
		}
}
}
