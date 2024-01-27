extends RigidBody3D


const SPEED = 1.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var velocity = Vector3.ZERO

#forward movement
@export var force = 20.0
@export var verticalSpeed = 3.0

#track time
var t = 0

func _ready():
	velocity += -transform.basis.z * force	
	velocity.y = verticalSpeed
	gravity = Vector3.DOWN * 9.8
	#pass

func _process(delta):
	if t > 10:
		queue_free()
	t += delta

func _physics_process(delta):
	velocity += gravity * delta * SPEED
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	move_and_collide(velocity * delta * SPEED)
	#move_and_slide()
