extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	monitoring = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if (area.name.begins_with("Tarta")):
		area.die(name)
	elif (area.name.begins_with("Monociclo")):
		area.stop()
	else:
		print(area.name)
