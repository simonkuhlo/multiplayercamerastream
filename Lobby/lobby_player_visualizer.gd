extends HBoxContainer
class_name LobbyPlayerVisualizer

@export var name_label:Label
@export var color_rect:ColorRect

var player_info:PlayerInfo:
	set(new_player_info):
		player_info = new_player_info
		name_label.text = player_info.player_name
		match new_player_info.player_role:
			0:
				color_rect.color = Color("ffffff")
			1:
				color_rect.color = Color("fbb988")
			2:
				color_rect.color = Color("7edae9")

func _ready() -> void:
	if name_label not in get_children():
		add_child(name_label)
