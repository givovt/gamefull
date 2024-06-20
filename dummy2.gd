extends CharacterBody2D

@onready var lab = $Label
@onready var anim = $AnimatedSprite2D
@onready var pla = $"../player"

@export var base_hp = 150
var health = 150

@export var speed = 200
@export var damage = 10

var stun = false
var can_attack = true

var in_range_attack = false

var see_player = false

var direction = Vector2.ZERO

func _ready():
	anim.play("idle_gob")
	health = base_hp
	lab.text = str(health) + "/" + str(base_hp)

func take_damage_enemy(damage):
	if health > 0:
		stun = true
		health -= damage
		anim.play("idle_gob")
		
		while anim.scale.y > 0.8 and anim.scale.x < 1.2:
			await get_tree().create_timer(0.01).timeout
			anim.scale.y -= 0.1
			anim.scale.x += 0.1
		
		lab.text = str(health) + "/" + str(base_hp)
		await get_tree().create_timer(0.5).timeout
		while anim.scale.y < 1 and anim.scale.x > 1:
			await get_tree().create_timer(0.01).timeout
			anim.scale.y += 0.1
			anim.scale.x -= 0.1
		await get_tree().create_timer(0.5).timeout
		lab.text = str(health) + "/" + str(base_hp)
		direction = Vector2.ZERO

func _process(delta):
	
	direction = Vector2.ZERO
	if see_player == true and in_range_attack == false:
		direction = position.direction_to(pla.position) * speed
	
	velocity = direction.normalized() * speed
	
	if direction.x < 0:
		anim.play("run")
		anim.flip_h = true
	if direction.x > 0:
		anim.play("run")
		anim.flip_h = false
	
	if direction.x == 0 and in_range_attack == false:
		anim.play("idle_gob")
	
	if health <= 0:
		lab.text = "0" + "/" + str(base_hp)
		while scale.y > 0.2 and scale.x > 0.2:
			await get_tree().create_timer(0.1).timeout
			scale.y -= 0.2
			scale.x -= 0.2
		pla.get_money()
		queue_free()
	
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		see_player = true


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		in_range_attack = false
		see_player = false

func _on_area_2d_2_body_entered(body):
	if body is CharacterBody2D and body.has_method("player"): #attack
		var player = body
		in_range_attack = true
		while in_range_attack:
			anim.play("attack_gob")
			await get_tree().create_timer(0.5).timeout
			if in_range_attack:
				player.take_damages_player(damage)

func _on_area_2d_2_body_exited(body):
	if body is CharacterBody2D and body.has_method("player"): #quit from see area
		await get_tree().create_timer(0.5).timeout
		in_range_attack = false
