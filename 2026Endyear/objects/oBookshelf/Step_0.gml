if (distance_to_object(oPlayer) < 32) {
	oBookShelfInteract.isNear = true;
}

if (distance_to_object(oPlayer) > 32) {
	oBookShelfInteract.isNear = false;
}