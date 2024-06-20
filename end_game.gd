extends CharacterBody2D

var in_range = false

@onready var sprite = $AnimatedSprite2D
@onready var labes = $lab
@onready var labes1 = $lab2


var temp 

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D and body.has_method("player"):
		print("вошёл")
		in_range = true
		if  Global.money >= 100:
			temp = 2
		else:
			temp = 1
		

func _on_area_2d_body_exited(body):
	if body is CharacterBody2D and body.has_method("player"):
		print("вышел")
		in_range = false
		temp = 0

func _ready():
	sprite.play("idle")

func _process(delta):
	if  in_range == true:
		if Global.money < 100:
			while(temp == 1):
				labes.visible = true
				labes.visible_ratio += 0.01
				await get_tree().create_timer(4).timeout
				if(in_range == false):
					labes.visible = false
					labes.visible_ratio = 0
		if  temp == 2:
			$"../player/Message".visible = false
			while(temp == 2):
				labes1.visible = true
				labes1.visible_ratio += 0.01
				await get_tree().create_timer(4).timeout
				if(in_range == false):
					labes1.visible = false
					labes1.visible_ratio = 0

func _input(event):
	if(temp == 2 and in_range == true):
		if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
			Global.money = 90
			Global.health = 100
			Global.healers_p = 3
			var my_button = get_node("../Konec")
			my_button.emit_signal("pressed")
			



