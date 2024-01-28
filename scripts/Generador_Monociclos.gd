extends Node3D

@export var speed = 1.0
@export var force = 20.0
@export var verticalSpeed = 3.0
@export var posicion : Vector3
@export var gravedad : Vector3 = Vector3.DOWN * 9.8
@export var rotationSpeed : float = 1

var monociclo = preload("res://scenes/monociclo.tscn")
var instancia

@onready var timer = get_node("Timer")

func _ready():
	timer.timeout.connect(_on_timer_timeout)
	
func generar_Tarta():
	instancia = monociclo.instantiate()
	var rng = RandomNumberGenerator.new()
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
	generar_Tarta()


func _on_player_coge_monociclo():
	timer.stop()
	instancia = monociclo.instantiate()
	instancia.posicion = Vector3(0,10,0)
	instancia.force = 0
	instancia.verticalSpeed = 0
	instancia.gravedad = Vector3(0,0,0)
	instancia.rotationSpeed = 0
	instancia.speed = 0
	add_child(instancia)
