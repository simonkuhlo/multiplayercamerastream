extends Resource
class_name PlayerInfo

enum PlayerRole {SPEC, EXEC, MAN}

@export var player_name:String = "Stranger"
@export var player_role:PlayerRole = PlayerRole.SPEC

func _init(dict:Dictionary = {}) -> void:
	if dict.has("name"):
		player_name = dict["name"]
	if dict.has("role"):
		player_role = dict["role"]

func to_dict():
	return {
		"name" : player_name,
		"role" : player_role
	}
