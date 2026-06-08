if (distance_to_object(oPlayer) < 32) {
	oBookHUD.isNear = true;
}

if (distance_to_object(oPlayer) > 32) {
	oBookHUD.isNear = false;
}