extends Label
var dialogue = [
	"This one's a Super-Earth! Looks like home, but... spicier.",
	"It might even have things we haven’t discovered yet—alien creatures, hidden treasures, or maybe snacks? (winks) Gotta keep our priorities straight, right?",
	"[Stitch stands before the swirling, glowing portal, staring at the forcefield blocking his way.]",
	"Alright, brainiac. We’ve gotta figure out how to unlock this thing if we wanna get back to Lilo.",
	"[He glances around the alien landscape, noticing the strange red hue in the sky and the peculiar movement of the plants and creatures. He taps his chin, trying to piece it all together.]",
	"Wait a minute... look around! Something about this place feels really familiar. (pauses, thinking hard) The red sky, the weird wobbly light... and the creatures, they're acting different. Almost like...",
	"[Stitch’s eyes suddenly widen as he snaps his fingers.]",
	"I’ve got it! We’re on Proxima Centauri b! Lilo and I read about it—it’s a planet orbiting the closest star to Earth, Proxima Centauri. It’s only about 4 light-years away—our closest exoplanet neighbor!",
	"[He turns back to the portal, full of energy now.]",
	"This planet is super close to its star, so everything here is kinda different from what we’re used to on Earth. The red light in the sky? That’s the light from Proxima Centauri, a red dwarf star. And the wobbly movements? That’s because the star flares up sometimes, messing with everything on the planet!",
	"The portal asks other questions here (rest of the questions)",
	"[As Stitch speaks, the inscription near the portal glows brighter, as if reacting to his words.]",
	"It’s working! That’s the answer! We’re on Proxima Centauri b! (turns to the audience) We figured it out!",
	"[The forcefield flickers and vanishes, revealing the fully active portal. Stitch steps closer, a grin spreading across his face.]",
	"YES! We did it! The portal’s open! Looks like teamwork really does make the dream work, huh?",
	"[Stitch looks back at the alien landscape one last time, with a mix of excitement and nostalgia.]",
	"Man, what a crazy adventure! But now it’s time to get back to Earth… and to Lilo. (He winks at the audience.) Thanks for your help, buddy! I couldn’t have done it without you.",
	"[The screen fades to black, and the words 'To be continued...' appear, hinting at more adventures to come.]"
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
		get_tree().change_scene_to_file("res://scenes/")

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