extends HBoxContainer

onready var scoreText = get_node("ScoreText")
onready var livesText = get_node("lives")

func set_score_text(score, health):
	scoreText.text = str(score)
	livesText.text = str(health)

func _ready():
	scoreText.text = "0"
	livesText.text = "3"
