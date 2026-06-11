// --- PATH A: Player gives the Post-it Note ---
if (gavePostIt && !global.talkedToAisha) {
    sprite_index = sAishaIdle;
    with (oBlackBox) {
        isDialogue = true;
        dialogueText = [
            "Aisha:\n...what's this?",
            "You watch as she unwrinkles the post-it note.",
            "Aisha:\n...aww...I'll be your friend...",
            "Aisha:\n...here. I was given this key to go to the first floor...", 
            "Aisha:\n...but there's no way i'm leaving this stall.",
            "Aisha:\nI think you should take it. Consider it a 'thank you.'"
        ];
        dialoguePage = 0;
        textProgress = 0;
        currentText = "";
    }
    global.talkedToAisha = true;
    item_add_remote("Stair Key", "X");
}

// --- PATH B: Player approaches without the Post-it Note ---
if (!sprayTriggered && !global.talkedToAisha) {
    
    // 1. Check if player has a Post-it anywhere in their 2 inventory slots
    var has_postit = false;
    for (var i = 0; i < 2; i++) {
        if (oPlayer.inv[i] == "Post-it" || oPlayer.inv[i] == "Post-it Note") {
            has_postit = true;
        }
    }
    
    // 2. Define a 16x16 pixel zone directly to Aisha's RIGHT
    // Adjust 'y - 8' and 'y + 8' depending on where Aisha's sprite origin is centered
    var player_in_trap_zone = point_in_rectangle(oPlayer.x, oPlayer.y, x, y - 12, x + 24, y + 12);
    
    // 3. Trigger trap if inside the zone without the item
    if (player_in_trap_zone && !has_postit) {
        sprayTriggered = true;
        sprite_index = sAishaSpray;
        
        with (oBlackBox) {
            isDialogue = true;
            dialogueText = [
                "Aisha:\nAAAAHHH! Get away from my stall!!!",
                "Aisha:\nYou're HUGE...EWWW...",
                "Using the spray can in her hand, Aisha shoots the aerosol at you."
            ];
            dialoguePage = 0;
            textProgress = 0;
            currentText = "";
        }
    }
}

// 4. Post-Dialogue Logic: Wait until text box closes, then freeze player and spawn gas
if (sprayTriggered && !gasSpawned && !oBlackBox.isDialogue) {
    gasSpawned = true;
    
    // Freeze the player in place
    oPlayer.canMove = false;
    oPlayer.xSpeed = 0;
    oPlayer.ySpeed = 0;
    
    // Spawn the gas cloud right on top of Aisha
    instance_create_depth(x, y, depth - 10, oGasCloud);
}