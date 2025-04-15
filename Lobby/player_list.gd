extends VBoxContainer

var connected_players:Array[MultiplayerClientInfo] = []

@export var player_visualizer:PackedScene

func _ready() -> void:
	_update_player_list()

func _update_player_list() -> void:
	for child in get_children():
		child.queue_free()
	for player in connected_players:
		var instance:LobbyPlayerVisualizer = player_visualizer.instantiate()
		instance.player_info = player
