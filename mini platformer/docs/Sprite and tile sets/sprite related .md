# Sprite and editing the main scene

- We add a new node to our world, called the **Tile map** Node. 

- We unlock the tile map node, so that the player is not accidentally selected.

- Then we add the created **Tile set** to this Tile map node.

- This would create the tiles for us and so can use them.

- Then we set the cell size **32 X 32**

- Then we go to **project -> General -> Display** and we set the game width.

- Then we start designing with the tiles that we have created.

- We go to **project -> General -> Display** and set the test height and width respectively.

- Then for changing the aspects, we go to the same settings and then we go to **stretch** portion and then we set the **Mode to 2D and set the Aspect to Shrink** then it will be in a good aspect ratio.

  ## Animating the character

  - We use **animated sprite node for the node that we want to move**

  - Then we have **Frames instead of sprites** and the frames of sprites to it.

  - We go to the sprite frames tab and add the sprites to the respective animations that we will be creating.

  - Make sure to reimport the sprites again like before so that they are not distorted like before.

  - create the different animations for different purpose, we can come to the scene and select the animation to and play the animation to see what it would look like in the actual game itself.

  - We then change the collision shape of the Player node in this case to fit.

  - Then we change the script so that the sprite itself is moving and doing stuffs.

  - **$(Name of sprite).something** let's us do stuff with the sprites.

  - we use the **play**() function along with the name of the animation to play the animation when certain events are taking place in the screen.

  - The jump for our purpose is modified a bit to accomodate the code.

  - Here is the code in GD.script:

  - ```python
    extends KinematicBody2D
    
    const UP = Vector2(0, -1)  # 0 is the x value and -1 is for the upper direction of y which is the up
    const GRAVITY = 20
    const SPEED = 200
    const JUMP_HEIGHT = -600
    var motion = Vector2() # holds 2 dimensional variables
    
    # works on every single frame
    func _physics_process(delta):
    	
    	#updates the ravity on every single frame
    	motion.y += GRAVITY
    	
    	if Input.is_action_pressed("ui_right"):
    		motion.x = SPEED
    		$Sprite.flip_h = false  #for flipping the sprite  #$lets us use the sprite
    		$Sprite.play("RUN")
    	elif Input.is_action_pressed("ui_left"):
    		motion.x = -SPEED
    		$Sprite.flip_h = true
    		$Sprite.play("RUN")
    	else:
    		motion.x = 0
    		$Sprite.play("Idle")
    	
    	# this function is detecting whether the node is on the floor or not, for the detection to 
    	# work, we need to call the move_and_slide() method
    	if  is_on_floor():
    		if Input.is_action_pressed("ui_up"):
    			motion.y = JUMP_HEIGHT
    	else:
    		$Sprite.play("JUMP")
    			
    	# we save the motion so that when it collides, the vector is set to 0,0	
    	motion = move_and_slide(motion, UP)
    	print(motion)
    
    ```

  - 

  

  