isInventory = false;
invSelect = 0; 
boxPauseID = noone; 

// dialogue
isDialogue = false; 
dialogueText = [];      // CHANGED: Now holds an array of text pages
dialoguePage = 0;
currentText = "";  //partial msg currently displayed
textProgress = 0;  //current char count
textSpeed = 1;   // Speed of typing (e.g., 0.6 characters per frame)