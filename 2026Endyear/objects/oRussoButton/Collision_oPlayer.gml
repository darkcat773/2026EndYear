if (!isPressed){
	isPressed = true;
	image_index = 1;
	image_speed =0;
	if(instance_exists(oKingLock)){
		oKingLock.isLocked = false;
	}
}