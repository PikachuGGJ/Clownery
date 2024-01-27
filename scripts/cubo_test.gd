extends MeshInstance3D

@export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x_axis = Input.get_axis("left","right")
	var z_axis = Input.get_axis("forward", "back")
	position.x += x_axis
	position.z += z_axis
