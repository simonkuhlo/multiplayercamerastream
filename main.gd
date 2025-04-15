extends Node


func _ready() -> void:
	Game_Root.to_lobby()
	queue_free()
