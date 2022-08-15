extends Panel

onready var scoreText = get_node("ScoreText")

func set_score_text(score):
	scoreText.text = str(score)

func _ready():
	scoreText.text = "0"
