/// @function item_add_remote(name, type)
/// @description Safely adds an item to the player's inventory from anywhere in code.
/// @param {string} _name The name of the item (e.g., "Post-it Note")
/// @param {string} _type The item slot type ("X" or "Z")
/// @return {bool} Returns true if successfully added, false if inventory was full.
function item_add_remote(_name, _type) {
    // Safety check: ensure the player instance exists before modifying variables
    if (!instance_exists(oPlayer)) {
        return false;
    }
    
    if (_type == "Z") {
        // Rule: Overwrite and replace the old Z item automatically
        oPlayer.equippedZ = _name;
        return true;
    } 
    else if (_type == "X") {
        // Enforce inventory capacity: Look for an empty slot in the 2-slot array
        for (var i = 0; i < 2; i++) {
            if (oPlayer.inv[i] == noone) {
                oPlayer.inv[i] = _name;
                return true; // Item successfully slotted!
            }
        }
    }
    
    // If it reaches this point, the inventory slots were completely full
    return false;
}