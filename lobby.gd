extends Node
class_name MultiplayerLobby

signal player_joined(info:PlayerInfo)
signal player_list_updated(list:Dictionary[int, PlayerInfo])
signal player_left(id:int)

@export var own_info:PlayerInfo

#region connected_players
var connected_players:Dictionary[int, PlayerInfo]

func _serialize_connected_players() -> Dictionary[int, Dictionary]:
	var serialized_data:Dictionary[int, Dictionary] = {}
	for player in connected_players:
		serialized_data[player] = connected_players[player].to_dict()
	return serialized_data

func _deserialize_connected_players(dict:Dictionary[int, Dictionary]) -> Dictionary[int, PlayerInfo]:
	var deserialized_data:Dictionary[int, PlayerInfo] = {}
	for player in dict:
		deserialized_data[player] = PlayerInfo.new(dict[player])
	return deserialized_data
#endregion

@rpc("any_peer", "call_local", "reliable")
func join_lobby(player_info_dict:Dictionary) -> void:
	if multiplayer.is_server():
		update_player_info(player_info_dict)

@rpc("any_peer", "call_local", "reliable")
func update_player_info(player_info_dict:Dictionary):
	if multiplayer.is_server():
		var id = multiplayer.get_remote_sender_id()
		connected_players[id] = PlayerInfo.new(player_info_dict)
		update_player_list.rpc(_serialize_connected_players())

@rpc("authority", "call_local", "reliable")
func update_player_list(new_list:Dictionary[int, Dictionary]) -> void:
	connected_players = _deserialize_connected_players(new_list)
	player_list_updated.emit(connected_players)
