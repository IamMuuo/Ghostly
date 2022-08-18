extends Control


func _ready():
	pass


func _on_quit_pressed():
	get_tree().quit()


func _on_new_game_pressed():
	get_tree().change_scene("res://src/levels/level1.tscn")
	get_tree().paused = false
	visible = false
