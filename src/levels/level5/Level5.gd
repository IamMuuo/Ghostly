extends Node2D

onready var camera = get_node("camera")
onready var player = get_node("Player")
onready var ui = get_node("CanvasLayer/Container")
onready var pause = get_node("PauseGui/PauseMenu")
onready var music = get_node("levelMusic")

var db = {}
var game_in_file = File.new()

func _physics_process(delta):
	camera.position = player.position
	ui.set_score_text(player.score, player.health)

func _ready():
	player.health = db["player_health"]
	player.score = db["player_score"]
	camera.position = player.position
	ui.set_score_text(player.score, player.health)
	music.play()
	pause.visible = false


func _on_Level5_entered():
	game_in_file.open("user://save_game.dat", File.READ)
	db = game_in_file.get_var(true)
	game_in_file.close()


func _on_Level5_exiting():
	var game_out_file = File.new()
	db["player_score"] = player.score
	db["player_health"] = player.health
	game_out_file.open("user://save_game.dat", File.WRITE)
	game_out_file.store_var(db)
	game_out_file.close()
