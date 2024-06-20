extends Control

@onready var texture_bar = $TextureProgressBar
@onready var money_count = $money_count
@onready var health_posion_cou = $health_posion_count
@onready var pla = $"../.."
@onready var money_player
@onready var posions
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	await get_tree().create_timer(1).timeout
	money_player = Global.money
	posions = Global.healers_p
	texture_bar.value = Global.health
	money_count.text = str(money_player)
	health_posion_cou.text = str(posions)
