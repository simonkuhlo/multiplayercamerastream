extends Node
class_name MultiplayerPreLobby

@export var game_port:int = 6969
@export var max_clients:int = 10
@export var lobby:MultiplayerLobby

func _ready() -> void:
	multiplayer.connected_to_server.connect(_on_server_connected)

func host() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(game_port, max_clients)
	multiplayer.multiplayer_peer = peer
	lobby.join_lobby(lobby.own_info.to_dict())

func join() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_client("localhost", game_port)
	multiplayer.multiplayer_peer = peer

func _on_server_connected() -> void:
	lobby.join_lobby.rpc_id(1, lobby.own_info.to_dict())
