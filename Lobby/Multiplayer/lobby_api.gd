extends Node
class_name LobbyAPI

signal player_joined(info:MultiplayerClientInfo)
signal player_left(info:MultiplayerClientInfo)

var connected_players:Array[MultiplayerClientInfo]

func _ready() -> void:
	multiplayer.peer_connected.connect(_on_peer_connected)

func _on_peer_connected(pid:int):
	pass

@rpc("any_peer", "call_local", "reliable")
func join_lobby(player_info:MultiplayerClientInfo) -> void:
	push_error("This Function needs to be implemented by the SERVER")

@rpc("authority", "reliable")
func player_joined_lobby(player_info:MultiplayerClientInfo) -> void:
	push_error("This Function needs to be implemented by the CLIENT")

@rpc("authority", "reliable")
func update_player_info(player_info:MultiplayerClientInfo) -> void:
	push_error("This Function needs to be implemented by the CLIENT")

@rpc("authority", "reliable")
func update_player_list(player_list:Array[MultiplayerClientInfo]) -> void:
	push_error("This Function needs to be implemented by the CLIENT")
