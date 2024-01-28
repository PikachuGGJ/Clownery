extends Control

func _on_play_pressed():
	if($username.get_text() != ""):
		$ErrorMsg.set_text("")
		Telon.change_scene_to_file("res://scenes/escenario.tscn")
	else:
		$ErrorMsg.set_text("[center][color=red]Introduce un nombre de usuario[/color][/center]")

func _on_exit_pressed():
	get_tree().quit()

func _on_credits_pressed():
	Telon.change_scene_to_file("res://scenes/credits.tscn")
