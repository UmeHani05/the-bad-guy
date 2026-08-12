extends Control

func _ready() -> void:
	print("MAIN MENU IS WORKING")

	var music_bus = AudioServer.get_bus_index("Music")
	var current_volume_db = AudioServer.get_bus_volume_db(music_bus)

	$SettingsPopup/VBoxContainer/HSlider.value = db_to_linear(current_volume_db)

func _on_settings_pressed() -> void:
	print("SETTINGS BUTTON WORKS")
	$SettingsPopup.show()

func _on_close_button_pressed() -> void:
	print("CLOSE BUTTON WORKS")
	$SettingsPopup.hide()


func _on_h_slider_value_changed(value: float) -> void:
	var music_bus = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/gameplay.tscn")
