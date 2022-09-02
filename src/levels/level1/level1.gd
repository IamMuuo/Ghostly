extends Node2D

onready var player = get_node("Player")
onready var camera = get_node("camera")
onready var ui = get_node("CanvasLayer/Container")
onready var pause = get_node("PauseGui/PauseMenu")
onready var music = get_node("levelMusic")

var db = {} # A dictionary to store the data
var game_file = File.new()


func _ready():
	camera.position = player.position
	pause.visible = false
	music.play(25.5)
	
func _physics_process(delta):
	camera.position = player.position
	ui.set_score_text(player.score, player.health)
	db["player_position"] = player.position


func _on_camera_ready():
	camera.position = player.position


func _on_Level1_exiting():
	game_file.open("user://save_game.dat", File.WRITE)
	db["player_health"] = player.health
	db["player_score"] = player.score
	game_file.store_var(db)
	game_file.close()
	
