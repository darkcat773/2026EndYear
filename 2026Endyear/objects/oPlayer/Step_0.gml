// keyboard inputs
leftKey = keyboard_check(vk_left);
rightKey = keyboard_check(vk_right);
upKey = keyboard_check(vk_up);
downKey = keyboard_check(vk_down);
zKey = keyboard_check(ord("z"));
xKey = keyboard_check(ord("x"));


// basic movement
if (canMove) {
    xSpeed = movSpeed * (rightKey - leftKey);
    ySpeed = movSpeed * (downKey - upKey);
} else {
    xSpeed = 0;
    ySpeed = 0;
}

// Keep your existing pause check below it
if (instance_exists(oPause)) { 
    xSpeed = 0; 
    ySpeed = 0; 
}


// collision

var nearFake = instance_nearest(x, y, oBFake)

if instance_exists(oBFake) {
	if place_meeting(x+xSpeed, y, nearFake) {
		with (oBlackBox) {
		isDialogue = true;
		dialogueText = [
			"Something tells you that you probably should not go past this point."
			
		];
		dialoguePage = 0;
		textProgress = 0;
		currentText = "";
	}
	}
}

if place_meeting(x+xSpeed, y, oWall) {
	xSpeed=0;
}
if place_meeting(x, y+ySpeed, oWall) {
	ySpeed=0;
}

var nearDoor = instance_nearest(x, y, oDoor)

if instance_exists(oDoor){
	if nearDoor.locked {
	if place_meeting(x+xSpeed, y, nearDoor) {
		xSpeed=0;
	}
	if place_meeting(x, y+ySpeed, nearDoor) {
		ySpeed=0;
	}
	}
}




// things that actually update the position
x+=xSpeed;
y+=ySpeed;

// sprites
if ySpeed==0 {
	if xSpeed>0 {face = RIGHT};
	if xSpeed<0 {face = LEFT};
}
if xSpeed>0 && face==LEFT {face=RIGHT}
if xSpeed<0 && face==RIGHT {face=LEFT}
if xSpeed==0 {
	if ySpeed>0 {face = DOWN};
	if ySpeed<0 {face = UP};
}
if ySpeed>0 && face==UP {face=DOWN}
if ySpeed<0 && face==DOWN {face=UP}
sprite_index = sprite[face];

//animate
if xSpeed==0 and ySpeed==0 {
	image_index=1;
}

//damage
// Countdown the protection timer frame-by-frame
if (damageTimer > 0) {
    damageTimer--;
}

// Handle Player Death
if (hp <= 0 && !isDead) {
    isDead = true; // Locks this block so it runs exactly ONCE
    canMove = false;
    xSpeed = 0;
    ySpeed = 0;
    room_goto(gameover); // Transitions safely to your 'gameover' room
}


//die
if room == BBathroom && !global.enteredBathroom {
	with (oBlackBox) {
		isDialogue = true;
		dialogueText = [
			"You hear faint sniffling coming from the end of the room.",
			"Perhaps you shouldn't get *too* close...",
			"But it seems like they might need some words of kindness and love."
		];
		dialoguePage = 0;
		textProgress = 0;
		currentText = "";
	}
	global.enteredBathroom=true
	}
