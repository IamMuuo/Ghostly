extends Area2D

export var value = 1

func _ready():
	pass


func _on_health_body_entered(body):
	if body.name == "Player":
		body.collect_health(value)
		queue_free()
