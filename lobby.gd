extends Node
class_name MultiplayerLobby

signal player_joined(info:MultiplayerClientInfo)
signal player_left(info:MultiplayerClientInfo)

var connected_players:Array[MultiplayerClientInfo]
var _pre_lobby:Array[int] = [1]

func _ready() -> void:
	multiplayer.peer_connected.connect(_on_peer_connected)

func _on_peer_connected(pid:int):
	_pre_lobby.append(pid)

@rpc("any_peer", "call_local", "reliable")
func join_lobby(player_info:MultiplayerClientInfo) -> void:
	if multiplayer.is_server():
		if player_info.id in _pre_lobby:
			_pre_lobby.erase(player_info.id)
			player_joined_lobby.rpc(player_info)

@rpc("authority", "call_local", "reliable")
func player_joined_lobby(player_info:MultiplayerClientInfo) -> void:
	connected_players.append(player_info)
	player_joined.emit(player_info)
