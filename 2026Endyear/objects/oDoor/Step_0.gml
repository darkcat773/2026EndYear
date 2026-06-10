// 1. Check for warp trigger (Runs if the door is unlocked)
if (place_meeting(x, y, oPlayer) && !instance_exists(oWarp) && !locked) {
	var instance = instance_create_depth(0, 0, -12000, oWarp);
	instance.targetX = targetX;
	instance.targetY = targetY;
	instance.target_room = target_room;
	instance.target_face = target_face;
}


locked = conditional;

// Reset text trigger flag when walking away from the door
if (distance_to_object(oPlayer) > 10) {
	hasTriggered = false;
}

// 3. Handle Locked Door Warning Text
if (locked && distance_to_object(oPlayer) < 5 && !oBlackBox.isDialogue && !hasTriggered) {
	hasTriggered = true;
	
	with (oBlackBox) {
		isDialogue = true;
		dialogueText = other.msg; // FIXED: Added 'other.' so it grabs the array from this door!
		dialoguePage = 0;
		textProgress = 0;
		currentText = "";
	}
}