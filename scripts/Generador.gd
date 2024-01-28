extends Node3D

@export var speed = 1.0
@export var force = 20.0
@export var verticalSpeed = 3.0
@export var posicion : Vector3
@export var gravedad : Vector3 = Vector3.DOWN * 9.8
@export var rotationSpeed : float = 1


@onready var timer = get_node("Timer")

var monociclo = preload("res://scenes/monociclo.tscn")
var tarta = preload("res://scenes/tarta.tscn")
var instancia
var rng = RandomNumberGenerator.new()

func _ready():
	timer.timeout.connect(_on_timer_timeout)
	
func generar_Objeto():
	if (rng.randi_range(0,100) > 7):
		instancia = tarta.instantiate()
	else:
		instancia = monociclo.instantiate()
		
	var x = rng.randi_range(-20, 30)
	var y = (x + 20) / 2 + 9
	var z = rng.randi_range(-20, 20)

	instancia.posicion = Vector3(x, y, z)
	instancia.force = force
	instancia.verticalSpeed = verticalSpeed
	instancia.gravedad = gravedad
	instancia.rotationSpeed = rotationSpeed
	instancia.speed = speed
	#instancia.body_entered.connect(quitar_tarta)
	
	add_child(instancia)

func _on_timer_timeout():
	generar_Objeto()

func _on_player_coge_monociclo():
	timer.stop()


func _on_monociclo_player_termina_monociclo():
	timer.start()
