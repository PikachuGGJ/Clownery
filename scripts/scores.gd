extends Node2D

@onready var leaderBoard : RichTextLabel = $leaderboard
@onready var end_message : RichTextLabel= $end_message

# Called when the node enters the scene tree for the first time.
func _ready():
	ScoreManager.save_data()
	var scores = ScoreManager.get_scoreboard()
	for player in scores:
		var espacio_blanco: String = ""
		for i in range(20 - player[0].length()):
			espacio_blanco += " "
		leaderBoard.text += player[0] + espacio_blanco +"[color=pink]" + str(player[1]) + "[/color]\n"
	end_message.text = "Show is over, "+ ScoreManager.get_current_player() +"! \n Points: " + str(ScoreManager.get_current_score()) 
	

func _on_back_pressed():
	Telon.change_scene_to_file("res://scenes/menu.tscn")
