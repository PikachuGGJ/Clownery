extends RichTextLabel

func _ready():
	append_text("BBCode ")  # Trailing space separates words from each other.
	push_color(Color.GREEN)
	append_text("test ")  # Trailing space separates words from each other.
	push_italics()
	append_text("example")

	pop()  # Ends the tag opened by `push_italics()`.
	pop()  # Ends the tag opened by `push_color()`.
