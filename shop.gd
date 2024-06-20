extends Node2D

@onready var sh = $"."

@onready var shopx = $".".global_position.x
@onready var shopy = $".".global_position.y

var creat_healing = load("res://healing.tscn")

func _ready():
	while true:
		var heal = creat_healing.instantiate()
		heal.position = Vector2(shopx + randi_range(-20,20), shopy + 100.0)
		sh.add_child(heal)
		await get_tree().create_timer(20).timeout
		sh.remove_child(heal)
