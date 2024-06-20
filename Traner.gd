extends Node2D

var in_range = true

var temp1 = 0

var temp2 = true
var temp3 = true
var temp4 = true

var next_scene = preload("res://main.tscn")

@onready var sprite = $AnimatedSprite2D
@onready var labes = $lab
@onready var labes2 = $lab2
@onready var labes3 = $lab3
@onready var labes4 = $lab4
@onready var labes5 = $lab5
@onready var labes6 = $lab6
@onready var labes7 = $lab7
@onready var labes8= $lab8
@onready var labes9 = $lab9
@onready var upravlen = $"../../Upravlen"
@onready var ataka = $"../../Ataka"
@onready var helth = $"../../Health"
@onready var contiue = $"../../player/continue"
func _ready():
	sprite.play("idle")

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D and body.has_method("player"):
		print("на меоприятие")
		in_range = true
		
		
func _process(delta):
	while(temp1 == 0 ):
		labes.visible = true
		labes.visible_ratio += 0.01
		await get_tree().create_timer(6).timeout
		if(labes.visible_ratio == 1):
			labes.visible_ratio = 0
			labes.visible = false
			temp1 += 1 
	await get_tree().create_timer(0.5).timeout
	while(temp1 == 1 ):
		labes2.visible = true
		labes2.visible_ratio += 0.01
		await get_tree().create_timer(6).timeout
		if(labes2.visible_ratio == 1):
			labes2.visible_ratio = 0
			labes2.visible = false
			temp1 += 1 
	await get_tree().create_timer(0.5).timeout
	while(temp1 == 2 ):
		labes3.visible = true
		labes3.visible_ratio += 0.005
		upravlen.visible = true
		await get_tree().create_timer(6).timeout
		if(labes3.visible_ratio == 1):
			labes3.visible_ratio = 0
			labes3.visible = false
			upravlen.visible = false
			temp1 += 1 
	await get_tree().create_timer(0.5).timeout
	while(temp1 == 3 ):
		labes4.visible = true
		labes4.visible_ratio += 0.005
		ataka.visible = true
		await get_tree().create_timer(6).timeout
		if(labes4.visible_ratio == 1):
			labes4.visible_ratio = 0
			labes4.visible = false
			ataka.visible = false
			temp1 += 1 
	await get_tree().create_timer(0.5).timeout
	while(temp1 == 4 ):
		labes5.visible = true
		labes5.visible_ratio += 0.005
		helth.visible = true
		await get_tree().create_timer(6).timeout
		if(labes5.visible_ratio == 1):
			labes5.visible_ratio = 0
			labes5.visible = false
			helth.visible = false
			temp1 += 1 
	await get_tree().create_timer(0.5).timeout
	while(temp1 == 5):
		labes6.visible = true
		labes6.visible_ratio += 0.005
		await get_tree().create_timer(6).timeout
		if(labes6.visible_ratio == 1):
			labes6.visible_ratio = 0
			labes6.visible = false
			temp1 += 1 
	await get_tree().create_timer(0.5).timeout
	while(temp1 == 6):
		labes7.visible = true
		labes7.visible_ratio += 0.005
		await get_tree().create_timer(6).timeout
		if(labes7.visible_ratio == 1):
			labes7.visible_ratio = 0
			labes7.visible = false
			temp1 += 1 
	await get_tree().create_timer(0.5).timeout
	while(temp1 == 7):
		labes8.visible = true
		labes8.visible_ratio += 0.005
		await get_tree().create_timer(6).timeout
		if(labes8.visible_ratio == 1):
			labes8.visible_ratio = 0
			labes8.visible = false
			temp1 += 1 
	await get_tree().create_timer(0.5).timeout
	while(temp1 == 8):
		labes9.visible = true
		labes9.visible_ratio += 0.005
		await get_tree().create_timer(6).timeout
		if(labes9.visible_ratio == 1):
			labes9.visible_ratio = 0
			labes9.visible = false
			temp1 += 1
			contiue.visible = true

func _input(event):
	if(temp1 == 9):
		if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
			var my_button = get_node("../../player/TextureRect/Button")
			my_button.emit_signal("pressed")





	
		
			
			
	#for i in 5:
		#if i == 1:
			#while labes.visible_ratio < 1:
				#labes.visible = true
				#await get_tree().create_timer(0.1).timeout
				#labes.visible_ratio += 0.01
				#await get_tree().create_timer(2).timeout
				#labes.visible = false
		#if i == 2:
			#while labes2.visible_ratio < 1:
				#labes2.visible = true
				#await get_tree().create_timer(0.1).timeout
				#labes2.visible_ratio += 0.01
				#await get_tree().create_timer(4).timeout
				#labes2.visible = false
		#if i == 3:
			#while labes3.visible_ratio < 1:
				#labes3.visible = true
				#await get_tree().create_timer(0.1).timeout
				#labes3.visible_ratio += 0.01
				#upravlen.visible = true
				#await get_tree().create_timer(2).timeout
				#labes3.visible = false
				#upravlen.visible = false


	#if temp == 0:
		#labes.visible = true
		#while labes.visible_ratio < 1 && temp == 0:
			#await get_tree().create_timer(0.01).timeout
			#labes.visible_ratio += 0.01
			#await get_tree().create_timer(3).timeout
			#labes.visible = false
			#temp += 1 
	#if temp == 1:
		#labes2.visible = true
		#while labes2.visible_ratio < 1 && temp == 1:
			#await get_tree().create_timer(0.01).timeout
			#labes2.visible_ratio += 0.01
			#await get_tree().create_timer(3).timeout
			#labes2.visible = false
			#temp == 2
	#if temp == 2:
		#labes3.visible = true
		#while labes3.visible_ratio < 1 && temp == 2:
			#await get_tree().create_timer(0.01).timeout
			#labes3.visible_ratio += 0.01
			#upravlen.visible = true
			#await get_tree().create_timer(3).timeout
			#labes3.visible = false
			#upravlen.visible = false
			#temp += 1





#func _process(delta):
	#if Input.is_action_just_pressed("attack") and in_range == true:
		#if $"../player".money >= 100:
			#get_tree().quit()
		#else:
			#labes.visible = true
			#while labes.visible_ratio < 1:
				#await get_tree().create_timer(0.01).timeout
				#labes.visible_ratio += 0.01
			#await get_tree().create_timer(2).timeout
			#labes.visible_ratio = 0
			#labes.visible = false





