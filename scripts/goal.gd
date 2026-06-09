extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# See here for string concatonation reference: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_format_string.html
	# print("Debug - Body `%s` entered goal" % body.name)
	if body.name == "player":
		# switch to end scene
		get_tree().change_scene_to_file("res://scenes/end.tscn")
