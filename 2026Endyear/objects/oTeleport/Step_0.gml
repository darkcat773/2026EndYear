if place_meeting(x, y, oPlayer) && !instance_exists(oWarp) {
	var instance = instance_create_depth(0, 0, -12000, oWarp)
	instance.targetX = targetX
	instance.targetY = targetY
	instance.target_room = target_room
	instance.target_face = target_face
}