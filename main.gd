extends Node2D

@onready var count_enemys = 0
@onready var message = $player/Label2


func _ready(): 
	var load = preload("res://dummy.tscn")
	var full = false
	while true:
		var enemys = load.instantiate()
		enemys.position = Vector2(randi_range(-500,500),randi_range(-3000, -2600)) #тут определяется позиция спавн врагов, первое число - x, второе - y
		$".".add_child(enemys)
		print("враг появился!!!")
		count_enemys += 1
		await get_tree().create_timer(randi_range(1,5)).timeout
		if count_enemys == 5:
			full = true
		else:
			full = false
		
		while full:
			if count_enemys >= 5:
				full = true
			else:
				full = false
			
			await get_tree().create_timer(1).timeout
	
	
#var goblins_preload = preload("res://dummy.tscn")
#
#func _on_spawner_timeout():
	#goblins_spawn()
#
#
#func goblins_spawn ():
	#var goblins  = goblins_preload.instantiate()
	#goblins.position = Vector2(randi_range(-1500,1500),randi_range(3400,2500))
	#$Goblins.add_child(goblins)

