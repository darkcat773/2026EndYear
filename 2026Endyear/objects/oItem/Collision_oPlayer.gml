if (item_type == "Z") {
    // Only pick up if the Z-slot is completely empty
    if (oPlayer.equipZ == noone) {
        oPlayer.equipZ = { name: item_name, type: item_type };
        instance_destroy();
    }
} else if (item_type == "X") {
    // Check if the general inventory array has space (max 2 items)
    if (array_length(oPlayer.inv) < 2) {
        array_push(oPlayer.inv, { name: item_name, type: item_type });
        instance_destroy();
    }
}