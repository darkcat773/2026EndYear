if(instance_exists(oPlayer)){
	var _cam = view_camera[0];
	var _cam_w = camera_get_view_width(_cam);
    var _cam_h = camera_get_view_height(_cam);
	
	var _hud_height = 180;
	var _target_x = oPlayer.x - (_cam_w / 2);
	var _target_y = oPlayer.y - ((_cam_h - _hud_height) / 2) - _hud_height + 55;
	_target_x = clamp(_target_x, 0, room_width - _cam_w);
    _target_y = clamp(_target_y, 0, room_height - _cam_h);
	camera_set_view_pos(_cam, _target_x, _target_y);
	
}