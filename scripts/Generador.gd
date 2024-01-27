extends Node3D

var tarta = preload("res://scenes/tarta.tscn")
var instancia

func _ready():
	var timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
	
func generar_Tarta():
	instancia = tarta.instantiate()
	var rng = RandomNumberGenerator.new()
	var x = rng.randi_range(-20, 30)
	var y = (x + 20) / 2 + 9
	var z = rng.randi_range(-20, 20)

	instancia.posicion = Vector3(x, y, z)
	#instancia.body_entered.connect(quitar_tarta)
	
	add_child(instancia)

func _on_timer_timeout():
	generar_Tarta()
