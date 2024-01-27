extends CharacterBody3D


const JUMP_VELOCITY = 4.5

@export var sens = 0.5
@export var speed = 5.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

#func _ready():
	#gravity = 0

#func _input(event):
	#if event is InputEventMouseMotion:
		#rotate_y(deg_to_rad(event.relative.x * sens))
		#pivote.rotate_x(deg_to_rad(event.relative.y * sens))
		#pivote.rotation.x = clamp(pivote.rotation.x, deg_to_rad(-90), deg_to_rad(45))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#print("direction => %s" + direction)
	if direction:
		velocity = direction * speed
		
	else:
		velocity = Vector3.ZERO

	move_and_slide()		
