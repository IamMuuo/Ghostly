extends Control


func _ready():
	pass


func _on_quit_pressed():
	get_tree().quit()


func _on_new_game_pressed():
	get_tree().change_scene("res://src/levels/level1.tscn")
	var bg_music = Background.get_node("AudioStreamPlayer")
	bg_music.stop()
	get_tree().paused = false
	visible = false
