extends Node3D
@export var crab_anim : AnimationPlayer
@export var forward_anim : AnimationPlayer
@export var backwards_anim : AnimationPlayer
@export var idle_anim : AnimationPlayer
@export var monocicle_anim : AnimationPlayer

func play_crab():
	forward_anim.stop()
	backwards_anim.stop()
	monocicle_anim.stop()
	idle_anim.stop()
	if (not crab_anim.is_playing()):
		crab_anim.play("anim")
	
func play_forward():
	crab_anim.stop()
	backwards_anim.stop()
	monocicle_anim.stop()
	idle_anim.stop()
	if (not forward_anim.is_playing()):
		forward_anim.play("anim")
	
func play_backwards():
	crab_anim.stop()
	forward_anim.stop()
	monocicle_anim.stop()
	idle_anim.stop()
	if (not backwards_anim.is_playing()):
		backwards_anim.play("anim")
		
func play_idle():
	crab_anim.stop()
	forward_anim.stop()
	backwards_anim.stop()
	monocicle_anim.stop()
	if (not idle_anim.is_playing()):
		idle_anim.play("anim")

func play_monocicle():
	crab_anim.stop()
	forward_anim.stop()
	backwards_anim.stop()
	idle_anim.stop()
	if (not monocicle_anim.is_playing()):
		monocicle_anim.play("anim")
