extends KinematicBody2D


var score = 0

export var speed = 400
export var jumpForce = 600
export var gravity = 800
export var health = 3

var vel = Vector2()
var grounded = false

onready var sprite = $Player
onready var player = get_node(".")


onready var ui = get_node("/root/level1/CanvasLayer/Container")

# physics loop
func _physics_process(delta):
	
	vel.x = 0
	# movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
		sprite.play("walk")
		sprite.flip_h = true
		
	elif Input.is_action_pressed("move_right"):
		vel.x += speed
		sprite.flip_h = false
		sprite.play("walk")
		
	elif not is_on_floor():
		sprite.play("jump")
	else:
		sprite.play("idle")
	
	# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	# gravity
	vel.y += gravity * delta
		
	# jump inputs
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce

# called when we run into a coin
func collect_coin (value):
	score += value
	ui.set_score_text(score, health)

func die ():
	if health > 1:
		health -= 1
		ui.set_score_text(score, health)
	else:
		get_tree().reload_current_scene()
	

func collect_health(value):
	health += value
	ui.set_score_text(score, health)
