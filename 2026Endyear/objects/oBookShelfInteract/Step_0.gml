if (isShowing and not submitted){
	if (!instance_exists(oPause)) {
       pause_id = instance_create_layer(0, 0, "Instances", oPause);
	}
}
if(not isShowing){
	if (instance_exists(pause_id)) {
        instance_destroy(pause_id);
        pause_id = noone; 
    }
}