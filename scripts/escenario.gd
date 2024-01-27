extends Node3D

var puntos: int = 0

func _ready():
	$Puntos.set_text("Puntos " + str(puntos))

func _on_player_atrapa_tarta():
	$nivel_entr.actualizar_niv_entr(5)
	puntos += int(5*($nivel_entr.nivel_entretenimiento/50))
	$Puntos.set_text("Puntos " + str(puntos))
