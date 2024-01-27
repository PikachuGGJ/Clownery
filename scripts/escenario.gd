extends Node3D

var puntos: int = 0

func _ready():
	$Puntos.set_text("Puntos " + str(puntos))

func _on_player_atrapa_tarta():
	puntos += 1
	$Puntos.set_text("Puntos " + str(puntos))
