// Continuously track and fly towards the player
if (instance_exists(oPlayer)) {
    var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
    x += lengthdir_x(1, dir);
    y += lengthdir_y(1, dir);
    
    // Deal damage if touching the player
    if (place_meeting(x, y, oPlayer)) {
        if (oPlayer.damageTimer <= 0) {
            oPlayer.hp -= 1;
            oPlayer.damageTimer = 30; // 30 frames = 0.5 seconds at 60fps room speed
        }
    }
}