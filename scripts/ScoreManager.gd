extends Node

@export var currentPlayer : String

var scores : Dictionary

func _ready():
	load_data()

func store_score(score):
	scores[currentPlayer] = score

func save_data():
	var file = FileAccess.open("user://scoreboard.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(scores))
	
func load_data():
	var file = FileAccess.open("user://scoreboard.json", FileAccess.READ)
	if (file != null):
		scores = JSON.parse_string(file.get_as_text())
	else:
		scores = {}
