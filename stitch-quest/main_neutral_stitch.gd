extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()  # Start the audio

func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pause_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/pause.tscn")

func _on_mute_button_toggled(button_pressed):
	if button_pressed:
		$AudioStreamPlayer2D.volume_db = -80  # Mute the audio (set volume to minimum)
	else:
		$AudioStreamPlayer2D.volume_db = 0  # Unmute the audio (set volume back to normal)
