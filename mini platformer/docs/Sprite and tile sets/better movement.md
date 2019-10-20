*Set the Tile sets Static body and collision body scale to (1,1)*

*go to debug and select visible collision shapes to see the collision shapes*

# Adding smooth movement

* We add accelration constant to to the **motion.x** and the **motion.y** variables and set a certain **max speed**

* The accelaration will create the effect of accelaration.

* ```python
  const MAX_SPEED = 200
  const ACCELERATION = 30
  const JUMP_HEIGHT = -600
  var motion = Vector2() # holds 2 dimensional variables
  
  # works on every single frame
  func _physics_process(delta):
  	
  	#updates the ravity on every single frame
  	motion.y += GRAVITY
  	
  	if Input.is_action_pressed("ui_right"):
  		motion.x += ACCELERATION		
  		$Sprite.flip_h = false  #for flipping the sprite  #$lets us use the sprite
  		$Sprite.play("RUN")
  	elif Input.is_action_pressed("ui_left"):
  		motion.x -= ACCELERATION
  		$Sprite.flip_h = true
  		$Sprite.play("RUN")
  ```

* But we can make the code better by using the min() and max() function with this, so that after accelrating, we hit a maximum speed and we retain the speed till we stop.

* ```python
  const MAX_SPEED = 200
  const ACCELERATION = 30
  const JUMP_HEIGHT = -600
  var motion = Vector2() # holds 2 dimensional variables
  
  # works on every single frame
  func _physics_process(delta):
  	
  	#updates the ravity on every single frame
  	motion.y += GRAVITY
  	
  	if Input.is_action_pressed("ui_right"):
  		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
  		$Sprite.flip_h = false  #for flipping the sprite  #$lets us use the sprite
  		$Sprite.play("RUN")
  	elif Input.is_action_pressed("ui_left"):
  		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
  		$Sprite.flip_h = true
  		$Sprite.play("RUN")
  ```

  # Adding Fricition

  * We use linear interpolation for adding friction, particularly the function **lerp(from, to, weight)**. Here from is from where we are at and to is the destination. In between these two horrizantal position, we will observe an effect of friction in our game. The wight portion is just the amount or percentage of friction.

  * Then we add friciton for air too, the code is pretty much self explanatory:

  * ```python
    func _physics_process(delta):
    	
    	# a flag for controlling the friction on air
    	var friction = false
    	#updates the ravity on every single frame
    	motion.y += GRAVITY
    	
    	if Input.is_action_pressed("ui_right"):
    		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
    		print(motion.x)
    		$Sprite.flip_h = false  #for flipping the sprite  #$lets us use the sprite
    		$Sprite.play("RUN")
    	elif Input.is_action_pressed("ui_left"):
    		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
    		print(motion.x)
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
    		$Sprite.play("JUMP")
    		if friction == true:   # if we are on air, we want much lesser friction
    			motion.x = lerp(motion.x, 0 , 0.05)
    			
    	# we save the motion so that when it collides, the vector is set to 0,0	
    	motion = move_and_slide(motion, UP)
    	print(motion)
    ```

    # Adding Falling

    

    * Create a new falling animation and at the time of falling, just add that animation with the **$Sprite.play()** method.

    * ```Python
      if motion.y<0:
      			$Sprite.play("JUMP")
      		else: 
      			$Sprite.play("FALL")
      		if friction == true:   # if we are on air, we want much lesser friction
      			motion.x = lerp(motion.x, 0 , 0.05)
      ```

      * If we set the collision object to capsle type then we can actually slie off the objects that we have