extends Node2D


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn") 


@onready var audio_hit = $AudioStreamPlayer
@onready var anim = $AnimatedSprite2D
@onready var hitbox = $Area2D/Hitbox
@onready var lab = $Label
@onready var particles = $GPUParticles2D
