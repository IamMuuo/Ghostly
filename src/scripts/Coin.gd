extends Area2D

export var value = 1
onready var collect_music = get_node("AudioStreamPlayer")

var finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation_degrees += 90 * delta
	


func _on_Coin_body_entered(body):
	if body.name == "Player":
		collect_music.play(0.25)
		body.collect_coin(value)
		_on_CoinCollect_finished()


func _on_CoinCollect_finished():
	if !collect_music.playing:
		queue_free()
