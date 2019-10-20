# Moving between Levels

* Create a scene, add the tile sets to the scenes and adjust the **cells** of the tile sets

* Then we need to add an entry point for us to get to another level, then we add an **area 2D** node to the world, add an image to it and then add a **collsion body ** to it.

* Then we need to update the script of **area2D** node so that when it collides with the the player, the scene changes itself from one part to another.

* So how do we do it?

* Through code XD

* we use a method called **get_overlapping_bodies()** with the script of **area2D** . This will return an array of bodies collided, so we just cross check and change the scene with another method:

* ```python
  func _physics_process(delta):
  	var bodies = get_overlapping_bodies() #contains the overlapping bodies
  	print(bodies)
  	for body in bodies:
  		if body.name == "player":
  			get_tree().change_scene("World2.tscn")
  ```

* To get the player in the new world, we just save the player in the form of a scene by right clicking the player.

* Now we still need to go world no 1 from world 2 so what do we do? we use the concept of exporting variables

* WE create a **export** type variable to be used across the worlds so that it can have flexible values. This basically makes the variable available in the inspector of the **worlds** in world1 and world2. So then we can manually set the values to the scenes as we like. Also in the script of the world scene we update the parameter of the **change_scene()** method to this variable. Here is the code:

* ```python
  export(String, FILE, "*.tscn") var next_world # this variable will be available to the inspector as it is exported
  
  func _physics_process(delta):
  	var bodies = get_overlapping_bodies() #contains the overlapping bodies
  	print(bodies)
  	for body in bodies:
  		if body.name == "player":
  			get_tree().change_scene(next_world)
  ```

* This link [here](" https://docs.godotengine.org/en/3.1/getting_started/scripting/gdscript/gdscript_basics.html ") is the documentation of export variables in gdscript

* 