extends Area3D



# Get the gravity from the project settings to be synced with RigidBody nodes.

var velocity = Vector3.ZERO

#forward movement
@export var speed = 1.0
@export var force = 20.0
@export var verticalSpeed = 3.0
@export var posicion : Vector3
@export var gravedad : Vector3 = Vector3.DOWN * 9.8
@export var rotationSpeed : float = 1

#track time
var t = 0
var rng = RandomNumberGenerator.new()

func _ready():
	position = posicion
	velocity += -transform.basis.z * force
	velocity.y = verticalSpeed
	name = "Monociclo " + str(get_rid()) 
	monitorable = true
	#pass

func _process(delta):
	if t > 8:
		queue_free()
	t += delta
	position = position + delta * velocity * speed;
	velocity += delta * gravedad
	
	rotation += rotationSpeed * delta * Vector3(rng.randf_range(0,2*PI), rng.randf_range(0,2*PI), rng.randf_range(0,2*PI))

func stop():
	print("Pitos")
	speed = 0.0
	force = 0.0
	rotationSpeed = 0.0
	verticalSpeed = 0.0
	gravity = 0.0
