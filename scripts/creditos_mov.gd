extends Node2D

const section_time := 2.0
const line_time := 0.3
const base_speed := 100
const speed_up_multiplier := 10.0
const title_color := Color.BLUE_VIOLET

# var scroll_speed := base_speed
var speed_up := false

@onready var line := $contenedor/linea
var started := false

var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []

var credits = [
	[
		"Un juego del Equipo Pikachu"
	],[
		"Programación",
		"Salvador Romero Cortés",
		"Marcos Rico Guerra",
		"Miguel Garbín Batanero",
		"Sergio Blas Ríos"
	],[
		"Arte",
		"María Teresa Cañada Cámara",
		"Nicolás Hideo Vílchez Imanishi"
	],[
		"Imágenes",
		"https://unsplash.com/",
		"https://www.publicdomainpictures.net/en/",
		"https://pngimg.es/",
		"https://www.istockphoto.com/es"
	],[
		"Música",
		"Nicolás Hideo Vílchez Imanishi"
	],[
		"Efectos de sonido",
		"Sergio Blas Ríos"
	],[
		"Fuentes",
		"Inconsolata Monospace"
	],
	[
		"Herramientas",
		"Desarrollado con Godot Engine",
		"https://godotengine.org/license",
		"",
		"Arte creado con VoxEdit y MagicaVoxel",
		"https://www.voxedit.io/#/en/",
		"https://ephtracy.github.io/"
	]
]


func _process(delta):
	var scroll_speed = base_speed * delta
	
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	
	if speed_up:
		scroll_speed *= speed_up_multiplier
	
	if lines.size() > 0:
		for l in lines:
			l.position.y -= scroll_speed
			if l.position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()


func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	if curr_line == 0:
		# new_line.add_color_override("font_color", title_color)
		new_line.set("theme_override_colors/font_color", title_color)
	$contenedor.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true


func _unhandled_input(event):
	if event.is_action_pressed("ui_down") and !event.is_echo():
		speed_up = true
	if event.is_action_released("ui_down") and !event.is_echo():
		speed_up = false
