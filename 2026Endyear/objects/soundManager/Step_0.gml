if(ripping){
	audio_play_sound(soundPostIt,2,0);
	ripping = false;
}
if(key){
	audio_play_sound(soundKey,1,0);
	key = false;
}
if(button){
	audio_play_sound(soundButton,3,0);
	button =false;
}