if gavePostIt and !talked {
	sprite_index = sAishaIdle
	with (oBlackBox) {
		isDialogue = true;
		dialogueText = [
			"Aisha:\n...what's this?",
			"You watch as she unwrinkles the post-it note.",
			"Aisha:\n...aww...I'll be your friend...",
			"Aisha:\n...here. I was given this key to go to the first floor...", 
			"Aisha:\n ..but there's no way i'm leaving this stall.",
			"Aisha:\nI think you should take it. Consider it a 'thank you.'"
		];
		dialoguePage = 0;
		textProgress = 0;
		currentText = "";
	}
	talked = true
}