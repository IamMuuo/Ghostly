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


func _on_Quit_pressed():
	get_tree().quit()
