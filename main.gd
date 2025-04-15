extends Node


func _ready() -> void:
	Game_Root.to_main_menu()
	queue_free()
