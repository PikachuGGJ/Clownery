extends Control

func _on_play_pressed():
	$click_boton.play()
	if($username.get_text() != ""):
		$ErrorMsg.set_text("")
		ScoreManager.set_player_name($username.get_text())
		Telon.change_scene_to_file("res://scenes/escenario.tscn")
	else:
		$ErrorMsg.set_text("[center][color=red]Introduce un nombre de usuario[/color][/center]")

func _on_exit_pressed():
	$click_boton.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()

func _on_credits_pressed():
	$click_boton.play()
	Telon.change_scene_to_file("res://scenes/credits.tscn")
