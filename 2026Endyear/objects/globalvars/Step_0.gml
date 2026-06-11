if keyboard_check_pressed(vk_enter) {
	instance_create_depth(1000, 0, -12000, oPlayer)
	if !instance_exists(oWarp) {
		var instance = instance_create_depth(0, 0, -12000, oWarp)
		instance.targetX = 80
		instance.targetY = 184
		instance.target_room = BHallway
		instance.target_face = UP
	}
	enter = true;
}