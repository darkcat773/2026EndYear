if (isPressed) {
	sprite_index = sRussoButtonPushed
}
if place_meeting(x, y, oPlayer) {
	if (!isPressed){
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