extends HBoxContainer
class_name LobbyPlayerVisualizer

@export var name_label:Label = Label.new()

var player_info:MultiplayerClientInfo:
	set(new_player_info):
		player_info = new_player_info
		name_label.text = player_info.name

func _ready() -> void:
	if name_label not in get_children():
		add_child(name_label)
