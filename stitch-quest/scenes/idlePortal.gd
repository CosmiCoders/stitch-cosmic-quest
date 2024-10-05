extends Label
var dialogue = [
	"Rude much? What gives??",
	"[Suddenly, glowing alien symbols appear on the ground in front of the portal. Stitch squints at them.]",
	"Inscription (mysterious voice):",
	"“To open the portal, you must first answer: Where are you?”",
	"Great. Now we’ve gotta play alien trivia to get home. (thinks for a moment, tapping his chin)",
	"Wait... where are we? Hmm… this place feels...familiar.","YES! I know this place! It’s an exoplanet , Lilo and I read about exoplanets!.............."
]

var typing_speed = 0.05  # The delay between each letter (in seconds)
var current_text = ""     # Stores the current text being shown
var char_index = 0        # Keeps track of the current character index
var section_index = 0     # Keeps track of the current dialogue section
var is_typing = false     # Whether or not the dialogue is currently typing

# Called when the node enters the scene tree
func _ready():
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
		get_tree().change_scene_to_file("res://scenes/flashback_lilo.tscn")

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
