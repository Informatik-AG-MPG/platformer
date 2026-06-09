extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("Hello")
	print(body.name)
	if body.name == "player":
		print("cool")
		get_tree().change_scene_to_file("res://scenes/end.tscn")
