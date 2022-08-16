extends KinematicBody2D

var score = 0

export var speed = 400
export var jumpForce = 600
export var gravity = 800

var vel = Vector2()
var grounded = false

onready var sprite = $Sprite

onready var ui = get_node("/root/MainScene/CanvasLayer/Container")

# physics loop
func _physics_process(delta):
	
	vel.x = 0
	# movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
		
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	
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
	ui.set_score_text(score)

func die ():
	get_tree().reload_current_scene()