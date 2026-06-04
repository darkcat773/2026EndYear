if (isPressed) {
	sprite_index = sRussoButtonPushed
}
if place_meeting(x, y, oPlayer) {
	if (!isPressed){
	isPressed = true;
	global.redButtonPressed = true;
	}
}