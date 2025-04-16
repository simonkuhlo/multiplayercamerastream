extends VBoxContainer



@export var player_visualizer:PackedScene

func _ready() -> void:
	Game_Root.multiplayer_pre_lobby.lobby.player_list_updated.connect(_update_player_list)
	_update_player_list(Game_Root.multiplayer_pre_lobby.lobby.connected_players)

func _update_player_list(list:Dictionary[int, PlayerInfo]) -> void:
	for child in get_children():
		child.queue_free()
	for player in list:
		var instance:LobbyPlayerVisualizer = player_visualizer.instantiate()
		instance.player_info = list[player]
		add_child(instance)
