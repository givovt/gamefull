extends Node2D

@onready var main = preload("res://main.tscn")
var save_patch = "user://savegame.save"

func _on_button_1_pressed():
	get_tree().change_scene_to_file("res://traning_room.tscn")
	preload("res://main.tscn")
	

func _on_button_2_pressed():
	get_tree().quit()


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")


func _on_load_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn") 
	var file = FileAccess.open(save_patch, FileAccess.READ)
	Global.money = file.get_var(Global.money)
