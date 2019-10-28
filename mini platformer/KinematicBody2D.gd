extends KinematicBody2D

const UP = Vector2(0, -1)  # 0 is the x value and -1 is for the upper direction of y which is the up
const GRAVITY = 20
const MAX_SPEED = 200
const ACCELERATION = 30
const JUMP_HEIGHT = -550
var motion = Vector2() # holds 2 dimensional variables

# works on every single frame
func _physics_process(delta):
	
	# a flag for controlling the friction on air
	var friction = false
	#updates the ravity on every single frame
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		# print(motion.x)
		$Sprite.flip_h = false  #for flipping the sprite  #$lets us use the sprite
		$Sprite.play("RUN")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		# print(motion.x)
		$Sprite.flip_h = true
		$Sprite.play("RUN")
	else:
		motion.x = lerp(motion.x, 0, 0.2)   # here friciton is used when the character is idle
		friction = true
		$Sprite.play("Idle")
	
	# this function is detecting whether the node is on the floor or not, for the detection to 
	# work, we need to call the move_and_slide() method
	if  is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:   # if we are on floor, standing we want the normal friction
			motion.x = lerp(motion.x, 0 , 0.2)
			
	else:
		if motion.y<0:
			$Sprite.play("JUMP")
		else: 
			$Sprite.play("FALL")
		if friction == true:   # if we are on air, we want much lesser friction
			motion.x = lerp(motion.x, 0 , 0.05)
			
	# we save the motion so that when it collides, the vector is set to 0,0	
	motion = move_and_slide(motion, UP)
	# print(motion)
