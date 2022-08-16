extends Control

#var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action("pause"):
		get_tree().paused = false
	
#func set_is_paused(value):
#	is_paused = value
#	get_tree().paused = is_paused
#	self.visible = is_paused
#


func _on_Resume_pressed():
	get_tree().paused = false



func _on_Quit_pressed():
	get_tree().quit()
