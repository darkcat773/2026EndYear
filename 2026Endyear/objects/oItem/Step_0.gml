if (place_meeting(x, y, oPlayer)) {
    if (itemType == "Z") {
        // delete existing z item
        oPlayer.equippedZ = itemName;
        instance_destroy();
    } 
    else if (itemType == "X") {
        // pick up only if nventory ISNT full
        var itemPickedUp = false;
        for (var i = 0; i < 2; i++) {
            if (oPlayer.inv[i] == noone) {
                oPlayer.inv[i] = itemName;
                itemPickedUp = true;
                break;
            }
        }
        if (itemPickedUp) {
            instance_destroy();
        }
    }
}