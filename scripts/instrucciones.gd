extends Control

func _ready():
	$aprende_a_jugar.play()

func _on_back_pressed():
	$click_boton.play()
	Telon.change_scene_to_file("res://scenes/menu.tscn")

