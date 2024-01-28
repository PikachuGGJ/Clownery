extends Node3D

var puntos: int = 0

func _ready():
	$Puntos.set_text("Puntos " + str(puntos))
	
#Cuando el nivel de entretenimiento es muy bajo, se pierden puntos
#Cuando el nivel de entretenimiento es óptimo, se ganan puntos de manera normal y no se pierden
#Cuando el nivel de entretenimiento es muy alto, se dejan de ganar puntos
func _on_player_atrapa_tarta():
	$sfx_tarta.play()
	$nivel_entr.actualizar_niv_entr(5)
	if($nivel_entr.nivel_entretenimiento <=66):
		puntos += int(5*($nivel_entr.nivel_entretenimiento/50))
	#$Puntos.set_text("NivEntr " + str(puntos))

func _on_timer_nivel_entr_timeout():
	if(($nivel_entr.nivel_entretenimiento < 30)):
		puntos -= 1

func _process(delta):
	$Puntos.set_text("Score: " + str(puntos))
	$Tiempo.set_text(str(int($tiempo_juego.get_time_left())))



func fin_juego_timeout():
	ScoreManager.store_score(puntos)
	ScoreManager.control_musica(true)
	Telon.change_scene_to_file("res://scenes/scores.tscn")


func _on_musica_escenario_finished():
	$musica_escenario.play()

func cambiar_puntos(incremento : int):
	puntos += incremento
