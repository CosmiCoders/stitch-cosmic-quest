extends Label

# Dialogue text
var dialogue = [
	"Terrestrial planets are Earth-sized and smaller, composed of rock, silicate, water, or carbon. Further investigation will determine whether some of them possess atmospheres, oceans, or other signs of habitability.",
	"Habitable terrestrial planets may be present in binary (two-star) systems.",
	"Kepler-11 b is a terrestrial planet 10 times closer to its star than Earth is to the Sun."
]

var typing_speed = 0.02 # The delay between each letter (in seconds)
var current_text = ""     # Stores the current text being shown
var char_index = 0        # Keeps track of the current character index
var section_index = 0     # Keeps track of the current dialogue section
var is_typing = false     # Whether or not the dialogue is currently typing

# Called when the node enters the scene tree
func _ready():
	# Change font color to black
	add_theme_color_override("font_color", Color.BLACK)
	display_next_section()

# Display the next section of the dialogue
func display_next_section():
	if section_index < dialogue.size():
		current_text = dialogue[section_index]
		char_index = 0
		text = ""
		is_typing = true
		section_index += 1
		typewrite_text() # Start typewriting effect
	else:
		# All sections have been shown, you can handle what happens next here
		get_tree().change_scene_to_file("res://scenes/quizz_4.tscn")

# Typewriting effect
func typewrite_text() -> void:
	while char_index < current_text.length():
		text += current_text[char_index]
		char_index += 1
		await get_tree().create_timer(typing_speed).timeout
	is_typing = false  # Finished typing this section

# Handle input for moving to the next section
func _input(event):
	if event.is_action_pressed("ui_accept") and not is_typing:
		display_next_section()
