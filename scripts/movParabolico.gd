extends Area3D


const SPEED = 1.0

# Get the gravity from the project settings to be synced with RigidBody nodes.

var velocity = Vector3.ZERO

#forward movement
@export var force = 20.0
@export var verticalSpeed = 3.0
@export var posicion : Vector3
@export var gravedad : Vector3 = Vector3.DOWN * 9.8

#track time
var t = 0

func _ready():
	position = posicion
	velocity += -transform.basis.z * force
	velocity.y = verticalSpeed
	name = "Tarta " + str(get_rid()) 
	monitorable = true
	#pass

func _process(delta):
	if t > 10:
		queue_free()
	t += delta
	position = position + delta * velocity * SPEED;
	velocity += delta * gravedad


#func _physics_process(delta):
	#velocity += gravity * delta * SPEED
	#look_at(transform.origin + velocity.normalized(), Vector3.UP)
	#move_and_collide(velocity * delta * SPEED)

func die(killer):
	print(name + ": me mató " + killer)
	queue_free()
