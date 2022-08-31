extends Node2D

onready var camera = get_node("camera")
onready var player = get_node("Player")
onready var ui = get_node("CanvasLayer/Container")
onready var pause = get_node("PauseGui/PauseMenu")

func _ready():
	pause.visible = false
	camera.position = player.position
	
func _physics_process(delta):
	camera.position = player.position
	ui.set_score_text(player.score, player.health)
