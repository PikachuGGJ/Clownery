extends Control

func _on_play_pressed():
	Telon.change_scene_to_file("res://escena_de_pruebas.tscn")

func _on_exit_pressed():
	get_tree().quit()

func _on_credits_pressed():
	Telon.change_scene_to_file("res://scenes/credits.tscn")
