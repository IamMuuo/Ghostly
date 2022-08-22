extends Node2D

onready var player = get_node("Player")
var game_file = File.new()

var db = {}


func _on_level3_tree_entered():
	game_file.open("user://save_game.dat", File.READ)
	db = game_file.get_var(true)

func _ready():
	player.health = db["player_health"]
	player.score = db["player_coins"]
	db["current_scene"] = get_tree().current_scene
	db["player_position"] = player.position


func _on_level3_tree_exiting():
	game_file.close()
