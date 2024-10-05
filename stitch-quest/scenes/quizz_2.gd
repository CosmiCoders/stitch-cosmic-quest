extends Node2D

var correct_answer = "A hot Jupiter"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Correct.visible = false

# Handle when Button A is pressed
func _on_button_a_pressed() -> void:
	$wrong.play()
	$Wrong.visible = true
	
# Handle when Button B is pressed
func _on_button_b_pressed() -> void:
	$wrong.play()
	$Wrong2.visible = true
	
# Handle when Button C is pressed
func _on_button_c_pressed() -> void:
	$corr.play()
	$Correct.visible = true
	$Wrong.visible = true
	$Wrong2.visible = true
	get_tree().change_scene_to_file("res://scenes/final_seen_end.tscn")
	
