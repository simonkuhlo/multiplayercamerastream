extends Node

@export var main_menu_scene:PackedScene
@export var lobby_scene:PackedScene
@export var user_space:UserSpace
@export var multiplayer_logic:MultiplayerLogic

func _ready() -> void:
	to_main_menu()

func to_lobby() -> void:
	user_space.switch_scene(lobby_scene.instantiate())

func to_main_menu() -> void:
	user_space.switch_scene(main_menu_scene.instantiate())

func join_level() -> void:
	pass
