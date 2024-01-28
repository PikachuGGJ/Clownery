extends Node

@export var currentPlayer : String
@onready var requests = $requests

var scores : Dictionary = {}

func _ready():
	load_data()	

func set_player_name(pname):
	currentPlayer= pname

func store_score(score):
	scores[currentPlayer] = score

func to_http_string() -> String:
	var list = []
	for player in scores:
		list.push_back({"PlayerName": player, "Score": scores[player]})
	return JSON.stringify(list)
	
func save_data():
	var file = FileAccess.open("user://settings.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(scores))
	print(JSON.stringify(scores))
	file.close()
	var headers = ["Content-Type: application/json", 
	"apiKey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtzbXJtYWdmd3FseGNkbmpvdnNmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY0Mzg3ODUsImV4cCI6MjAyMjAxNDc4NX0.tbO21rGiKfyc0uhVKkDvCIpGWjaWJh2d5LAy29sVhSs",
	"Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtzbXJtYWdmd3FseGNkbmpvdnNmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY0Mzg3ODUsImV4cCI6MjAyMjAxNDc4NX0.tbO21rGiKfyc0uhVKkDvCIpGWjaWJh2d5LAy29sVhSs",
	"Prefer: return=minimal"]
	var json = to_http_string()
	requests.request("https://ksmrmagfwqlxcdnjovsf.supabase.co/rest/v1/Scoreboard", headers, HTTPClient.METHOD_POST, json)
	
func load_data():
	var file = FileAccess.open("user://settings.json", FileAccess.READ)
	if (file != null):
		scores = JSON.parse_string(file.get_as_text())
		print(file.get_as_text())	
		file.close()
	else:
		print("No se enconró el fichero de guardado")
		scores = {}
	var headers = ["apiKey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtzbXJtYWdmd3FseGNkbmpvdnNmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY0Mzg3ODUsImV4cCI6MjAyMjAxNDc4NX0.tbO21rGiKfyc0uhVKkDvCIpGWjaWJh2d5LAy29sVhSs",
	"Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtzbXJtYWdmd3FseGNkbmpvdnNmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY0Mzg3ODUsImV4cCI6MjAyMjAxNDc4NX0.tbO21rGiKfyc0uhVKkDvCIpGWjaWJh2d5LAy29sVhSs"]
	requests.request("https://ksmrmagfwqlxcdnjovsf.supabase.co/rest/v1/Scoreboard", headers, HTTPClient.METHOD_GET)
func get_scoreboard() -> Array:
	var ordered = []
	for player in scores:
		ordered.push_back([player, scores[player]])
	ordered.sort_custom(func(a, b): return a[1] > b[1])
	return ordered

func get_current_score():
	return scores[currentPlayer]


func _on_requests_request_completed(result, response_code, headers, body):
	print(result)
	print(response_code)
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
