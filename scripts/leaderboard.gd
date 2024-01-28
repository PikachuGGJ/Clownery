extends Control

func _ready():
	ScoreManager.control_musica(false)
	$bailando.play()
	ScoreManager.save_data()
	var scores = ScoreManager.get_scoreboard()
	for player in scores:
		var espacio_blanco: String = ""
		for i in range(20 - player[0].length()):
			espacio_blanco += " "
		$leaderBoard.text += player[0] + espacio_blanco +"[color=pink]" + str(player[1]) + "[/color]\n"


func _on_back_pressed():
	$click_boton.play()
	Telon.change_scene_to_file("res://scenes/menu.tscn")



func _on_bailando_finished():
	ScoreManager.control_musica(true)
