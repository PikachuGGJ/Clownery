extends Node2D

@onready var telon_player: AnimationPlayer = get_node("telon_player")

func change_scene_to_file(target: String ):
	telon_player.play("cierre_telon")
	await telon_player.animation_finished
	get_tree().change_scene_to_file(target)
	await get_tree().create_timer(0.1).timeout
	telon_player.play("apertura_telon")
