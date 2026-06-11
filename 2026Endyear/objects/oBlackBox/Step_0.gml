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
				
				if (selected_item == "Post-it") {
				    if (instance_exists(oAisha)) {
				        var targetAisha = instance_nearest(oPlayer.x, oPlayer.y, oAisha);
				        if (point_distance(oPlayer.x, oPlayer.y, targetAisha.x, targetAisha.y) < 80) {
							if (!global.talkedToAisha) {
				                // Trigger Aisha's custom script state
				                targetAisha.gavePostIt = true;
                
				                // Close the inventory view so the dialogue text box can take over
				                isInventory = false; 
                
				                // 3. Remove the Post-it from the player's inventory slots so it gets consumed
				                for (var i = 0; i < 2; i++) {
				                    if (oPlayer.inv[i] == "Post-it") {
				                        oPlayer.inv[i] = noone;
				                        break;
				                    }
				                }
				            }
				        }
				    } else {
						isDialogue = true;
						dialogueText = ["You pull out the Post-it...", "But there's nobody to read its contents."];
						dialoguePage = 0;
					}
				}
				if (selected_item == "Stair Key") {
				    if (instance_exists(oBStaircaseDoor)) {
				        // Find whichever staircase door the player is standing next to
				        var targetDoor = instance_nearest(oPlayer.x, oPlayer.y, oBStaircaseDoor);
        
				        // 1. Check if the player is actually close enough to interact with it
				        if (point_distance(oPlayer.x, oPlayer.y, targetDoor.x, targetDoor.y) < 96) {
            
				            // 2. Check if this is the tagged door instance from the Room Editor
				            if (targetDoor.isStairwellDoor == true) {
                
				                // Set up the dialogue to read
				                isDialogue = true;
				                dialogueText = ["You try the Stair Key on the door...", "It works! Twisting the key, the door unlocks.", "Yippee!"];
				                dialoguePage = 0;
                
				                // Queue up the room transition to happen AFTER the dialogue boxes finish
				                roomTargetAfterDialogue = BStaircase; // <-- Change 'Stairwell' to your exact Room asset name
                
				                // 3. Consume the Stair Key from the 2-slot inventory
				                for (var i = 0; i < 2; i++) {
				                    if (oPlayer.inv[i] == "Stair Key") {
				                        oPlayer.inv[i] = noone;
				                        break;
				                    }
				                }
								
								if !instance_exists(oWarp) {
									var instance = instance_create_depth(0, 0, -12000, oWarp)
									instance.targetX = 80
									instance.targetY = 258
									instance.target_room = BStaircase
									instance.target_face = UP
								}
                
				            } else {
				                // Player tried to use the key on the WRONG staircase door instance
				                isDialogue = true;
				                dialogueText = ["You try the Stair Key on the door...", "It does not work. You might wanna try the other staircase door."];
				                dialoguePage = 0;
				            }
				        } else {
				            // Player used the key too far away from any door
				            isDialogue = true;
				            dialogueText = ["You pull out the stair key, despite there being nothing to unlock.", "...you put the key back away slowly."];
				            dialoguePage = 0;
				        }
				    } else {
				        isDialogue = true;
				        dialogueText = ["You pull out the key, despite there not being any doors in sight.", "Nice job."];
				        dialoguePage = 0;
				    }
    
				    isInventory = false; // Close the inventory view overlay
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