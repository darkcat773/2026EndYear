// --- PLAYER FREEZE SYSTEM ---
// Freeze player if either dialogue is running OR inventory menu is wide open
if (isDialogue || isInventory) {
	if (!instance_exists(oPause)) {
		instance_create_depth(0, 0, -12000, oPause);
	}
} else {
	if (instance_exists(oPause)) {
		instance_destroy(oPause);
	}
}

// --- CORE LOGIC ---
if (!isDialogue) {
	// Toggle Inventory Menu Open/Close
	if (keyboard_check_pressed(ord("X"))) {
		isInventory = !isInventory;
		invSelect = 0; // Reset selector index to the top item
	}
	
	// Menu navigation and processing when inventory is open
	if (isInventory) {
		var inv_size = array_length(oPlayer.inv);
		
		// Navigate selection index up/down with arrow keys
		if (keyboard_check_pressed(vk_down)) {
			invSelect++;
			if (invSelect >= inv_size) invSelect = 0;
		}
		if (keyboard_check_pressed(vk_up)) {
			invSelect--;
			if (invSelect < 0) invSelect = max(0, inv_size - 1);
		}
		
		// Press ENTER to use highlighted item
		if (keyboard_check_pressed(vk_enter) && inv_size > 0) {
			var selected_item = oPlayer.inv[invSelect];
			var item_was_used = false;
			
			// --- ITEM USAGE LOGIC HOOK ---
			if (selected_item.name == "Rusty Key") {
				// Example condition: check if player is near your locked door object
				if (instance_exists(oBHallwayDoor) && distance_to_object(oBHallwayDoor) < 40) {
					oBHallwayDoor.locked = false;
					item_was_used = true; // Signals that item conditions matched
					
					// Trigger text notification
					isDialogue = true;
					dialogueText = "Used the Rusty Key! The door unlocked.";
				} else {
					isDialogue = true;
					dialogueText = "Can't use that here.";
				}
			}
			
			// If item usage criteria succeeded, remove it from your inventory array
			if (item_was_used) {
				array_delete(oPlayer.inv, invSelect, 1);
				invSelect = 0; // Safely snap selection position back to top
			}
			
			// Close out the inventory menu overlay automatically after an interaction
			isInventory = false;
		}
	} else {
		// Quick-use the Z-equipped item if inventory isn't active
		if (keyboard_check_pressed(ord("Z")) && oPlayer.equipZ != noone) {
			// Handle your custom Z tool/weapon code here later
		}
	}
	
} else {
	// --- Typewriter / Dialogue Handling ---
	if (textProgress < string_length(dialogueText)) {
		textProgress += 1;
		currentText = string_copy(dialogueText, 1, floor(textProgress));
	}
	
	if (keyboard_check_pressed(vk_enter)) {
		if (textProgress < string_length(dialogueText)) {
			textProgress = string_length(dialogueText);
			currentText = dialogueText;
		} else {
			isDialogue = false;
			dialogueText = "";
			currentText = "";
			textProgress = 0;
		}
	}
}