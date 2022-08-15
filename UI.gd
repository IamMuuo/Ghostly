extends Panel

onready var scoreText = get_node("ScoreText")

func set_score_text(score):
	scoreText = str(score)

func _ready():
	pass
