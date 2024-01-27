extends CharacterBody3D


const SPEED = 0.76
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

#forward movement
@export var force = 20.0
@export var verticalSpeed = 3.0

#track time
var t = 0

func _ready():
	velocity += -transform.basis.z * force	
	velocity.y = verticalSpeed
	#pass

func _process(delta):
	if t > 10:
		queue_free()
	t += delta

func _physics_process(delta):
	velocity.y -= gravity * delta * SPEED
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	#move_and_collide(velocity * delta * SPEED)
	move_and_slide()
