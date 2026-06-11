if (!yap) {
	yap = true;
	with (oBlackBox) {
    isDialogue = true;
    dialogueText = [
        "That concludes the little demo we had prepared.",
		"Everything shown is considered 'presentable'...",
		"We still have to work on other parts and aspects of the game.",
		"But thanks for playing!",
		"(You can close the game now)"
    ];
    dialoguePage = 0;
    textProgress = 0;
    currentText = "";
    }
}

