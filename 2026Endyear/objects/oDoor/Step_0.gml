if place_meeting(x, y, oPlayer) && !instance_exists(oWarp) && !locked {
	var instance = instance_create_depth(0, 0, -12000, oWarp)
	instance.targetX = targetX
	instance.targetY = targetY
	instance.target_room = target_room
	instance.target_face = target_face
}

locked = conditional;

if(distance_to_object(oPlayer) >10){
	hasTriggered = false;
}

locked = conditional;
if (locked && distance_to_object(oPlayer) < 5 && !isDialogue && !hasTriggered) {
    if (oBlackBox.isDialogue == false) { 
		hasTriggered = true;
        with (oBlackBox) {
            isDialogue = true;
            dialogueText = other.dialogueText;
            textProgress = 0; 
            currentText = "";
        }
    }
}

