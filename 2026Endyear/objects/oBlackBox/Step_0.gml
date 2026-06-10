if (!isDialogue) {
    if (isInventory) {
        // 1. Freeze the player in place while menu is open
        if (!instance_exists(oPause)) {
            instance_create_depth(0, 0, -12000, oPause);
        }
        
        // 2. Menu selection control via Up and Down keys
        if (keyboard_check_pressed(vk_up)) {
            invSelect = 0;
        }
        if (keyboard_check_pressed(vk_down)) {
            invSelect = 1;
        }
        
        // 3. Item selection and execution logic (ENTER Key)
        if (keyboard_check_pressed(vk_enter)) {
            var selectedItem = oPlayer.inv[invSelect];
            
            if (selectedItem != noone) {
                var itemUsedSuccessfully = false;
                
                // --- ITEM USAGE & PROXIMITY TRACKING SYSTEM ---    

				//check for aisha... i know there are probably better solutions but idc anymore
                var aisha = instance_nearest(oPlayer.x, oPlayer.y, oAisha);
                var distanceToAisha = 9999;
                if (aisha != noone) {
                    distanceToAisha = point_distance(oPlayer.x, oPlayer.y, aisha.x, aisha.y);
                }
                
                // Check conditions based on the item string name
                if (selectedItem == "Post-it") {
                    // If near a locked door (within 40 pixels range)
                    if (aisha != noone && distanceToAisha < 40 && nearDoor.locked) {
                        aisha.gavePostIt = true;
                        itemUsedSuccessfully = true; 
                    }
                }
                
                // NOTE: You can add more item tracking logic blocks here:
                // if (selectedItem == "Potion") { oPlayer.hp = oPlayer.max_hp; itemUsedSuccessfully = true; }

                // Consume item only if used under the right conditions
                if (itemUsedSuccessfully) {
                    oPlayer.inv[invSelect] = noone;
                }
            }
            
            // Close menu and unfreeze player after pressing Enter
            isInventory = false;
            if (instance_exists(oPause)) {
                instance_destroy(oPause);
            }
        }
        
        // Allow pressing X to manually close inventory without using an item
        if (keyboard_check_pressed(ord("X"))) {
            isInventory = false;
            if (instance_exists(oPause)) {
                instance_destroy(oPause);
            }
        }
        
    } else {
        // Toggle inventory open if menu is closed
        if (keyboard_check_pressed(ord("X"))) {
            isInventory = true;
            invSelect = 0; // Reset selector row to top slot
        }
    }
    
} else {
    // --- DIALOGUE MODE --- (Kept exactly as your original code)
    if (!instance_exists(oPause)) {
        instance_create_depth(0, 0, -12000, oPause);
    }
    
    if (textProgress < string_length(dialogueText)) {
        textProgress += 1;
        currentText = string_copy(dialogueText, 1, floor(textProgress));
    }
    
    if (keyboard_check_pressed(vk_enter)) {
        if (textProgress < string_length(dialogueText)) {
            textProgress = string_length(dialogueText);
            currentText = dialogueText;
        } else {
            if (instance_exists(oPause)) {
                instance_destroy(oPause);
            }
            isDialogue = false;
            dialogueText = "";
            currentText = "";
            textProgress = 0;
        }
    }
}