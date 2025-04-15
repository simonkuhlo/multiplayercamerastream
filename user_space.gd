extends Node
class_name UserSpace


func switch_scene(new_scene:Node):
	for child in get_children():
		child.queue_free()
	add_child(new_scene)
