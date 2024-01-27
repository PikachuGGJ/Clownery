extends Node2D

@onready var telon_player = get_node("telon_player")

# Called when the node enters the scene tree for the first time.
func _ready():
	telon_player.play("cierre_telon")
