extends Node
class_name MultiplayerLogic

@export var player_info:MultiplayerClientInfo = MultiplayerClientInfo.new()
@export var game_port:int = 6969
@export var max_clients:int = 10
@export var lobby:MultiplayerLobby

signal player_joined(info:MultiplayerClientInfo)
signal player_left(info:MultiplayerClientInfo)

var connected_players:Array[MultiplayerClientInfo]
var _pre_lobby:Array[int] = [1]

func _ready() -> void:
	multiplayer.peer_connected.connect(_on_peer_connected)

func _on_peer_connected(id) -> void:
	print("Peer "+str(id)+" connected")
	_pre_lobby.append(id)

func host() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(game_port, max_clients)
	multiplayer.multiplayer_peer = peer
	player_info.id = multiplayer.multiplayer_peer.get_unique_id()
	join_lobby(player_info)

func join() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_client("localhost", game_port)
	multiplayer.multiplayer_peer = peer
	player_info.id = multiplayer.multiplayer_peer.get_unique_id()
	join_lobby.rpc_id(1, player_info)


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
