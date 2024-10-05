extends Label

# Dialogue text

var dialogue = [
	"[Stitch wakes up in a glowing alien landscape. Stitch groggily lifts his head, blinking at his new surroundings.]",
	"Oww... What hit me? (looks around) Whoa... this isn't Hawaii! Lilo? Lilo?? (he pauses, listening) Uh-oh. I’m not on Earth anymore... I’m all alone on this weird planet.",
	"[Stitch notices your presence.]",
	"Hey! I’m Stitch! So… do you have any idea where we are?",
	"[You make a vague gesture, and Stitch’s eyes lock on something glowing in the distance. He points.]"
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
		get_tree().change_scene_to_file("res://scenes/main_happy_stitch.tscn")

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
