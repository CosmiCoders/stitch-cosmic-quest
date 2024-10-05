extends Node2D

var correct_answer = "Helium and hydrogen"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Correct.visible = false

# Handle when Button A is pressed
func _on_button_a_pressed() -> void:
	$wrong.play()
	$Wrong.visible = true
	
# Handle when Button B is pressed
func _on_button_b_pressed() -> void:
	$corr.play()
	$Correct.visible = true
	$Wrong.visible = true
	$Wrong2.visible = true
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/book_scene_4.tscn")
	
# Handle when Button C is pressed
func _on_button_c_pressed() -> void:
	$wrong.play()
	$Wrong2.visible = true
