extends Control
const URL = " https://science.nasa.gov/exoplanets/"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_url_button_pressed() -> void:
	OS.shell_open(URL)


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/pause.tscn")
