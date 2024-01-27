extends Node3D

@onready var mesh : Mesh = $Untitled.mesh

func set_material_color(spotColor: Color) -> void:
	var emissive : StandardMaterial3D = StandardMaterial3D.new()
	emissive.albedo_color = spotColor
	emissive.emission_enabled = true
	emissive.emission_intensity = 12
	emissive.emission =  spotColor
	mesh.surface_set_material(1, emissive)

