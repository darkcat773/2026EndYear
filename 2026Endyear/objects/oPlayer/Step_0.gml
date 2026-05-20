// keyboard inputs
leftKey = keyboard_check(vk_left)
rightKey = keyboard_check(vk_right)
upKey = keyboard_check(vk_up)
downKey = keyboard_check(vk_down)
zKey = keyboard_check(ord("z"))
xKey = keyboard_check(ord("x"))


// basic movement
xSpeed = movSpeed*(rightKey-leftKey)
ySpeed = movSpeed*(downKey-upKey)


// collision
if place_meeting(x+xSpeed, y, oWall) {
	xSpeed=0
}
if place_meeting(x, y+ySpeed, oWall) {
	ySpeed=0
}


// things that actually update the position
x+=xSpeed
y+=ySpeed