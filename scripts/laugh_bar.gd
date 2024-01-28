extends Control

var nivel_entretenimiento = 50

func actualizar_niv_entr(incremento : float):
	nivel_entretenimiento = nivel_entretenimiento + incremento
	if(nivel_entretenimiento < 0):
		nivel_entretenimiento = 0
	if(nivel_entretenimiento > 100):
		nivel_entretenimiento = 100

func _process(delta):
	actualizar_niv_entr(-0.1)
	$animacion_cara.frame = int(nivel_entretenimiento/20)
	$TextureProgressBar.value = nivel_entretenimiento

func _on_timer_timeout():
	$ProgressBar.value+=1
