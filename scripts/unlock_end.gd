extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var goal: Area2D = $"../goal"
	if (body.name == "player"):
		# show the goal
		goal.visible = true
		# enable the goal
		goal.set_process(true)
