extends CharacterBody2D

@onready var audio_hit = $AudioStreamPlayer
@onready var anim = $AnimatedSprite2D
@onready var hitbox = $Area2D/Hitbox
@onready var lab = $Label
@onready var lab2 = $Message
@onready var particles = $GPUParticles2D


@export var max_health = 100
@export var damage = 20

const SPEED = 300.0

var moving = false

var can_move = true
var attack = 1
var colldown = false
var flip_v = false

var temp = 0

func _ready():
	Global.health = max_health
	show_info()

func get_money():
	Global.money += 20
	print("деньги получены")
	
	
func show_info():
	lab.text = str(Global.health) + "/" + str(max_health)

func posion():
	if Global.healers_p >= 1:
		if Global.health <= 80:
			Global.health += 20
			Global.healers_p -= 1
			show_info()

func player():
	pass

func take_damages_player(damage):
	Global.health -= damage
	show_info()
	

func _process(delta):
	
	if(Global.money >= 100):
		lab2.visible = true
	
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	
	if Input.is_action_just_pressed("attack") and anim.animation == "idle" and attack == 1 and colldown == false:
		anim.play("attack_horizontal1")
		can_move = false
		colldown = true
		audio_hit.play()
		await get_tree().create_timer(0.35).timeout
		hitbox.disabled = false
		attack = 2
		await get_tree().create_timer(0.3).timeout
		hitbox.disabled = true
		can_move = true
		colldown = false
		anim.play("idle")
	
	if Input.is_action_just_pressed("attack") and anim.animation == "idle" and attack == 2 and colldown == false:
		anim.play("attack_horizontal2")
		can_move = false
		colldown = true
		audio_hit.play()
		await get_tree().create_timer(0.35).timeout
		hitbox.disabled = false
		attack = 1
		await get_tree().create_timer(0.3).timeout
		can_move = true
		colldown = false
		hitbox.disabled = true
		anim.play("idle")
	
	if Input.is_action_just_pressed("healing"):
		posion()
	
	if moving:
		particles.emitting = true
	else:
		particles.emitting = false
	
	if direction.length() > 0 and can_move:
		velocity = direction.normalized() * SPEED
		
		if direction.x < 0:
			moving = true
			hitbox.position.x = -54
			anim.flip_h = true
			anim.play("walk")
		
		elif direction.x > 0:
			moving = true
			hitbox.position.x = 54
			anim.flip_h = false
			anim.play("walk")
		
		if direction.y > 0:
			moving = true
			anim.play("walk")
		
		if direction.y < 0:
			moving = true
			anim.play("walk")
			
		
	if direction.length() == 0 and can_move:
		moving = false
		anim.play("idle")
		velocity = Vector2.ZERO
	
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://death_scene.tscn")
	move_and_slide()
	


#	if anim.animation == "attack_horizontal1":
#		can_move = true
#		colldown = false
#		attack = 2
#		hitbox.disabled = true
#		anim.play("idle")
#	
#	if anim.animation == "attack_horizontal2":
#		can_move = true
#		colldown = false
#		attack = 1
#		hitbox.disabled = true
#		anim.play("idle")


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D and body.has_method("take_damage_enemy"):
		var enemy = body
		enemy.take_damage_enemy(damage)
