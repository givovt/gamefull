extends Sprite2D

@onready var parent_node = $"../.."
@onready var animationplayer = $AnimationPlayer


func _ready():
	animationplayer.play("base_healing")

func _process(delta):
	pass
