extends Node3D

var tarta = preload("res://scenes/tarta.tscn")
var instancia

func _ready():
	var timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
	
func generar_Tarta():
	instancia = tarta.instantiate()
	var rng = RandomNumberGenerator.new()
	var x = rng.randi_range(79, 160)

	instancia.pos_ini = x
	instancia.body_entered.connect(quitar_tarta)
	
	add_child(instancia)
	
	
func quitar_tarta():
	instancia.queue_free()

func _on_timer_timeout():
	generar_Tarta()
