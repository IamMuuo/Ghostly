extends KinematicBody2D


# game stats
var score: int = 0

# game physics
var speed: int = 100
var gravity: int = 800
var jumpForce: int = 600

var vel: Vector2 = Vector2()
var grounded: bool = false

onready var sprite = $Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vel.x = 0
	
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	
	vel = move_and_slide(vel,Vector2.UP)
	
	vel.y = gravity * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
		
