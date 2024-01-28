extends Node3D
@export var crab_anim : AnimationPlayer
@export var forward_anim : AnimationPlayer
@export var backwards_anim : AnimationPlayer

func play_crab():
	forward_anim.stop()
	backwards_anim.stop()
	if (not crab_anim.is_playing()):
		crab_anim.play("anim")
	
func play_forward():
	crab_anim.stop()
	backwards_anim.stop()
	if (not forward_anim.is_playing()):
		forward_anim.play("anim")
	
func play_backwards():
	crab_anim.stop()
	forward_anim.stop()
	if (not backwards_anim.is_playing()):
		backwards_anim.play("anim")
