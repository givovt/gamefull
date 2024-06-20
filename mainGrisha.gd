extends Node2D


var goblins_preload = preload("res://dummy.tscn")

func _on_spawner_timeout():
	pass # Replace with function body.


func goblins_spawn ():
	var goblins  = goblins_preload.instantiate()
	goblins.position = Vector2(randi_range(-1500,1500),randi_range(3400,2500))
	
