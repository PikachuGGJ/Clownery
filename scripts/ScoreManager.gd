extends Node

@export var currentPlayer : String
@export var currentScore : int

var scores : Dictionary = {}

func _ready():
	load_data()	

func set_player_name(pname):
	currentPlayer= pname

func store_score(score):
	currentScore = score
	if (scores.has(currentPlayer)):
		if (scores[currentPlayer] < score):
			scores[currentPlayer] = score
	else:
		scores[currentPlayer] = score

func save_data():
	var file = FileAccess.open("user://settings.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(scores))
	print(JSON.stringify(scores))
	file.close()
	
func load_data():
	var file = FileAccess.open("user://settings.json", FileAccess.READ)
	if (file != null):
		scores = JSON.parse_string(file.get_as_text())
		print(file.get_as_text())	
		file.close()
	else:
		print("No se enconró el fichero de guardado")
		scores = {}

func get_scoreboard() -> Array:
	var ordered = []
	for player in scores:
		ordered.push_back([player, scores[player]])
	ordered.sort_custom(func(a, b): return a[1] > b[1])
	return ordered

func get_current_score():
	return currentScore

func get_current_player():
	return currentPlayer

func _on_musica_menu_finished():
	$musica_menu.play()
	
func control_musica(estado :bool):
	if(estado):
		$musica_menu.play()
	else:
		$musica_menu.stop()
