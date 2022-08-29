extends Node2D

onready var player = get_node("Player")
onready var camera = get_node("camera")

func _ready():
	camera.position = player.position
	
func _physics_process(delta):
	camera.position = player.position


func _on_camera_ready():
	camera.position = player.position
