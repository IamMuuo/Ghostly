tool
extends Area2D

var game_file = File.new()

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene


func _on_body_entered(body):
	game_file.open("user://save_game.dat", File.WRITE)
	print(game_file.get_path())
	
	var db = {
		"player_health": body.health,
		"player_coins": body.score
	}
	
	game_file.store_var(db)
	game_file.close()
	
	teleport()


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if not next_scene else ""


func teleport() -> void:
	anim_player.play("fade_out")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)
