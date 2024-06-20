extends Node2D

@onready var price_lab = $Node2D/Label
@onready var player_scene = $"../player"
@onready var sprite = $Node2D/healing
var in_range_buy = false
var price

func _ready():
	price_lab.visible = false
	price = randi_range(10,12)
	price_lab.text = "Цена:" + str(price)

func _process(delta):
	if Input.is_action_just_pressed("attack") and in_range_buy == true:
		Global.money -= price
		Global.healers_p += 1
		await get_tree().create_timer(0.5).timeout

func _on_node_2d_body_entered(body):
	if body is CharacterBody2D and body.has_method("player"):
		price_lab.visible = true
		in_range_buy = true


func _on_node_2d_body_exited(body):
	if body is CharacterBody2D and body.has_method("player"):
		price_lab.visible = false
		in_range_buy = false
