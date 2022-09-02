extends Node2D

onready var camera = get_node("camera")
onready var player = get_node("Player")
onready var ui = get_node("CanvasLayer/Container")
onready var pause = get_node("PauseGui/PauseMenu")
onready var music = get_node("levelMusic")

func _physics_process(delta):
	camera.position = player.position
	ui.set_score_text(player.score, player.health)

func _ready():
	camera.position = player.position
	ui.set_score_text(player.score, player.health)
	music.play()
	pause.visible = false
