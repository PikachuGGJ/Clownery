extends Node3D

@export var lightColor : Color
@export var lightEnergy : float = 15
@export var lightRange: float = 40
@export var lightAngle : float = 30


@onready var luz = $luz
@onready var modelo = $modelo

# Called when the node enters the scene tree for the first time.
func _ready():
	luz.light_color = lightColor
	luz.light_energy = lightEnergy
	luz.spot_angle = lightAngle
	luz.spot_range = lightRange
	print(lightColor)
	modelo.set_material_color(lightColor)


