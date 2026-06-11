if (!yap) {
	yap = true;
	with (oBlackBox) {
    isDialogue = true;
    dialogueText = [
        "You died!!\nPress 'Enter' to retry..."
    ];
    dialoguePage = 0;
    textProgress = 0;
    currentText = "";
    }
}


if (keyboard_check_pressed(vk_enter)) {
    // 1. Reset your global game status variables back to default
    global.talkedToAisha = false;
    global.bookshelfSolved = false;
	global.bookPuzzleComplete = false;
	global.redButtonPressed = false;
	global.enteredBathroom = false;
	
    
    // 2. Clear out player inventory and reset life parameters
    if (instance_exists(oPlayer)) {
        oPlayer.inv[0] = noone;
        oPlayer.inv[1] = noone;
        oPlayer.hp = oPlayer.max_hp; // Refill player health bar
        oPlayer.isDead = false;      // CRITICAL: Reset the death flag so they can die again later
        oPlayer.canMove = true;      // Restore movement capabilities
    }
    
    // 3. Kick the player back to your starting map room
	if !instance_exists(oWarp) {
		var instance = instance_create_depth(0, 0, -12000, oWarp)
		instance.targetX = 80
		instance.targetY = 184
		instance.target_room = BHallway
		instance.target_face = UP
	}

	
}
