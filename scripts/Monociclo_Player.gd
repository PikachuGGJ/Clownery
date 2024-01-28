extends CharacterBody3D

@export var rotation_speed = 1.0
@onready var player_anim = $Player
@onready var timer = get_node("Timer")

@onready var label = get_parent().get_node("TiempoMonociclo")

@onready var nivel = get_parent().get_node("nivel_entr")
@onready var escenario = get_parent()

var num_izq = 0
var num_der = 0
var girar_izq = false
var girar_der = false
var fin = false
var t = 0.0


signal termina_monociclo

var rng = RandomNumberGenerator.new()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	visible = false
	position.z = 50
	timer.timeout.connect(_on_timer_timeout)
	
func _process(delta):
	player_anim.play_monocicle()
	
	if(rotation.z < 0):
		rotation_speed = -1.0
	else:
		rotation_speed = 1.0
	
	if (num_izq > rng.randf_range(15,25) and not girar_der):
		girar_izq = true
		girar_der = false
		num_izq = 0
		t = 0
	
	if (num_der > rng.randf_range(15,25) and not girar_izq):
		girar_izq = false
		girar_der = true
		num_der = 0
		t = 0
		
	var aux = abs(rotation.z) + 0.5
	
	if(girar_izq):
		rotation_speed = 1.7
		aux += 0.3
		t += delta
		if t > 2.5:
			girar_izq = false
	elif(girar_der):
		rotation_speed = -1.7
		aux += 0.3
		t += delta
		if t > 2.5:
			girar_der = false
		
	rotation += rotation_speed * delta * Vector3(0,0,1) * (aux/2)
	
	if (Input.is_action_just_pressed("left")):
		rotation.z += 0.1  * rng.randf_range(1,2.5)
		num_izq += 1
	if (Input.is_action_just_pressed("right")):
		rotation.z -= 0.1  * rng.randf_range(1,2.5)
		num_der += 1
	
	if(not fin):
		label.set_text(str(int(timer.get_time_left())))
	
	if (abs(rotation.z) > 1.4 and visible):
		die()
		
	if (abs(rotation.z) < 1.45 and visible):
		var puntos = (1.45 - abs(rotation.z))/3
		nivel.actualizar_niv_entr(puntos)
	


func _on_timer_timeout():
	fin = true
	label.visible = false
	position.z = 50
	termina_monociclo.emit()
	timer.stop()
	visible = false
	nivel.actualizar_niv_entr(30)
	escenario.cambiar_puntos(30)

func die():
	fin = true
	label.visible = false
	position.z = 50
	termina_monociclo.emit()
	timer.stop()
	visible = false
	nivel.actualizar_niv_entr(-35)
	escenario.cambiar_puntos(-10)
	
	
func _on_player_coge_monociclo():
	visible = true
	rotation.z = 0
	timer.set_wait_time(15)
	timer.start()
	fin = false
	num_izq = 0
	num_der = 0
	girar_izq = false
	girar_der = false
	label.visible = true
	t = 0.0
	position.z = 0
	label.pixel_size = 0.3
