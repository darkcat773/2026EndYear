if (distance_to_object(oPlayer) < 32) {
	if(instance_exists(oBookHUD)){
	oBookHUD.isNear = true;
	}
}

if (distance_to_object(oPlayer) > 32) {
	if(instance_exists(oBookHUD)){
	oBookHUD.isNear = false;
	}
}