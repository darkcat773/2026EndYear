if (isShowing and not finished){
	if (!instance_exists(oPause)) {
        instance_create_layer(0, 0, "Instances", oPause);
	}
}
if(finished){
	instance_destroy(oPause);
}