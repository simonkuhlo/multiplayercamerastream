extends Node
class_name MultiplayerLobby

@export var player_info:MultiplayerClientInfo = MultiplayerClientInfo.new()

@export var game_port:int = 6969

@export var max_clients:int = 10

func _ready() -> void:
	multiplayer.peer_connected.connect(_on_peer_connected)

func _on_peer_connected(id) -> void:
	print("Peer "+str(id)+" connected")

func _host() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(game_port, max_clients)
	multiplayer.multiplayer_peer = peer

func _join() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_client("localhost", game_port)
	multiplayer.multiplayer_peer = peer
