#WorlComplete.gd
extends Area2D

export(String, FILE, "*.tscn") var next_world # this variable will be available to the inspector as it is exported

func _physics_process(delta):
	var bodies = get_overlapping_bodies() #contains the overlapping bodies
	print(bodies)
	for body in bodies:
		if body.name == "player":
			get_tree().change_scene(next_world)