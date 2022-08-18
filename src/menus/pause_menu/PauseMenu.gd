extends Control

var is_paused = false


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		is_paused = not get_tree().paused
		get_tree().paused = is_paused
		visible = is_paused
		


func _on_Resume_pressed():
	get_tree().paused = false
	visible = false




func _on_MainScene_ready():
	self.visible = false


func _on_reload_pressed():
	get_tree().change_scene("res://src/levels/level1.tscn")
	queue_free()


func _on_main_menu_pressed():
	get_tree().change_scene("res://src/menus/mainMenu/MainMenu.tscn")
	queue_free()


func _on_save_pressed():
	pass # Replace with function body.
