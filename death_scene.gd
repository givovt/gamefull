extends Node2D


func _on_button_1_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://traning_room.tscn")
