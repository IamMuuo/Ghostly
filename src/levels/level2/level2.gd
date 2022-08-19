extends Node2D

onready var ui = get_node("c")
onready var player = get_node("Player")
var game_file = File.new()

var db = {}


func _on_level2_tree_entered():
	game_file.open("user://save_game.dat", File.READ)
	db = game_file.get_var(true)
	game_file.close()

func _ready():
	player.health = db["player_health"]
	player.score = db["player_coins"]
