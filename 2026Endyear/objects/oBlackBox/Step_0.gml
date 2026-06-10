if (isDialogue || isInventory) { 
	if (boxPauseID == noone && !instance_exists(oPause)) {
		boxPauseID = instance_create_depth(0, 0, -12000, oPause);
	}
} else {
	if (boxPauseID != noone) {
		if (instance_exists(boxPauseID)) {
			instance_destroy(boxPauseID);
		}
		boxPauseID = noone; 
	}
}

// --- CORE LOGIC ---
if (!isDialogue) {
	// toggle inv menu
	if (keyboard_check_pressed(ord("X"))) {
		isInventory = !isInventory;
		invSelect = 0; 
	}
	
	// menu navigation
	if (isInventory) {
		if (instance_exists(oPlayer) && variable_instance_exists(oPlayer.id, "inv")) {
			var inv_size = array_length(oPlayer.inv);
			
			if (keyboard_check_pressed(vk_down)) {
				invSelect++;
				if (invSelect >= inv_size) invSelect = 0;
			}
			if (keyboard_check_pressed(vk_up)) {
				invSelect--;
				if (invSelect < 0) invSelect = max(0, inv_size - 1);
			}
			
			if (keyboard_check_pressed(vk_enter) && inv_size > 0) {
				var selected_item = oPlayer.inv[invSelect];
				var item_was_used = false;
				
				// --- ITEM USAGE LOGIC HOOK ---
				if (selected_item.name == "Rusty Key") {
					if (instance_exists(oBHallwayDoor) && distance_to_object(oBHallwayDoor) < 40) {
						oBHallwayDoor.locked = false;
						item_was_used = true; 
						
						// UPDATED: Now passing multi-page text as an array
						isDialogue = true;
						dialogueText = ["Used the Rusty Key!", "The heavy iron door unlocked!"];
						dialoguePage = 0;
					} else {
						isDialogue = true;
						dialogueText = ["Can't use that here.", "There isn't a lock in sight..."];
						dialoguePage = 0;
					}
				}
				
				if (item_was_used) {
					array_delete(oPlayer.inv, invSelect, 1);
					invSelect = 0; 
				}
				
				isInventory = false;
			}
		} else {
			isInventory = false;
		}
		
	} else {
		if (keyboard_check_pressed(ord("Z")) && instance_exists(oPlayer) && variable_instance_exists(oPlayer.id, "itemZ")) {
			if (oPlayer.itemZ != noone) {
				// Handle your custom Z tool/weapon code here later
			}
		}
	}
	
} else {
	// ==========================================
	// UPDATED DIALOGUE & PAGE ADVANCEMENT
	// ==========================================
	
	// Grab the text for the current page
	var target_text = dialogueText[dialoguePage];
	
	// Typewriter effect for current page
	if (textProgress < string_length(target_text)) {
		textProgress += textSpeed;
		currentText = string_copy(target_text, 1, floor(textProgress));
	}
	
	// Skip typing / Advance to next page
	if (keyboard_check_pressed(vk_enter)) {
		if (textProgress < string_length(target_text)) {
			// If text is typing, autofill the current page instantly
			textProgress = string_length(target_text);
			currentText = target_text;
		} else {
			// If text is finished, check if there's a NEXT page in the array
			if (dialoguePage < array_length(dialogueText) - 1) {
				dialoguePage++;   // Turn the page
				textProgress = 0; // Reset typewriter parameters
				currentText = "";
			} else {
				// Out of pages! Close dialogue and clear data
				if (instance_exists(oPause)) {
					instance_destroy(oPause);
				}
				isDialogue = false;
				dialogueText = [];
				dialoguePage = 0;
				currentText = "";
				textProgress = 0;
			}
		}
	}
}