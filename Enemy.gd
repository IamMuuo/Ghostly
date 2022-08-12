extends Area2D


export var speed: int = 100
export var moveDist: int = 100

onready var startX :float = position.x
onready var targetX :float = position.x + moveDist

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = move_to(position.x, targetX, speed * delta)
	
	
	if position.x  == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = position.x

func move_to(from, to, step):
	var new = from
	
	if new < to:
		new += step
		
		if new > to:
			new = to
	
	else:
		new -= step
		
		if new < to:
			new = to
	
	return new
