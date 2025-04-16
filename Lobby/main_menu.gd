extends Control


func _on_join_button_pressed() -> void:
	Game_Root.multiplayer_pre_lobby.join()
	Game_Root.to_lobby()


func _on_host_button_pressed() -> void:
	Game_Root.multiplayer_pre_lobby.host()
	Game_Root.to_lobby()
