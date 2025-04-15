extends Control


func _on_join_button_pressed() -> void:
	Game_Root.multiplayer_logic.join()
	Game_Root.to_lobby()


func _on_host_button_pressed() -> void:
	Game_Root.multiplayer_logic.host()
	Game_Root.to_lobby()
