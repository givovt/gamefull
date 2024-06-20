extends Node

@onready var pause_menu = $"../player/pauseMenu"

@onready var cavera = $"../Camera2D3"
@onready var play = $"../player"

var save_patch = "user://savegame.save"

var game_pause: bool = false

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		game_pause = !game_pause
		
	if game_pause == true:
		get_tree().paused = true 
		pause_menu.show()
		
	else: 
		get_tree().paused = false
		pause_menu.hide()


func _on_resume_pressed():
	game_pause = !game_pause


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://menu.tscn") 
	game_pause = !game_pause


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn") 
	game_pause = !game_pause

func _on_konec_pressed():
	get_tree().change_scene_to_file("res://the_end.tscn")
