if (isShowing){
	if (!instance_exists(oPause)) {
       pause_id = instance_create_layer(0, 0, "Instances", oPause);
	}
}
if(not isShowing){
	if (instance_exists(pause_id)) {
        instance_destroy(pause_id);
        pause_id = noone; 
    }
	currentLevel= 1;
	correct =0;
}

if(canDestroy){
	if (keyboard_check_pressed(vk_enter)) {
		if (instance_exists(soundManager)) {
                soundManager.ripping = true;
        }
		
        instance_destroy(oBMissingBook);
        finished = true;
    }
}
